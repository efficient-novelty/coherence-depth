#!/usr/bin/env python3
"""Check the machine-readable paper-to-Agda theorem map.

The map is stored as JSON-compatible YAML so this script has no dependency on
PyYAML. It verifies that referenced paper labels, Agda files, and theorem names
exist in the local artifact.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path
from typing import Any


REQUIRED_ENTRY_FIELDS = {
    "paper_claim",
    "paper_labels",
    "agda_modules",
    "agda_theorems",
    "status",
    "formal_status",
    "uses_bridge",
    "trusted_inputs",
}

ALLOWED_STATUSES = {
    "fully mechanized",
    "mechanized for an abstract interface",
    "conditional on adequacy",
    "paper-only",
}
ALLOWED_FORMAL_STATUSES = {
    "checked-internal",
    "checked-actual-cubical",
    "checked-adequacy-instance",
    "semantic-assumption",
    "paper-level-interpretation",
}
BRIDGE_BOUNDARY_KEYWORDS = (
    "adequacy",
    "bridge",
    "canonical trace",
    "counted active interface",
)


def load_map(path: Path) -> dict[str, Any]:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        raise SystemExit(
            f"{path}: expected JSON-compatible YAML; parse failed at "
            f"line {exc.lineno}, column {exc.colno}: {exc.msg}"
        ) from exc


def as_list(entry: dict[str, Any], field: str) -> list[str]:
    value = entry.get(field)
    if not isinstance(value, list) or not all(isinstance(item, str) for item in value):
        raise ValueError(f"{field} must be a list of strings")
    return value


def check_label(paper_text: str, label: str) -> bool:
    return f"\\label{{{label}}}" in paper_text or f"\\section{{{label}}}" in paper_text


def check_theorem_name(contents: dict[Path, str], name: str) -> bool:
    pattern = re.compile(rf"(?<![A-Za-z0-9_-]){re.escape(name)}(?![A-Za-z0-9_-])")
    return any(pattern.search(text) for text in contents.values())


def theorem_like_labels(paper_text: str) -> set[str]:
    return {
        match.group(1)
        for match in re.finditer(r"\\label\{((?:thm|lem|cor|prop):[^}]+)\}", paper_text)
    }


def mentions_bridge_boundary(entry: dict[str, Any], trusted_inputs: list[str]) -> bool:
    detail = entry.get("status_detail")
    parts = trusted_inputs + ([detail] if isinstance(detail, str) else [])
    haystack = " ".join(parts).lower()
    return any(keyword in haystack for keyword in BRIDGE_BOUNDARY_KEYWORDS)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("map", nargs="?", default="paper-map.yaml")
    args = parser.parse_args()

    root = Path.cwd()
    map_path = (root / args.map).resolve()
    data = load_map(map_path)
    agda_root = (map_path.parent / data.get("agda_root", "agda")).resolve()
    paper_path = (map_path.parent / data.get("paper", "paper/1_coherence_depth.tex")).resolve()
    entries = data.get("theorems")

    errors: list[str] = []
    if not isinstance(entries, list) or not entries:
        errors.append("theorems must be a non-empty list")
        entries = []

    if not paper_path.exists():
        errors.append(f"missing paper file: {paper_path}")
        paper_text = ""
    else:
        paper_text = paper_path.read_text(encoding="utf-8")

    checked_modules: set[Path] = set()
    checked_names = 0
    mapped_labels: set[str] = set()

    for index, raw_entry in enumerate(entries, start=1):
        if not isinstance(raw_entry, dict):
            errors.append(f"entry {index}: must be an object")
            continue

        missing = REQUIRED_ENTRY_FIELDS - set(raw_entry)
        if missing:
            errors.append(f"entry {index}: missing fields: {', '.join(sorted(missing))}")
            continue

        claim = raw_entry["paper_claim"]
        if not isinstance(claim, str) or not claim:
            errors.append(f"entry {index}: paper_claim must be a non-empty string")

        if not isinstance(raw_entry["status"], str) or not raw_entry["status"]:
            errors.append(f"entry {index}: status must be a non-empty string")
        elif raw_entry["status"] not in ALLOWED_STATUSES:
            allowed = ", ".join(sorted(ALLOWED_STATUSES))
            errors.append(
                f"entry {index} ({claim}): status must be one of: {allowed}"
            )

        formal_status = raw_entry.get("formal_status")
        if not isinstance(formal_status, str) or not formal_status:
            errors.append(f"entry {index} ({claim}): formal_status must be a non-empty string")
        elif formal_status not in ALLOWED_FORMAL_STATUSES:
            allowed = ", ".join(sorted(ALLOWED_FORMAL_STATUSES))
            errors.append(
                f"entry {index} ({claim}): formal_status must be one of: {allowed}"
            )

        detail = raw_entry.get("status_detail")
        if detail is not None and (not isinstance(detail, str) or not detail):
            errors.append(f"entry {index} ({claim}): status_detail must be a non-empty string")

        if not isinstance(raw_entry["uses_bridge"], bool):
            errors.append(f"entry {index}: uses_bridge must be a boolean")

        try:
            labels = as_list(raw_entry, "paper_labels")
            modules = as_list(raw_entry, "agda_modules")
            names = as_list(raw_entry, "agda_theorems")
            trusted_inputs = as_list(raw_entry, "trusted_inputs")
        except ValueError as exc:
            errors.append(f"entry {index} ({claim}): {exc}")
            continue

        if not trusted_inputs:
            errors.append(f"entry {index} ({claim}): trusted_inputs must not be empty")

        if isinstance(formal_status, str) and formal_status.startswith("checked-"):
            if not modules:
                errors.append(
                    f"entry {index} ({claim}): checked formal status must list Agda modules"
                )

        if formal_status == "semantic-assumption" and raw_entry["status"] == "fully mechanized":
            errors.append(
                f"entry {index} ({claim}): semantic assumptions must not be reported as fully mechanized"
            )

        broad_text = " ".join([claim, *labels]).lower()
        if (
            ("arbitrary cubical agda" in broad_text or "broad cubical" in broad_text)
            and formal_status not in {"semantic-assumption", "checked-adequacy-instance"}
        ):
            errors.append(
                f"entry {index} ({claim}): broad Cubical Agda/CCHM claim needs adequacy-instance or semantic-assumption status"
            )

        if raw_entry["status"] == "conditional on adequacy":
            if not raw_entry["uses_bridge"]:
                errors.append(
                    f"entry {index} ({claim}): conditional adequacy result must set uses_bridge=true"
                )
            if not mentions_bridge_boundary(raw_entry, trusted_inputs):
                errors.append(
                    f"entry {index} ({claim}): conditional adequacy result must name the bridge or adequacy boundary"
                )

        if raw_entry["uses_bridge"] and not mentions_bridge_boundary(raw_entry, trusted_inputs):
            errors.append(
                f"entry {index} ({claim}): uses_bridge=true but trusted_inputs/status_detail do not name the bridge boundary"
            )

        for label in labels:
            mapped_labels.add(label)
            if not check_label(paper_text, label):
                errors.append(f"entry {index} ({claim}): paper label not found: {label}")

        module_contents: dict[Path, str] = {}
        for module in modules:
            module_path = (agda_root / module).resolve()
            if not module_path.exists():
                errors.append(f"entry {index} ({claim}): Agda module not found: {module}")
                continue
            checked_modules.add(module_path)
            module_contents[module_path] = module_path.read_text(encoding="utf-8")

        for name in names:
            checked_names += 1
            if not module_contents:
                continue
            if not check_theorem_name(module_contents, name):
                errors.append(
                    f"entry {index} ({claim}): Agda name not found in listed modules: {name}"
                )

    for label in sorted(theorem_like_labels(paper_text) - mapped_labels):
        errors.append(f"paper theorem-like label is missing from theorem map: {label}")

    if errors:
        for error in errors:
            print(f"ERROR: {error}", file=sys.stderr)
        return 1

    print(
        "paper-map check passed: "
        f"{len(entries)} entries, {len(checked_modules)} modules, {checked_names} names"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
