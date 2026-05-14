# Coherence-Depth Theorem Index

Date: 2026-05-09

This index gives the stable names to search for when checking the Agda side of
`1_coherence_depth.tex`.

## Top-Level Checks

```bash
cd agda
agda --transliterate Everything.agda
agda --transliterate PEN.agda
agda --transliterate Test/MetatheorySmoke.agda
agda --transliterate Test/PresentationInvariance/Smoke.agda
agda --transliterate Metatheory/PresentationEquivalence.agda
agda --transliterate Metatheory/MuInvariance.agda
agda --transliterate Metatheory/RawStructuralSyntax.agda
agda --transliterate Metatheory/RawStructuralTyping.agda
agda --transliterate CubicalOpenBox/FaceSystem.agda
agda --transliterate Metatheory/StructuralBoundary.agda
agda --transliterate Metatheory/HornOpenBox.agda
agda --transliterate Metatheory/HornElaboration.agda
agda --transliterate Metatheory/StructuralHornDecoding.agda
agda --transliterate Metatheory/SurfaceNormalizationBridge.agda
agda --transliterate Metatheory/SurfaceToHornImage.agda
agda --transliterate Metatheory/FiniteInterfaceBasis.agda
agda --transliterate Metatheory/GlobalActionSemantics.agda
agda --transliterate Metatheory/ActiveBasisContract.agda
agda --transliterate Metatheory/SparseDependencyRecurrence.agda
agda --transliterate Metatheory/FullCouplingEnvelope.agda
agda --transliterate Semantics/CubicalFoundation.agda
agda --transliterate Semantics/SealedExtension.agda
agda --transliterate Semantics/PrimitiveTrace.agda
agda --transliterate Semantics/RawAdequacy.agda
agda --transliterate Semantics/TraceNormalForm.agda
agda --transliterate Semantics/SemanticHornReduction.agda
agda --transliterate Semantics/DepthUpperBound.agda
agda --transliterate Semantics/DepthLowerBound.agda
agda --transliterate Semantics/ExactDepth.agda
agda --transliterate Semantics/ChronologicalWindow.agda
agda --transliterate Semantics/FullCoupling.agda
agda --transliterate Semantics/ScalingRecurrence.agda
agda --transliterate Semantics/FibonacciScaling.agda
agda --transliterate CaseStudies/UniverseExtension.agda
agda --transliterate CaseStudies/GlobalModality.agda
agda --transliterate CaseStudies/PromotedInterface.agda
agda --transliterate CaseStudies/SparseDatatype.agda
agda --transliterate CaseStudies/HigherPayload.agda
agda --transliterate Test/SurfaceBridgeSmoke.agda
agda --transliterate Test/ActiveBasisExamples.agda
agda --transliterate Test/SparseRecurrenceSmoke.agda
agda --transliterate Test/SemanticFixtureSmoke.agda
agda --transliterate Test/HigherPayloadSmoke.agda
agda --transliterate Test/FakeHigherTraceNoBoundary.agda
agda --transliterate Test/SemanticDepthSmoke.agda
agda --transliterate Test/FibonacciScalingSmoke.agda
agda --transliterate Test/StructuralHornDecodingSmoke.agda
agda --transliterate Test/PresentationInvariance/RebundleRecord.agda
agda --transliterate Test/PresentationInvariance/SplitShell.agda
agda --transliterate Test/PresentationInvariance/CurryUncurry.agda
agda --transliterate Test/PresentationInvariance/TransparentAlias.agda
agda --transliterate Test/PresentationInvariance/DuplicateTrace.agda
agda --transliterate Geometry/Clutching.agda
agda --transliterate Test/ClutchingSmoke.agda
agda --transliterate Test/Fibonacci.agda
cd ..
python scripts/check_paper_map.py paper-map.yaml
python scripts/audit_postulates.py agda paper-map.yaml
python scripts/coherence_depth_audit.py runs/coherence_depth_case_studies
./scripts/check_coherence_depth_artifact.sh
```

## Semantic Upgrade Theorems

The semantic theorem layer in `paper/1_coherence_depth.tex` is indexed by the
following stable labels. The machine-readable `paper-map.yaml` uses the status
vocabulary `fully mechanized`, `mechanized for an abstract interface`,
`conditional on adequacy`, and `paper-only`; the checker rejects free-form
status strings.

