Coherence Depth Artifact
========================

This repository is a compact artifact for the paper source
paper/1_coherence_depth.tex and the theorem-facing Cubical Agda code used by
that paper.

The broader development repository is:

  https://github.com/efficient-novelty/mechanization

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

runs/coherence_depth_case_studies/
  YAML fixtures used by the audit script.

scripts/
  check_coherence_depth_artifact.sh
  coherence_depth_audit.py


Requirements
------------

- Agda 2.8.0, or the Agda version recorded in agda/library_manifest.json.
- The Cubical Agda library installed and available as library name "cubical".
- Python 3.
- For the shell convenience script: Git Bash, WSL, or another bash environment.
- For paper compilation: a LaTeX installation with BibTeX.


Artifact checks
---------------

From Git Bash or WSL:

  cd /c/dev/coherence-depth
  bash scripts/check_coherence_depth_artifact.sh

Equivalent core checks from PowerShell:

  cd C:\dev\coherence-depth
  python scripts\coherence_depth_audit.py runs\coherence_depth_case_studies
  cd agda
  agda --transliterate PEN.agda
  agda --transliterate Test/MetatheorySmoke.agda
  agda --transliterate Test/PresentationInvariance/Smoke.agda
  agda --transliterate Geometry/Clutching.agda
  agda --transliterate Test/ClutchingSmoke.agda
  agda --transliterate Test/Fibonacci.agda

The full theorem-facing module list is in docs/theorem_index.md.


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

That file maps paper claims to Agda modules and theorem names. The artifact
check scans the theorem-facing Agda modules for postulates and runs the
case-study fixture audit.

The paper text discusses postulates in the broader development repository.
Those auxiliary development files are not included in this artifact.
