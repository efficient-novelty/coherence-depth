# Coherence-Depth Trust Boundary

Date: 2026-05-09

This document records what the current Cubical Agda artifact checks directly,
what is read through the paper-level bridge in `1_coherence_depth.tex`, and
which files are outside the theorem-facing trust boundary.

The current checked core is the coherence-depth theorem package, the fixed raw
surface bridge, the machine-readable theorem map, and the transitive
theorem-facing import-closure audit. The artifact command is:

```bash
bash scripts/check_coherence_depth_artifact.sh
```

or, when GNU make is available:

```bash
make artifact-check
```

The same command is wired into the hosted artifact workflow:

```text
.github/workflows/artifact-check.yml
```

That workflow installs Agda 2.8.0, checks out the pinned Cubical library commit,
registers both local Cubical library names (`cubical` and `cubical-0.9`), and
runs `bash scripts/check_coherence_depth_artifact.sh`. A passing hosted run for
the final archival commit is still publication evidence, not a separate
mathematical assumption.

The paper's broad semantic statement is parametric in a
`SemanticCubicalFoundation` and depends on a `RawAdequacyPackage` connecting
admissible sealed semantic extensions to the fixed raw extension calculus.
`RawAdequacyPackage` is an assumed interface for broad semantic wrappers, a
checked concrete instance for the fixed raw and SMod fragments, and a partially
proved bridge for the intended transfer program. Applying the theorem to
arbitrary Cubical Agda programs, to another parser or elaborator, or to a
different cubical calculus remains conditional on supplying the corresponding
adequacy package.
The semantic interface records and wrappers themselves are now checked in
`agda/Semantics/`, including the smoke modules
`Test/SemanticDepthSmoke.agda` and `Test/FibonacciScalingSmoke.agda`.

The LMCS paper and `paper-map.yaml` use the same four status phrases:
`fully mechanized`, `mechanized for an abstract interface`,
`conditional on adequacy`, and `paper-only`. The intended reading is
theorem-by-theorem: a checked module supports the row in which it appears, not a
blanket transfer theorem for all surface languages or all cubical foundations.

## Trusted Base

- Agda 2.8.0 with Cubical support.
- The Cubical library declared by `agda/pen.agda-lib` and the artifact-specific
  root library file `coherence-depth.agda-lib`.
- Local dependency evidence: Agda 2.8.0 and Cubical Agda `cubical-0.9` at commit
  `b150186d2544e7efeddd31e5d14a8b9ecbb100f7`.
- Repository-local arithmetic in `agda/Core/Nat.agda`.
- The checked theorem-facing modules listed below.
- The machine-readable theorem map `paper-map.yaml`.
- The scripts `scripts/check_paper_map.py` and `scripts/audit_postulates.py`.

Known warning class: several current theorem modules type-check with Cubical
Agda `UnsupportedIndexedMatch` warnings. These warnings should remain visible
in artifact checks until the affected proofs are refactored or the warning is
shown irrelevant for the bridge layer.

## Theorem-Facing Map

