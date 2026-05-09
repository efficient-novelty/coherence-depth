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
    "uses_bridge",
    "trusted_inputs",
}


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

        for label in labels:
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
