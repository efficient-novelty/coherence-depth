# LMCS Artifact Guide

This guide holds the material removed from the LMCS paper appendix. The paper
keeps only the short mechanization and trusted-boundary section; this file gives
reviewers the operational map for the archived artifact.

## Artifact Layers

The formalization has four layers.

1. The cubical core layer checks open-box and horn-computation arguments using
   Cubical Agda interval, partial elements, composition, filling, transport,
   paths, and univalence infrastructure.
2. The fixed-calculus layer checks raw syntax, typing roles, normalized trace
   presentations, primitive-versus-derived classification, and `mu`-invariance
   statements for `C_ext`.
3. The bridge layer checks selected surface presentations, especially the modal
   fragment SMod, and records where broader semantic transfer remains an
   adequacy assumption.
4. The counting and audit layer checks sparse footprints, the full-coupling
   envelope, recurrence arithmetic, refactoring invariance, abstraction
   barriers, and case-study fixtures.

These layers should not be collapsed into one status. A postulate-free theorem
about a fixed record interface is not the same claim as a parser, elaborator, or
transfer theorem for arbitrary Cubical Agda programs.

## Status Vocabulary

The theorem map uses four status values.

| Status | Meaning |
|---|---|
| fully mechanized | The paper claim, in the row's stated scope, is checked by the listed Agda definitions and theorem names. |
| mechanized for an abstract interface | Agda checks an interface theorem or record-parametric theorem; the paper separately justifies that the intended calculus instantiates the interface. |
| conditional on adequacy | The result follows once the named adequacy bridge is supplied for the intended semantic or surface-language reading. |
| paper-only | The proof, submission requirement, or explanatory claim is in the paper or package documentation rather than in Agda. |

The postulate audit is reported separately from these statuses.

## Trusted Base

The trusted base consists of:

- Agda 2.8.0 with cubical support;
- the pinned Cubical Agda library recorded in `agda/library_manifest.json`;
- the fixed raw extension-calculus records used as the theorem object;
- repository-local arithmetic used by the counting proofs;
- the theorem-map and postulate-audit scripts.

"No local postulates" means that theorem-facing local modules typecheck without
local `postulate` declarations or local Agda `primitive` declarations, except
for trusted cubical primitives imported from the selected Cubical library.

## Reviewer Entry Points

Start with:

```bash
bash scripts/check_coherence_depth_artifact.sh
```

Then inspect:

- `paper-map.yaml` for the machine-readable theorem map;
- `docs/theorem_index.md` for stable Agda theorem names;
- `docs/coherence_depth_trust_boundary.md` for the semantic boundary;
- `agda/Everything.agda` and `agda/PEN.agda` for aggregate checks;
- `runs/coherence_depth_case_studies/` for fixture classifications.

## Main Paper-To-Artifact Map

| Paper result | Artifact status | Primary files |
|---|---|---|
| Raw structural syntax, roles, and normalization | fully mechanized | `agda/Metatheory/RawStructuralSyntax.agda`, `agda/Metatheory/RawStructuralTyping.agda`, `agda/Metatheory/SurfaceNormalizationBridge.agda` |
| Presentation equivalence and `mu`-invariance | fully mechanized | `agda/Metatheory/PresentationEquivalence.agda`, `agda/Metatheory/MuInvariance.agda` |
| SMod surface adequacy instance | fully mechanized for the fixed fragment | `agda/Surface/Modal/` |
| Structural horn image of raw clauses | fully mechanized | `agda/Metatheory/SurfaceToHornImage.agda`, `agda/Metatheory/StructuralHornDecoding.agda` |
| Cubical open-box extension theorem | mechanized for an abstract interface | `agda/CubicalOpenBox/`, `agda/Metatheory/HornOpenBox.agda` |
| Horn-to-open-box reduction and Kan subsumption | mechanized for an abstract interface | `agda/Metatheory/StructuralHornToOpenBox.agda`, `agda/Metatheory/HornElaboration.agda`, `agda/Metatheory/KanSubsumption.agda` |
| Computational replacement | conditional on adequacy | `agda/Metatheory/ComputationalReplacement.agda`, `agda/Metatheory/ReplaceDerivedField.agda` |
| Exact stabilization above binary trace | mechanized for an abstract interface | `agda/Metatheory/UpperBound.agda`, `agda/Metatheory/ExactDepth.agda` |
| Binary lower bound | fully mechanized | `agda/Metatheory/AdjunctionBarrier.agda`, `agda/Semantics/DepthLowerBound.agda` |
| Recent-history factorization | mechanized for an abstract interface | `agda/Metatheory/ChronologicalWindow.agda`, `agda/Semantics/ChronologicalWindow.agda` |
| Sparse and full-coupling recurrences | conditional on adequacy for the paper's `mu` reading | `agda/Metatheory/SparseDependencyRecurrence.agda`, `agda/Metatheory/FullCouplingEnvelope.agda`, `agda/Semantics/ScalingRecurrence.agda`, `agda/Semantics/FibonacciScaling.agda` |
| Case-study classification discipline | fully mechanized/audited fixtures | `agda/CaseStudies/`, `runs/coherence_depth_case_studies/`, `scripts/coherence_depth_audit.py` |

The authoritative theorem names and labels remain in `paper-map.yaml`; this
guide is a reading aid.
