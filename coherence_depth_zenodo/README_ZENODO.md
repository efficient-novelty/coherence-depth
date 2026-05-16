# Coherence Depth Zenodo Package

This folder is the archival package for the LMCS submission version of
"Toward Coherence Depth Two for Cubical Sealed Extensions".

The LMCS paper source is:

```text
paper/1_coherence_depth_LMCS.tex
```

The compiled 47-page submission PDF is:

```text
paper/1_coherence_depth_LMCS.pdf
```

The package also includes `paper/1_coherence_depth.tex`, the fuller
theorem-map source used by `paper-map.yaml` and the artifact checker.  The LMCS
submission source is the `_LMCS` file above.

## Contents

- `paper/`: LMCS paper source, compiled PDF, theorem-map TeX source,
  bibliography, LMCS class file, and submission helper notes.
- `agda/`: theorem-facing Cubical Agda development and smoke tests.
- `docs/`: theorem index and trust-boundary documentation.
- `scripts/`: artifact checking, theorem-map checking, postulate audit, and
  case-study audit scripts.
- `runs/coherence_depth_case_studies/`: YAML fixtures used by the audit script.
- `paper-map.yaml`: machine-readable paper-to-artifact theorem map.
- `Makefile`: convenience targets, including `artifact-check`.
- `.github/workflows/artifact-check.yml`: CI recipe for the artifact check.

## Main Check

From the package root, run:

```bash
bash scripts/check_coherence_depth_artifact.sh
```

or, if GNU make is available:

```bash
make artifact-check
```

The check typechecks the aggregate Agda modules, verifies the paper-to-Agda map,
audits the theorem-facing import closure for local postulates and local
primitive declarations, and runs the case-study fixture audit.

## Requirements

See `README.txt` for the full environment notes. In brief, the artifact expects
Agda 2.8.0 and Cubical Agda `cubical-0.9` at the commit recorded in
`agda/library_manifest.json`.

## Archival Citation

Reserved Zenodo DOI:

```text
10.5281/zenodo.20235005
```

DOI URL:

```text
https://doi.org/10.5281/zenodo.20235005
```

The archival release tag and hosted artifact-check workflow URL are still
release-blocking metadata.  After publishing the Zenodo draft, cite the
versioned Zenodo DOI and record the final tag/workflow URL with the release.