| Paper label | Primary Agda surface | Status |
|---|---|---|
| semantic foundation interface | `Semantics.CubicalFoundation`, `Semantics.SealedExtension`, `Semantics.PrimitiveTrace`, and `Semantics.RawAdequacy` package the broad semantic reading; the fixed raw-calculus instance is checked by the modules below | `conditional on adequacy` boundary |
| `thm:semantic-adequacy` | `RawAdequacyPackage` plus fixed raw bridge modules, especially `Metatheory.SurfaceNormalizationBridge` and `Metatheory.SurfaceToHornImage` | `fully mechanized` for the fixed raw extension calculus; `conditional on adequacy` for broad semantic transfer |
| `thm:factorization-complete` | `primitive-obligations-factor-through-last-two`, `surface-to-horn-normal-form` | `conditional on adequacy` for the surface-signature reading |
| `thm:higher-elim` | `higher-arity-fields-disappear-from-minimal-signature`, `higher-structural-fields-derived` | `conditional on adequacy` |
| `thm:semantic-horn-reduction` | `semantic-horn-extension-derived`, `higher-structural-obligation-derived-by-hfill`, `semantic-remote-comparison-derived` | `mechanized for an abstract interface` |
| `thm:primitive-depth-upper-bound` | `primitive-trace-depth-at-most-two`, `structural-obligation-set-equivalence`, `structural-stabilizes-at-two` | `mechanized for an abstract interface` |
| `thm:primitive-depth-lower-bound` | `semantic-depth-one-impossible`, `swap-path-forces-binary-trace`, `adjunction-barrier` | `fully mechanized` |
| `thm:cubical-depth-exactly-two` | `cubical-foundations-primitive-coherence-depth-exactly-two`, `structural-coherence-depth-exactly-two`, `cubical-coherence-depth-exactly-two` | `conditional on adequacy` |
| `cor:chrono-window` | `exact-depth-two-implies-chronological-window-two`, `stage-trace-supported-by-last-two-interfaces`, `chronological-markov-blanket` | `conditional on adequacy` |
| `thm:full-coupling-affine-recurrence` | `FullCoupling`, `fullCouplingIso`, `full-coupling-window-iso`, `full-coupling-affine-recurrence`, `universal-affine-recurrence` | `conditional on adequacy` for the paper's `mu` reading |
| `cor:constant-payload-fibonacci` | `constant-payload-fibonacci-scaling`, `constant-payload-fibonacci-closed`, `Delta-bootstrap`, `U-bootstrap-closed` | `conditional on adequacy` for the paper's `mu` reading |

## Theorem Names