| Paper result | Agda module | Main theorem/package names | Postulate-free? | Bridge dependency |
|---|---|---|---:|---|
| semantic interface | `Semantics/CubicalFoundation.agda`, `Semantics/SealedExtension.agda`, `Semantics/PrimitiveTrace.agda`, `Semantics/RawAdequacy.agda` | `SemanticCubicalFoundation`, `SemanticSealedLayer`, `PrimitiveTrace`, `traceHistoricalSupport`, `TraceHistoricalArity`, `RawAdequacyPackage` | yes | records the bridge boundary |
| semantic wrappers | `Semantics/TraceNormalForm.agda`, `Semantics/SemanticHornReduction.agda`, `Semantics/DepthUpperBound.agda`, `Semantics/DepthLowerBound.agda`, `Semantics/ExactDepth.agda`, `Semantics/ChronologicalWindow.agda` | `semantic-trace-normal-form`, `semantic-horn-extension-derived`, `higher-horn-trace-derived-from-binary-boundary-data`, `exported-horn-trace-computable-from-depth-two-data`, `semantic-derived-trace-respects-substitution`, `primitive-trace-depth-at-most-two`, `semantic-depth-one-impossible`, `cubical-foundations-primitive-coherence-depth-exactly-two`, `stage-trace-supported-by-last-two-interfaces` | yes | yes |
| semantic scaling wrappers | `Semantics/FullCoupling.agda`, `Semantics/ScalingRecurrence.agda`, `Semantics/FibonacciScaling.agda` | `FullCoupling`, `fullCouplingIso`, `full-coupling-affine-recurrence`, `full-coupling-affine-recurrence-relative-to-adequacy`, `constant-payload-fibonacci-scaling`, `constant-payload-fibonacci-scaling-relative-to-adequacy` | yes | yes, for `mu` reading |
| `prop:transparent` | `Metatheory/InterfaceCalculus.agda` | `transparent-growth-keeps-library-state`, `transparent-definitions-preserve-active-interface`, `transparent-definitions-have-zero-integration-latency`, `transparent-user-level-code-lies-outside-the-recurrence` | yes | no |
| `lem:arity-dimension` | `Metatheory/Obligations.agda` | `historical-arity-forces-cell-dimension`, `irreducible-obligation-requires-cell` | yes | no |
| `thm:extensional` | `Metatheory/Extensional.agda` | `UIP-forces-depth-1`, `history-truncates-to-one` | yes | no |
| `lem:horn-reduction` | `Metatheory/KanSubsumption.agda` | `HornExtensionFiber`, `structural-integration-horn-reduction`, `remote-layer-obligation-derived` | yes | no |
| `lem:telescopic` | `Metatheory/KanSubsumption.agda` | `TelescopicSubsumptionView`, `telescopic-subsumption`, `telescopic-remote-comparison-derived` | yes | yes, for surface-signature reading |
| `thm:upper` | `Metatheory/UpperBound.agda` | `structural-obligation-set-equivalence`, `structural-stabilizes-at-two` | yes | no |
| `cor:contractible-factor` | `Metatheory/UpperBound.agda` | `ContractibleRemoteFactor`, `structural-obligation-contractible-factorization`, `contractible-remote-factor-contractible` | yes | no |
| `cor:chrono-window` | `Metatheory/ChronologicalWindow.agda` | `primitive-obligations-factor-through-last-two`, `two-layer-chronological-window`, `chronological-markov-blanket` | yes | no |
| `thm:adjunction` | `Metatheory/AdjunctionBarrier.agda` | `explicit-binary-sealing-obstruction`, `triangle-identity-corollary`, `adjunction-barrier` | yes | no |
| `thm:clutching` | `Geometry/Clutching.agda` | `clutching-family-theorem`, `hopf-binary-clutching-nontrivial`, `clutching-horn-extension-fiber-contractible` | yes | no |
| `cor:d2` | `Metatheory/ExactDepth.agda` | `structural-coherence-depth-exactly-two`, `cubical-coherence-depth-exactly-two`, `cubical-chronological-window-size-exactly-two` | yes | no |
| `thm:2d-foundations`, `cor:2ltt-instantiation` | `Metatheory/TwoDFoundations.agda`, `Metatheory/TwoLTTFoundations.agda` | `depth-two-law-for-2d-foundations`, `cubical-depth-two-law-for-2d-foundations`, `two-level-depth-two-law-for-2d-foundations` | yes | no |
| `cor:refactoring` | `Metatheory/Refactoring.agda` | `historical-support-correspondence`, `refactoring-invariance` | yes | no |
| `thm:canonicity` | `Metatheory/CanonicityDensity.agda` | `CanonicityDensityTheorem`, `global-admissibility-forces-maximal-interface-density` | yes | yes, for raw-surface interpretation |
| `thm:trace` | `Metatheory/TracePrinciple.agda`, `Metatheory/InterfaceCalculus.agda` | `IntegrationTracePrinciple`, `public-counting-normal-form`, `integration-trace-principle` | yes | yes, for raw-surface interpretation |
| `thm:computational-replacement` | `Metatheory/ComputationalReplacement.agda` | `CanonicalTraceSignature`, `TracePresentation`, `computational-replacement-preserves-canonical-presentation`, `higher-arity-computational-replacement` | yes | yes, to connect raw declarations to trace presentations |
| `thm:factorization-complete`, `thm:higher-elim` | `Metatheory/KanSubsumption.agda`, `Metatheory/UpperBound.agda`, `Metatheory/ChronologicalWindow.agda`, `Metatheory/ComputationalReplacement.agda` | `structural-primitive-eliminates-above-two`, `primitive-obligations-factor-through-last-two`, `higher-arity-fields-disappear-from-minimal-signature` | yes | yes |
| `thm:recurrence` | `Metatheory/UniversalRecurrence.agda` | `UniversalAffineRecurrence`, `universal-affine-recurrence`, `universal-affine-recurrence-from-coherence` | yes | yes, for `mu` reading |
| `cor:d1` | `Core/DepthOneAffine.agda` | `depth1-affine-growth`, `Delta-depth1-closed`, `tau-depth1-closed` | yes | yes, for `mu` reading |
| `cor:fibonacci` | `Core/AffineRecurrence.agda` | `Delta-bootstrap`, `U-bootstrap-closed`, `tau-bootstrap-closed` | yes | yes, for `mu` reading |

## Machine-Readable Checks

- `paper-map.yaml` records paper claims, paper labels, Agda module paths, Agda
  theorem names, status, bridge use, and trusted inputs.
- `scripts/check_paper_map.py paper-map.yaml` verifies that all paper labels,
  Agda files, theorem names, and theorem-map statuses referenced by the map
  exist. The accepted statuses are `fully mechanized`,
  `mechanized for an abstract interface`, `conditional on adequacy`, and
  `paper-only`.
- `scripts/audit_postulates.py agda paper-map.yaml` computes the transitive
  import closure of the theorem-facing modules and reports, for each local
  module, whether it uses `postulate`, declares an Agda `primitive` block,
  contains `--safe`, or imports outside the repository-local root. Trusted
  external imports are limited to `Agda.*` and `Cubical.*`.

## Outside The Current Theorem-Facing Boundary

- A parser or elaboration theorem for arbitrary Cubical Agda programs.
- Transfer of the depth-two theorem to all cubical calculi or arbitrary HoTT.
- Auxiliary bridge payload harnesses such as
  `agda/Test/BridgePayloadContract.agda`; that file intentionally contains
  postulated contract predicates and is not imported by `PEN.agda`,
  `Everything.agda`, or the theorem smoke tests.
