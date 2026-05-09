Coherence Depth Artifact
========================

This repository is a compact artifact for the paper source
paper/1_coherence_depth.tex and the theorem-facing Cubical Agda code used by
that paper.

The broader development repository is:

  https://github.com/efficient-novelty/mechanization

The public artifact repository for this folder is:

  https://github.com/efficient-novelty/coherence-depth

This artifact intentionally contains only the paper source, direct TeX
dependencies, theorem-facing Agda modules, audit scripts, theorem-map
documentation, and small case-study fixtures.


Directory layout
----------------

paper/
  1_coherence_depth.tex
  coherence_depth_refs.bib
  lmcs.cls

agda/
  Everything.agda
  PEN.agda
  pen.agda-lib
  Core/
  Metatheory/
  Geometry/
  CaseStudies/
  ObligationGraph/
  Saturation/
  Adjunction/
  Test/

docs/
  coherence_depth_trust_boundary.md
  theorem_index.md

paper-map.yaml
coherence-depth.agda-lib
Makefile
.github/workflows/artifact-check.yml

runs/coherence_depth_case_studies/
  YAML fixtures used by the audit script.

scripts/
  check_coherence_depth_artifact.sh
  coherence_depth_audit.py
  audit_postulates.py
  check_paper_map.py


Requirements
------------

- Agda 2.8.0, or the Agda version recorded in agda/library_manifest.json.
- Cubical Agda library cubical-0.9. The local artifact was checked against
  https://github.com/agda/cubical.git commit
  b150186d2544e7efeddd31e5d14a8b9ecbb100f7.
- Python 3.
- For the shell convenience script: Git Bash, WSL, or another bash environment.
- For paper compilation: a LaTeX installation with BibTeX.


Artifact checks
---------------

From Git Bash or WSL:

  cd /c/dev/coherence-depth
  bash scripts/check_coherence_depth_artifact.sh

If GNU make is available:

  make artifact-check

Equivalent core checks from PowerShell:

  cd C:\dev\coherence-depth
  python scripts\check_paper_map.py paper-map.yaml
  python scripts\audit_postulates.py agda paper-map.yaml
  python scripts\coherence_depth_audit.py runs\coherence_depth_case_studies
  cd agda
  agda --transliterate Everything.agda
  agda --transliterate PEN.agda
  agda --transliterate Test/MetatheorySmoke.agda
  agda --transliterate Test/PresentationInvariance/Smoke.agda
  agda --transliterate Geometry/Clutching.agda
  agda --transliterate Test/ClutchingSmoke.agda
  agda --transliterate Test/Fibonacci.agda

The full theorem-facing module list is in docs/theorem_index.md.

Observed build time on this machine on 2026-05-09, with Agda interface files
already warm, was 30.3 seconds for `bash scripts/check_coherence_depth_artifact.sh`.
A clean Cubical/Agda interface cache can take longer because the Cubical library
interfaces must be rebuilt.


Continuous integration
----------------------

The hosted artifact check is configured in:

  .github/workflows/artifact-check.yml

It installs Agda 2.8.0, checks out Cubical Agda at commit
`b150186d2544e7efeddd31e5d14a8b9ecbb100f7`, registers both the `cubical` and
`cubical-0.9` library names used by the local artifact files, and runs:

  bash scripts/check_coherence_depth_artifact.sh

Workflow run page:

  https://github.com/efficient-novelty/coherence-depth/actions/workflows/artifact-check.yml

Badge URL:

  https://github.com/efficient-novelty/coherence-depth/actions/workflows/artifact-check.yml/badge.svg


Paper build
-----------

From PowerShell:

  cd C:\dev\coherence-depth\paper
  pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth.tex
  bibtex 1_coherence_depth
  pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth.tex
  pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth.tex


Trust boundary
--------------

The theorem-facing trust boundary is documented in:

  docs/coherence_depth_trust_boundary.md

The machine-readable map is:

  paper-map.yaml

The map records paper claims, paper labels, Agda modules, theorem names,
formalization status, bridge use, and trusted inputs. The artifact check runs
scripts/check_paper_map.py against this map, runs
scripts/audit_postulates.py over the transitive theorem-facing import closure,
and runs the case-study fixture audit.

What is formalized:

  - the fixed raw extension-calculus bridge for the declared raw grammar;
  - canonical trace presentations and mu invariance;
  - horn reduction, exact depth-two stabilization, chronological windows, and
    the binary lower-bound packages;
  - sparse and fully coupled recurrence packages and arithmetic corollaries;
  - the theorem-facing case-study summaries.

What is not formalized:

  - a parser or elaborator for arbitrary Cubical Agda programs;
  - a transfer theorem for all cubical calculi or arbitrary HoTT;
  - a claim that ordinary transparent user libraries grow according to the
    full-coupling recurrence.

The paper text discusses postulates in the broader development repository.
Those auxiliary development files are not included in this artifact.

To locate paper theorem numbers such as Theorem 4.13, Theorem 4.17, and
Theorem 5.1, search paper-map.yaml for the paper label used in the TeX source
or search docs/theorem_index.md for the Agda theorem name printed in the paper's
mechanization table.