| Name | Module | Role |
|---|---|---|
| `SemanticCubicalFoundation` | `Semantics.CubicalFoundation` | semantic cubical foundation parameter |
| `KanStructure` | `Semantics.CubicalFoundation` | interval, face, partial, transport, hcomp, and hfill interface |
| `UnivalenceStructure` | `Semantics.CubicalFoundation` | optional lower-bound univalence package |
| `SemanticLibraryState` | `Semantics.SealedExtension` | semantic active-interface state |
| `SemanticSealedLayer` | `Semantics.SealedExtension` | payload/trace sealed-layer split |
| `semantic-public-interface` | `Semantics.SealedExtension` | public interface `K_n + T_n` |
| `semantic-transparent-zero-latency` | `Semantics.SealedExtension` | transparent development has zero latency |
| `traceHistoricalSupport` / `TraceHistoricalArity` | `Semantics.PrimitiveTrace` | semantic primitive traces carry explicit historical support data |
| `RawAdequacyPackage` | `Semantics.RawAdequacy` | explicit semantic-to-raw bridge assumptions |
| `semantic-trace-normal-form` | `Semantics.TraceNormalForm` | unary/binary/horn normal-form split |
| `HornSemanticDerivation` | `Semantics.TraceNormalForm` | semantic derivation obligation carried by horn normal forms |
| `semantic-trace-normal-form-with-derivation` | `Semantics.TraceNormalForm` | normal-form split where horn cases require semantic derivation data |
| `semantic-normal-form-for-admissible-structural-field` | `Semantics.TraceNormalForm` | every admissible raw structural field has a semantic unary/binary/horn normal form |
| `semantic-normal-form-for-admissible-structural-field-with-derivation` | `Semantics.TraceNormalForm` | admissible structural fields normalize with explicit horn derivation obligations |
| `semantic-horn-extension-derived` | `Semantics.SemanticHornReduction` | derived horn trace from semantic Kan data |
| `higher-horn-trace-derived-from-binary-boundary-data` | `Semantics.SemanticHornReduction` | higher horn trace is exposed as derived from binary boundary data |
| `exported-horn-trace-computable-from-depth-two-data` | `Semantics.SemanticHornReduction` | exported horn trace field is computed from the depth-two boundary package |
| `semantic-derived-trace-respects-substitution` | `Semantics.SemanticHornReduction` | semantic horn wrapper exposes the substitution-stability dependency |
| `primitive-trace-depth-at-most-two` | `Semantics.DepthUpperBound` | adequacy-parameterized primitive upper bound |
| `semantic-depth-one-impossible` | `Semantics.DepthLowerBound` | adequacy-parameterized unary lower-bound failure |
| `two-point-type-witness` / `swap-path-from-univalence` | `Semantics.DepthLowerBound` | semantic aliases for the two-point swap lower-bound witness |
| `cubical-foundations-primitive-coherence-depth-exactly-two` | `Semantics.ExactDepth` | canonical semantic-facing exact-depth theorem name |
| `full-coupling-affine-recurrence` | `Semantics.ScalingRecurrence` | full-coupling cardinality recurrence wrapper |
| `full-coupling-affine-recurrence-relative-to-adequacy` | `Semantics.ScalingRecurrence` | adequacy-parameterized recurrence wrapper |
| `constant-payload-fibonacci-scaling` | `Semantics.FibonacciScaling` | constant-payload Fibonacci recurrence wrapper |
| `constant-payload-fibonacci-scaling-relative-to-adequacy` | `Semantics.FibonacciScaling` | adequacy-parameterized constant-payload Fibonacci wrapper |
| `transparent-growth-keeps-library-state` | `Metatheory.InterfaceCalculus` | transparent growth stays in one library state |
| `transparent-definitions-preserve-active-interface` | `Metatheory.InterfaceCalculus` | transparent definitions do not enlarge the active interface |
| `transparent-definitions-have-zero-integration-latency` | `Metatheory.InterfaceCalculus` | zero latency for transparent growth |
| `transparent-user-level-code-lies-outside-the-recurrence` | `Metatheory.InterfaceCalculus` | transparent code is outside the recurrence law |
| `historical-arity-forces-cell-dimension` | `Metatheory.Obligations` | arity-to-cell-dimension dictionary |
| `irreducible-obligation-requires-cell` | `Metatheory.Obligations` | irreducible obligations require a coherence cell |
| `history-truncates-to-one` | `Metatheory.Extensional` | UIP/extensional depth-one collapse |
| `structural-integration-horn-reduction` | `Metatheory.KanSubsumption` | structural obligations reduce to horn-extension form |
| `depth-k-marginal-structural-obligation-open-ext` | `Metatheory.KanSubsumption` | expose the marginal depth-k exact obligation as a theorem-facing `OpenExt` fiber |
| `depth-k-marginal-open-ext-contractible` | `Metatheory.KanSubsumption` | marginal theorem-facing `OpenExt` fibers are contractible |
| `remote-layer-obligation-derived` | `Metatheory.KanSubsumption` | remote higher obligation is derived |
| `telescopic-subsumption` | `Metatheory.KanSubsumption` | telescopic subsumption chain |
| `telescopic-remote-comparison-derived` | `Metatheory.KanSubsumption` | remote comparison derivation through exported trace |
| `structural-obligation-set-equivalence` | `Metatheory.UpperBound` | equivalence of higher and depth-two obligation sets |
| `real-k-equivalent-real-k-minus-one` | `Metatheory.UpperBound` | one-step exact stabilization from depth `k` to `k-1` for `k >= 3` |
| `real-k-equivalent-real-two` | `Metatheory.UpperBound` | iterated exact stabilization to depth two |
| `structural-stabilizes-at-two` | `Metatheory.UpperBound` | exact upper-bound stabilization |
| `structural-obligation-contractible-factorization` | `Metatheory.UpperBound` | contractible factor decomposition |
| `contractible-remote-factor-contractible` | `Metatheory.UpperBound` | remote factor is contractible |
| `primitive-obligations-factor-through-last-two` | `Metatheory.ChronologicalWindow` | primitive obligations factor through last two layers |
| `two-layer-chronological-window` | `Metatheory.ChronologicalWindow` | chronological window size two |
| `chronological-markov-blanket` | `Metatheory.ChronologicalWindow` | last two layers as chronological Markov blanket |
| `explicit-binary-sealing-obstruction` | `Metatheory.AdjunctionBarrier` | binary lower-bound obstruction |
| `triangle-identity-corollary` | `Metatheory.AdjunctionBarrier` | adjunction-style binary coherence corollary |
| `adjunction-barrier` | `Metatheory.AdjunctionBarrier` | packaged lower-bound barrier |
| `clutching-family-theorem` | `Geometry.Clutching` | standalone optional clutching fixture, not used by the main lower-bound theorem |
| `hopf-binary-clutching-nontrivial` | `Geometry.Clutching` | standalone Hopf-style clutching datum fixture |
| `clutching-horn-extension-fiber-contractible` | `Geometry.Clutching` | standalone contractible horn-fiber fixture |
| `structural-coherence-depth-exactly-two` | `Metatheory.ExactDepth` | exact structural depth two |
| `cubical-coherence-depth-exactly-two` | `Metatheory.ExactDepth` | cubical depth-two corollary |
| `cubical-chronological-window-size-exactly-two` | `Metatheory.ExactDepth` | exact cubical chronological window |
| `primitive-depth-two-law-for-2d-foundations` | `Metatheory.TwoDFoundations` | primitive/window law for 2D foundations |
| `depth-two-law-for-2d-foundations` | `Metatheory.TwoDFoundations` | abstract 2D-foundations depth theorem |
| `constant-payload-depth-two-law` | `Metatheory.TwoDFoundations` | constant-payload affine consequence |
| `cubical-depth-two-law-for-2d-foundations` | `Metatheory.TwoDFoundations` | cubical 2D-foundations instance |
| `two-level-depth-two-law-for-2d-foundations` | `Metatheory.TwoLTTFoundations` | strict/fibrant 2LTT-style instance |
| `refactoring-invariance` | `Metatheory.Refactoring` | coarse refactoring invariance |
| `global-admissibility-forces-maximal-interface-density` | `Metatheory.CanonicityDensity` | active basis density for global admissibility |
| `basis-families-exist` | `Metatheory.FiniteInterfaceBasis` | canonical finite basis family for a counted active interface |
| `basis-family-cardinality-invariant` | `Metatheory.FiniteInterfaceBasis` | basis cardinality agrees with the active interface count |
| `basis-action-equivalence` | `Metatheory.FiniteInterfaceBasis` | basis sites are equivalent to active interface fields |
| `global-action-totality-implies-active-basis-contract` | `Metatheory.ActiveBasisContract` | global totality covers every active-basis site |
| `active-basis-contract-entails-density` | `Metatheory.ActiveBasisContract` | deterministic active-basis coverage yields a contractible action datum at each field |
| `coverage-alone-does-not-imply-depth-two-window` | `Metatheory.ActiveBasisContract` | explicit coverage model with depth-one collapse refutes circular depth-two inference |
| `coverage-alone-does-not-imply-fibonacci` | `Metatheory.ActiveBasisContract` | explicit coverage model without Fibonacci growth refutes circular recurrence inference |
| `sparse-windowed-recurrence` | `Metatheory.SparseDependencyRecurrence` | recurrence over an explicit finite dependency footprint |
| `transparent-growth-zero-footprint` | `Metatheory.SparseDependencyRecurrence` | transparent elaboration has an empty sparse footprint and zero latency |
| `orthogonal-extension-zero-or-sparse` | `Metatheory.SparseDependencyRecurrence` | ordinary orthogonal extensions classify as zero-footprint or sparse-footprint cases |
| `orthogonal-extension-below-full-envelope` | `Metatheory.SparseDependencyRecurrence` | sparse dependency counts are bounded by the full previous-window envelope |
| `full-coupling-envelope` | `Metatheory.FullCouplingEnvelope` | maximal footprint containing every previous-window dependency site |
| `full-coupling-specializes-sparse-recurrence` | `Metatheory.FullCouplingEnvelope` | the full envelope is a specialization of sparse recurrence |
| `full-coupling-depth-two-affine-law` | `Metatheory.FullCouplingEnvelope` | full depth-two coupling exposes the existing constant-payload affine law |
| `universe-extension-summary` | `CaseStudies.UniverseExtension` | counted full-coupling universe-extension case-study summary |
| `universe-refactored-presentation-same-mu` | `CaseStudies.UniverseExtension` | refactored universe-extension presentation records the same `mu` |
| `global-modality-summary` | `CaseStudies.GlobalModality` | counted full-coupling global-modality case-study summary |
| `promoted-interface-summary` | `CaseStudies.PromotedInterface` | counted active-basis promoted-interface case-study summary |
| `transparent-lemma-zero-footprint` | `CaseStudies.PromotedInterface` | transparent lemma extension has zero sparse footprint and zero latency |
| `coverage-does-not-prove-window` | `CaseStudies.PromotedInterface` | case-study alias for active-basis non-circularity around depth-two windows |
| `coverage-does-not-prove-fibonacci` | `CaseStudies.PromotedInterface` | case-study alias for active-basis non-circularity around Fibonacci growth |
| `sparse-datatype-summary` | `CaseStudies.SparseDatatype` | counted sparse datatype case-study summary |
| `sparse-datatype-recurrence` | `CaseStudies.SparseDatatype` | sparse datatype recurrence over one local dependency in a three-site window |
| `sparse-datatype-below-full-envelope` | `CaseStudies.SparseDatatype` | sparse datatype footprint is bounded by the full previous-window envelope |
| `higher-payload-classification` | `CaseStudies.HigherPayload` | user-supplied higher constructor is classified as payload |
| `higher-payload-not-structural-trace` | `CaseStudies.HigherPayload` | higher payload is not structural trace |
| `higher-payload-summary` | `CaseStudies.HigherPayload` | counted higher-payload case-study summary |
| `higher-payload-zero-trace` | `CaseStudies.HigherPayload` | higher payload contributes no primitive structural trace |
| `integration-trace-principle` | `Metatheory.TracePrinciple` | payload plus trace decomposition |
| `canonical-telescope-cardinality` | `Metatheory.CanonicalTelescope` | finite cardinality of a canonical telescope |
| `trace-cost-normal-form-cardinality` | `Metatheory.TraceCostNormalForm` | finite cardinality of a trace-cost normal form |
| `primitive-trace-subtelescope` | `Metatheory.TraceCostNormalForm` | primitive trace-field subtelescope |
| `derived-trace-subtelescope` | `Metatheory.TraceCostNormalForm` | derived trace-field subtelescope |
| `mu-of-trace-cost-normal-form` | `Metatheory.TraceCostNormalForm` | minimal opaque trace count for a normal form |
| `presentation-step-preserves-trace-support` | `Metatheory.PresentationEquivalence` | each explicit presentation generator preserves trace support count |
| `presentation-step-preserves-primitive-cost` | `Metatheory.PresentationEquivalence` | each explicit presentation generator preserves primitive trace count |
| `presentation-equivalence-preserves-trace-fields` | `Metatheory.PresentationEquivalence` | reflexive/symmetric/transitive closure preserves trace fields |
| `presentation-equivalence-preserves-primitive-cost` | `Metatheory.PresentationEquivalence` | presentation equivalence preserves primitive trace count |
| `TransparentlyGenerated` | `Metatheory.MuInvariance` | semantically derived trace fields |
| `RequiresPrimitive` | `Metatheory.MuInvariance` | fields not transparently generated |
| `mu-preserved-by-presentation-step` | `Metatheory.MuInvariance` | `mu` is invariant under one presentation generator |
| `mu-invariant-under-presentation-equivalence` | `Metatheory.MuInvariance` | `mu` is invariant under presentation equivalence |
| `derived-field-deletion-preserves-mu` | `Metatheory.MuInvariance` | duplicate derived deletion preserves minimal opaque cost |
| `requires-primitive-field-essential` | `Metatheory.MuInvariance` | primitive fields cannot be transparently generated |
| `computational-replacement-preserves-mu` | `Metatheory.MuInvariance` | connects `mu` preservation to computational replacement |
| `raw-extension-payload-fields` | `Metatheory.RawStructuralSyntax` | payload telescope projection for the fixed raw extension calculus |
| `raw-extension-structural-clauses` | `Metatheory.RawStructuralSyntax` | structural-clause telescope projection for the fixed raw extension calculus |
| `raw-extension-algebraic-fields` | `Metatheory.RawStructuralSyntax` | algebraic payload telescope projection for the fixed raw extension calculus |
| `rawStructuralClauseKind` / `rawStructuralClauseSupportDepth` | `Metatheory.RawStructuralSyntax` | first-class classifier and support depth for raw structural clauses |
| `act-clause-has-unary-support` | `Metatheory.RawStructuralTyping` | action clauses classify as unary structural trace support |
| `cmp-clause-has-binary-support` | `Metatheory.RawStructuralTyping` | comparison clauses classify as binary structural trace support |
| `horn-clause-has-higher-boundary-support` | `Metatheory.RawStructuralTyping` | horn clauses classify as packaged higher boundary support |
| `typed-role-kind-matches-raw` | `Metatheory.RawStructuralTyping` | typed unary/binary/horn roles agree with the raw clause classifier |
| `typed-role-support-depth-matches-raw` | `Metatheory.RawStructuralTyping` | typed role support depth agrees with the raw clause support depth |
| `algebraic-field-is-payload-not-structural-trace` | `Metatheory.RawStructuralTyping` | higher user operations are algebraic payload, not structural trace projections |
| `naked-higher-face-rejected-or-packaged` | `Metatheory.RawStructuralTyping` | admissible higher structural material is either rejected or packaged as a horn boundary |
| `FaceSystem` / `compileFaceSystem` | `CubicalOpenBox.FaceSystem` | finite visible-face systems with an explicit compiled `Partial` boundary |
| `StructuralOpenBox` | `CubicalOpenBox.Base` | explicit structural open-box record with family, face, side system, compatible base, compatible-lid interface, side equations, endpoint laws, and substitution-stability witness |
| `StructuralOpenExt` / `structuralOpenExtIsContr` | `CubicalOpenBox.Extension` / `CubicalOpenBox.Contractible` | checked total-extension singleton for a structural open box, presented as a `PathP` singleton over the underlying cubical family |
| `CompatibleStructuralOpenExt` | `CubicalOpenBox.Extension` | compatible-lid interface plus `PathP` filler through the underlying cubical family; the stricter `PathP` through `Sub` remains an adequacy-bridge reading |
| `StructuralBoundary` | `Metatheory.StructuralBoundary` | lower-boundary availability package for raw structural horn clauses |
| `HornOpenBoxPackage` / `identityHornPackageOpenExt` | `Metatheory.HornOpenBox` | explicit open-box package, missing-face/OpenExt bridge witness, and structural total-extension contractibility witness |
| `HornElaborationInput` / `structuralHornElaboration` | `Metatheory.HornElaboration` | build a witnessed `HornSemanticDerivation` from boundary/open-box/replacement evidence |
| `SealingGeneratedHigherHorn` | `Metatheory.StructuralHornDecoding` | grammar-indexed generated higher horn layer with one constructor for remote-comparison, degenerate, and transported horns |
| `decodeRemoteComparisonHornOpenBox` | `Metatheory.StructuralHornDecoding` | constructor case decoding a generated remote-comparison horn into an explicit `StructuralOpenBox` |
| `decodeDegenerateHornOpenBox` | `Metatheory.StructuralHornDecoding` | constructor case decoding a generated degenerate horn into an explicit `StructuralOpenBox` |
| `decodeTransportedHornOpenBox` | `Metatheory.StructuralHornDecoding` | constructor case decoding a generated transported horn into an explicit `StructuralOpenBox` |
| `decodeGeneratedHigherHornCubicalData` | `Metatheory.StructuralHornDecoding` | packages the constructor-by-constructor open-box decoding as `StructuralHornCubicalData` for the horn elaboration bridge |
| `replaceDerivedField` / `presentationEquiv` | `Metatheory.ReplaceDerivedField` | delete a derived raw field through explicit forward/backward presentation maps and round trips |
| `higherStructuralTraceDerived` / `normalizationDerivedWitness` | `Metatheory.NormalizationDerived` | classify higher structural fields as derived only from a `HornSemanticDerivation` and its replacement witness |
| `normalizeEliminatesHigherStructuralTrace` | `Metatheory.NormalizationDerived` | derivation-based normalization has no primitive public status for the higher structural field |
| `normalizationAppliesDerivedFieldReplacement` | `Metatheory.NormalizationDerived` | normalization exposes the presentation-equivalence replacement for the derived field |
| `normalizationReplacementUsesOnlyLower` | `Metatheory.NormalizationDerived` | normalized replacement terms use the lower public boundary witness |
| `fakeHighArityTraceField` | `Test.FakeHigherTraceNoBoundary` | negative smoke test: high-arity trace-shaped data without a structural boundary package |
| `modal-explicit-horn-elaborates-through-HornElaboration` | `Surface.Modal.Adequacy` | concrete `SMod` explicit horn bridge into `HornElaboration` |
| `modal-omitted-horn-inserts-derived-term` / `modal-explicit-and-omitted-horn-same-derived-term` | `Surface.Modal.Adequacy` | omitted and explicit `SMod` horns share the same derived replacement term |
| `CanonicalNormalizedSignature` | `Metatheory.SurfaceNormalizationBridge` | canonical payload plus trace normal form for an admissible raw extension |
| `normalizeRawExtension` | `Metatheory.SurfaceNormalizationBridge` | normalize the fixed raw extension calculus to a canonical counted signature |
| `raw-extension-elaborates-to-candidate` | `Metatheory.SurfaceNormalizationBridge` | package an admissible raw extension as a theorem-facing candidate |
| `raw-extension-normalizes-to-canonical-signature` | `Metatheory.SurfaceNormalizationBridge` | named bridge from admissible raw extension to canonical signature |
| `raw-trace-normalizes-to-canonical-signature` | `Metatheory.SurfaceNormalizationBridge` | normalize one typed raw structural role to a trace-cost field |
| `admissible-structural-trace-field-normalizes` | `Metatheory.SurfaceNormalizationBridge` | every admissible structural field normalizes to a typed unary, binary, or horn role |
| `admissible-structural-field-normalizes-to-canonical-field` | `Metatheory.SurfaceNormalizationBridge` | the normalized role is exactly the canonical trace-cost field used for counting |
| `normalize-preserves-support` | `Metatheory.SurfaceNormalizationBridge` | raw normalization preserves the selected trace support |
| `normalize-preserves-arity` | `Metatheory.SurfaceNormalizationBridge` | normalized arity matches normalized historical support |
| `normalize-preserves-primitive-cost` | `Metatheory.SurfaceNormalizationBridge` | raw normalization preserves primitive/derived trace cost |
| `normalization-respects-presentation-equivalence` | `Metatheory.SurfaceNormalizationBridge` | presentation-equivalent normal forms have equal `mu` |
| `normalized-signature-matches-counted-interface` | `Metatheory.SurfaceNormalizationBridge` | normalized payload and trace counts match the raw counted interface |
| `SurfaceHornImage` | `Metatheory.SurfaceToHornImage` | theorem-facing image record for one typed raw structural role |
| `surface-to-horn-normal-form` | `Metatheory.SurfaceToHornImage` | typed raw structural roles normalize into the horn-image classification |
| `surface-to-horn-preserves-support` | `Metatheory.SurfaceToHornImage` | horn-image normalization preserves the selected trace support |
| `surface-to-horn-preserves-arity` | `Metatheory.SurfaceToHornImage` | horn-image normalization preserves support arity |
| `surface-to-horn-preserves-primitive-cost` | `Metatheory.SurfaceToHornImage` | horn-image normalization preserves primitive/derived trace cost |
| `higher-structural-fields-derived` | `Metatheory.SurfaceToHornImage` | packaged higher horn fields are derived in the canonical trace normal form |
| `higher-raw-structural-traces-derived` | `Metatheory.SurfaceToHornImage` | admissible higher raw structural material is rejected or derived through a horn package |
| `raw-syntax-no-naked-higher-structural-projections` | `Metatheory.SurfaceToHornImage` | admissibility boundary for naked higher structural projections |
| `horn-image-complete-for-structural-clauses` | `Metatheory.SurfaceToHornImage` | every well-typed raw structural clause has a horn image |
| `raw-structural-normalizes-to-horn` | `Metatheory.SurfaceToHornImage` | admissible raw structural telescopes normalize to the horn-image package |
| `computational-replacement-preserves-canonical-presentation` | `Metatheory.ComputationalReplacement` | replacement preserves canonical presentation |
| `higher-arity-fields-disappear-from-minimal-signature` | `Metatheory.ComputationalReplacement` | higher arity disappears from minimal signature |
| `higher-arity-computational-replacement` | `Metatheory.ComputationalReplacement` | packaged higher-arity replacement |
| `universal-affine-recurrence` | `Metatheory.UniversalRecurrence` | counted historical-window recurrence |
| `universal-affine-recurrence-from-coherence` | `Metatheory.UniversalRecurrence` | recurrence from coherence/window package |
| `depth1-affine-growth` | `Core.DepthOneAffine` | depth-one affine growth |
| `Delta-depth1-closed` | `Core.DepthOneAffine` | depth-one closed delta form |
| `tau-depth1-closed` | `Core.DepthOneAffine` | depth-one closed cumulative form |
| `Delta-bootstrap` | `Core.AffineRecurrence` | payload-aware depth-two recurrence bootstrap |
| `U-bootstrap-closed` | `Core.AffineRecurrence` | shifted Fibonacci sequence |
| `tau-bootstrap-closed` | `Core.AffineRecurrence` | cumulative shifted Fibonacci form |

