#!/usr/bin/env python3
"""Audit postulates over the theorem-facing transitive import closure."""

from __future__ import annotations

import argparse
import json
import re
import sys
from collections import deque
from pathlib import Path
from typing import Any, Iterable


IMPORT_RE = re.compile(r"(?m)^\s*(?:open\s+)?import\s+([A-Za-z0-9_.]+)")
MODULE_RE = re.compile(r"(?m)^\s*module\s+([A-Za-z0-9_.]+)\s+where\b")
POSTULATE_RE = re.compile(r"(?m)^\s*postulate\b")
PRIMITIVE_RE = re.compile(r"(?m)^\s*primitive(?:\s|$)")
OPTIONS_RE = re.compile(r"\{-#\s*OPTIONS\s+([^#]*)#-\}", re.MULTILINE)
ALLOWED_STATUSES = {
    "fully mechanized",
    "mechanized for an abstract interface",
    "conditional on adequacy",
    "paper-only",
}


def load_map(path: Path) -> dict[str, Any]:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        raise SystemExit(
            f"{path}: expected JSON-compatible YAML; parse failed at "
            f"line {exc.lineno}, column {exc.colno}: {exc.msg}"
        ) from exc


def strip_agda_comments(text: str) -> str:
    result: list[str] = []
    index = 0
    block_depth = 0
    while index < len(text):
        two = text[index : index + 2]
        if block_depth:
            if two == "{-":
                block_depth += 1
                index += 2
            elif two == "-}":
                block_depth -= 1
                index += 2
            else:
                result.append("\n" if text[index] == "\n" else " ")
                index += 1
            continue

        if two == "{-":
            block_depth = 1
            result.extend("  ")
            index += 2
        elif two == "--":
            newline = text.find("\n", index)
            if newline == -1:
                break
            result.append("\n")
            index = newline + 1
        else:
            result.append(text[index])
            index += 1
    return "".join(result)


def module_to_path(agda_root: Path, module: str) -> Path:
    return agda_root / Path(*module.split(".")).with_suffix(".agda")


def path_to_module(agda_root: Path, path: Path) -> str:
    rel = path.resolve().relative_to(agda_root.resolve()).with_suffix("")
    return ".".join(rel.parts)


def is_relative_to(path: Path, root: Path) -> bool:
    try:
        path.resolve().relative_to(root.resolve())
        return True
    except ValueError:
        return False


def read_module_name(path: Path, fallback: str) -> str:
    text = path.read_text(encoding="utf-8")
    match = MODULE_RE.search(strip_agda_comments(text))
    return match.group(1) if match else fallback


def is_external_trusted(module: str, prefixes: Iterable[str]) -> bool:
    return any(module.startswith(prefix) for prefix in prefixes)


def entry_module_paths(agda_root: Path, data: dict[str, Any]) -> list[Path]:
    paths: list[Path] = []
    for target in data.get("entry_points", []):
        if isinstance(target, str):
            paths.append(agda_root / target)
    for entry in data.get("theorems", []):
        if isinstance(entry, dict):
            for module in entry.get("agda_modules", []):
                if isinstance(module, str):
                    paths.append(agda_root / module)
    deduped: list[Path] = []
    seen: set[Path] = set()
    for path in paths:
        resolved = path.resolve()
        if resolved not in seen:
            seen.add(resolved)
            deduped.append(resolved)
    return deduped


def options_have_safe(raw_text: str) -> bool:
    return any("--safe" in match.group(1).split() for match in OPTIONS_RE.finditer(raw_text))


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("agda_root", nargs="?", default="agda")
    parser.add_argument("paper_map", nargs="?", default="paper-map.yaml")
    args = parser.parse_args()

    root = Path.cwd()
    agda_root = (root / args.agda_root).resolve()
    map_path = (root / args.paper_map).resolve()
    data = load_map(map_path)
    trusted_prefixes = data.get("trusted_external_prefixes", ["Agda.", "Cubical."])
    if not isinstance(trusted_prefixes, list):
        trusted_prefixes = ["Agda.", "Cubical."]

    errors: list[str] = []
    for index, entry in enumerate(data.get("theorems", []), start=1):
        if isinstance(entry, dict):
            status = entry.get("status")
            if status not in ALLOWED_STATUSES:
                allowed = ", ".join(sorted(ALLOWED_STATUSES))
                errors.append(
                    f"paper-map entry {index}: status must be one of: {allowed}"
                )

    queue: deque[Path] = deque(entry_module_paths(agda_root, data))
    seen: set[Path] = set()
    reports: list[dict[str, Any]] = []
    trusted_external_imports: set[str] = set()

    while queue:
        path = queue.popleft().resolve()
        if path in seen:
            continue
        seen.add(path)

        if not path.exists():
            errors.append(f"missing theorem-facing module: {path}")
            continue
        if not is_relative_to(path, agda_root):
            errors.append(f"module outside Agda root: {path}")
            continue

        fallback_module = path_to_module(agda_root, path)
        raw_text = path.read_text(encoding="utf-8")
        stripped = strip_agda_comments(raw_text)
        module_name = read_module_name(path, fallback_module)
        imports = IMPORT_RE.findall(stripped)
        local_imports: list[str] = []
        untrusted_external_imports: list[str] = []

        for imported in imports:
            imported_path = module_to_path(agda_root, imported).resolve()
            if imported_path.exists():
                local_imports.append(imported)
                if imported_path not in seen:
                    queue.append(imported_path)
            elif is_external_trusted(imported, trusted_prefixes):
                trusted_external_imports.add(imported)
            else:
                untrusted_external_imports.append(imported)

        uses_postulate = bool(POSTULATE_RE.search(stripped))
        uses_primitive = bool(PRIMITIVE_RE.search(stripped))
        safe = options_have_safe(raw_text)

        if uses_postulate:
            errors.append(f"{module_name}: uses postulate")
        if uses_primitive:
            errors.append(f"{module_name}: declares primitive")
        if not safe:
            errors.append(f"{module_name}: missing --safe option")
        if untrusted_external_imports:
            errors.append(
                f"{module_name}: untrusted external imports: "
                + ", ".join(sorted(untrusted_external_imports))
            )

        reports.append(
            {
                "module": module_name,
                "file": str(path.relative_to(root)),
                "postulate": uses_postulate,
                "primitive": uses_primitive,
                "safe": safe,
                "local_imports": len(local_imports),
                "trusted_external_imports": sorted(
                    imported
                    for imported in imports
                    if is_external_trusted(imported, trusted_prefixes)
                ),
            }
        )

    for report in sorted(reports, key=lambda item: item["module"]):
        external = "yes" if report["trusted_external_imports"] else "no"
        print(
            f"{report['module']}: postulate={report['postulate']} "
            f"primitive={report['primitive']} safe={report['safe']} "
            f"local-imports={report['local_imports']} "
            f"trusted-external-imports={external}"
        )

    if trusted_external_imports:
        print(
            "trusted external imports: "
            + ", ".join(sorted(trusted_external_imports))
        )

    if errors:
        for error in errors:
            print(f"ERROR: {error}", file=sys.stderr)
        return 1

    print(f"postulate audit passed: {len(reports)} local modules in transitive closure")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