## Top-Level Smoke Alias Surface

`agda/Test/MetatheorySmoke.agda` imports `PEN.agda` and aliases the stable
top-level surface for the bridge and recurrence work. The Phase 9 aliases now
cover these groups:

| Alias group | Representative aliases | Source modules |
|---|---|---|
| canonical trace normal forms | `canonical-telescope-surface`, `canonical-trace-cost-normal-form-surface`, `mu-normal-form-available` | `Metatheory.CanonicalTelescope`, `Metatheory.TraceCostNormalForm` |
| presentation and `mu` invariance | `presentation-step-surface`, `presentation-equivalence-surface`, `mu-presentation-equivalence-theorem`, `computational-replacement-mu-theorem` | `Metatheory.PresentationEquivalence`, `Metatheory.MuInvariance` |
| raw structural bridge | `raw-extension-surface`, `admissible-raw-extension-surface`, `raw-extension-normalization-theorem`, `raw-structural-normalizes-to-horn-theorem` | `Metatheory.RawStructuralSyntax`, `Metatheory.RawStructuralTyping`, `Metatheory.SurfaceNormalizationBridge`, `Metatheory.SurfaceToHornImage` |
| active-basis naturality | `finite-active-interface-surface`, `global-action-totality-theorem`, `active-basis-density-theorem`, `coverage-fibonacci-noncircularity-example` | `Metatheory.FiniteInterfaceBasis`, `Metatheory.GlobalActionSemantics`, `Metatheory.ActiveBasisContract` |
| sparse/full recurrence and fixtures | `sparse-windowed-recurrence-theorem`, `transparent-growth-zero-footprint-theorem`, `full-coupling-specializes-sparse-recurrence-theorem`, `full-coupling-depth-two-affine-law-theorem`, `sparse-datatype-fixture-classification-smoke`, `transparent-lemma-zero-latency-smoke` | `Metatheory.SparseDependencyRecurrence`, `Metatheory.FullCouplingEnvelope`, `Test.SemanticFixtureSmoke` |

## Planned Names Not Yet Present

Phase 9 top-level integration is now present. The remaining planned names are
paper-reference updates from the Phase 10 rewrite of `1_coherence_depth.tex`;
no additional Agda theorem names are currently required for that step.
