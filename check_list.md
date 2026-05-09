# Checklist: Paper Improvement Plan

Source: `paper_improvement_plan.md`

This checklist turns the improvement plan into executable work items for the
next paper and Agda artifact revision. It is organized by milestone, with
cross-cutting paper, code, documentation, audit, and review-readiness tasks.

## Completion Legend

- [ ] Not started
- [ ] In progress
- [ ] Done
- [ ] Blocked, with note added below the item

## Global Definition Of Done

- [ ] The main theorem is stated as a theorem about primitive public structural
      trace, not about the disappearance of higher cubical objects.
- [ ] The paper distinguishes sealed foundational extensions from transparent
      definitional growth.
- [ ] User-supplied higher HIT constructors are classified as payload, not
      automatically generated structural trace.
- [ ] Full coupling is stated as an assumption for recurrence equality and
      Fibonacci scaling.
- [ ] Sparse and orthogonal dependency patterns are stated as bounded or sparse
      regimes, not as Fibonacci equality.
- [ ] The semantic adequacy boundary is explicit in both paper and artifact.
- [ ] Every theorem in the paper has an entry in `paper-map.yaml`.
- [ ] Every theorem entry has an honest status: `mechanized`,
      `conditional-on-adequacy-package`, `paper-only`, or `trusted-input`.
- [ ] The Agda artifact typechecks after each milestone.
- [ ] The postulate audit reports no hidden theorem-critical assumptions.
- [ ] The paper, theorem index, paper map, and artifact agree on theorem names.

## Milestone 0: Stabilize The Target Statement

Goal: rewrite the central claim so it is precise, reviewer-proof, and aligned
with the mechanization target.

### Paper Tasks

- [ ] Rewrite the main depth theorem around this phrase:
      "primitive public structural trace".
- [ ] State that the theorem applies to admissible sealed structural
      extensions in cubical foundations with stable Kan composition/filling.
- [ ] State the theorem parametrically in a semantic adequacy package.
- [ ] State the exact-depth theorem separately from the scaling theorem.
- [ ] State the scaling theorem separately from the Fibonacci corollary.
- [ ] Add a theorem statement for exact primitive coherence depth two.
- [ ] Add a theorem statement for the full-coupling affine recurrence:
      `mu_(n+1) = mu_n + mu_(n-1) + kappa_n + kappa_(n-1)`.
- [ ] Add a theorem statement for constant-payload Fibonacci scaling.
- [ ] Add an indexing convention box for `n`, `n + 1`, bootstrap cases,
      `mu_n`, `kappa_n`, and shifted trace `U_n`.
- [ ] Decide whether the lower-bound proof uses swap, clutching, or both.
- [ ] Record that decision in the paper and in this checklist.

### Guardrail Tasks

- [ ] Add wording that higher cubical cells, paths, cubes, homotopies, and HIT
      constructors may exist at all dimensions.
- [ ] Add wording that higher structural integration obligations are derived
      from binary trace by Kan composition/filling.
- [ ] Add wording that arbitrary user higher constructors are payload.
- [ ] Add wording that transparent development has zero integration latency in
      this model.
- [ ] Add wording that sparse dependency footprints give sparse recurrences or
      upper-bound envelopes.
- [ ] Avoid claims that all semantic filler spaces are contractible.

### Acceptance Criteria

- [ ] No theorem wording implies that higher cubical objects vanish.
- [ ] No theorem wording counts arbitrary user payload as structural trace.
- [ ] No theorem wording says ordinary transparent library growth is Fibonacci.
- [ ] Full coupling is visible in every equality-style recurrence statement.
- [ ] The paper and Agda roadmap use the same recurrence indexing convention.

## Milestone 1: Add Semantic Interface Records

Goal: create the semantic layer that downstream results can depend on.

### New Agda Modules

- [ ] Create `agda/Semantics/` directory.
- [ ] Add `agda/Semantics/CubicalFoundation.agda`.
- [ ] Add `agda/Semantics/SealedExtension.agda`.
- [ ] Add `agda/Semantics/PrimitiveTrace.agda`.
- [ ] Add top-level imports in `agda/Everything.agda`.
- [ ] Add top-level imports in `agda/PEN.agda`.
- [ ] Add smoke test module `agda/Test/SemanticDepthSmoke.agda`.

### `Semantics.CubicalFoundation`

- [ ] Define `SemanticCubicalFoundation`.
- [ ] Include interval object and endpoints.
- [ ] Include cofibration/face structure.
- [ ] Include partial element structure.
- [ ] Include path or interval-indexed equality structure.
- [ ] Include transport.
- [ ] Include homogeneous composition.
- [ ] Include filling.
- [ ] Include boundary laws for composition/filling.
- [ ] Include substitution stability.
- [ ] Split universe-heavy fields into smaller records if constraints become
      hard to manage.
- [ ] Add optional `UnivalenceStructure` or a separate
      `SemanticCubicalFoundationWithUnivalence` record for lower bounds.

### `Semantics.SealedExtension`

- [ ] Define semantic library states.
- [ ] Define semantic sealed layers.
- [ ] Define payload `K_n`.
- [ ] Define resolved structural trace `T_n`.
- [ ] Define public interface `I_n = K_n + T_n`.
- [ ] Define transparent development separately.
- [ ] Prove or postulate with explicit status:
      `semantic-transparent-zero-latency`.
- [ ] Define sealed extension sequences.

### `Semantics.PrimitiveTrace`

- [ ] Define primitive trace.
- [ ] Define derived trace.
- [ ] Define structural trace versus payload.
- [ ] Define historical support.
- [ ] Define support depth.
- [ ] Define primitive trace depth at most `d`.
- [ ] Define primitive trace depth exactly `d`.
- [ ] Define binary trace necessity.
- [ ] Ensure higher HIT constructors can be classified as payload.

### Acceptance Criteria

- [ ] New semantic modules typecheck.
- [ ] Existing Agda modules still typecheck.
- [ ] Semantic definitions do not silently assume the main theorem.
- [ ] The trace/payload split is expressible in code.
- [ ] Transparent growth is represented outside the sealed recurrence model.

## Milestone 2: Package Raw Adequacy

Goal: make the bridge from semantic cubical extensions to the raw extension
calculus explicit.

### New Agda Module

- [ ] Add `agda/Semantics/RawAdequacy.agda`.

### Record/API Tasks

- [ ] Define `RawAdequacyPackage`.
- [ ] Add field `raw-syntax-sound-for-semantic-extensions`.
- [ ] Add field `semantic-extension-elaborates-to-raw`.
- [ ] Add field `raw-normalization-preserves-semantics`.
- [ ] Add field `raw-normalization-preserves-support`.
- [ ] Add field `raw-normalization-preserves-primitive-status`.
- [ ] Add field `raw-normalization-preserves-cardinality`.
- [ ] Add field for preservation of exported interface cardinality.
- [ ] Add field for preservation of historical support.
- [ ] Add field for preservation of primitive-vs-derived classification.
- [ ] Add field for semantic interpretation preservation.

### Refactor Tasks

- [ ] Refactor downstream semantic theorems to take `RawAdequacyPackage` as a
      parameter.
- [ ] Avoid using raw calculus results directly in paper-facing semantic theorem
      statements without the adequacy package.
- [ ] Mark uninstantiated adequacy fields as trusted inputs or conditional
      assumptions in `paper-map.yaml`.

### Paper Tasks

- [ ] Add section "Semantic adequacy of the extension calculus".
- [ ] Define semantic structural obligations.
- [ ] Define raw action clauses.
- [ ] Define raw comparison clauses.
- [ ] Define raw horn clauses.
- [ ] State raw soundness.
- [ ] State raw completeness.
- [ ] State preservation of support.
- [ ] State preservation of primitive/derived status.
- [ ] State preservation of cardinality.
- [ ] Clearly label mechanized, conditional, and assumed parts.

### Acceptance Criteria

- [ ] The paper can honestly say which results are conditional on adequacy.
- [ ] Downstream theorem modules typecheck parametrically over adequacy.
- [ ] Adequacy assumptions are visible to the audit tooling.
- [ ] The artifact does not look as if it assumes the main theorem.

## Milestone 3: Semantic Trace Normal Forms

Goal: connect raw normalization to semantic trace roles.

### New Agda Module

- [ ] Add `agda/Semantics/TraceNormalForm.agda`.

### Existing Modules To Strengthen

- [ ] Strengthen `agda/Metatheory/RawStructuralSyntax.agda`.
- [ ] Strengthen `agda/Metatheory/RawStructuralTyping.agda`.
- [ ] Strengthen `agda/Metatheory/SurfaceNormalizationBridge.agda`.

### Theorem Tasks

- [ ] Define semantic trace normal forms.
- [ ] Prove every admissible structural trace field normalizes to unary action,
      binary comparison, or derived horn package.
- [ ] Add theorem `semantic-trace-normal-form`.
- [ ] Add theorem `unary-action-trace-primitive-candidate`.
- [ ] Add theorem `binary-comparison-trace-primitive-candidate`.
- [ ] Add theorem `higher-horn-trace-derived`.
- [ ] Track support depth for every normalized role.
- [ ] Track primitive/derived status for every normalized role.
- [ ] Ensure horn roles carry a semantic derivation obligation.

### Paper Tasks

- [ ] Add section "Normal forms for structural trace".
- [ ] Explain unary action trace.
- [ ] Explain binary comparison trace.
- [ ] Explain higher horn packages.
- [ ] Explain why higher algebraic operations supplied by users are payload.
- [ ] Make clear that horn packages are derived by semantic cubical structure,
      not by definition alone.

### Acceptance Criteria

- [ ] Every normalized role has support data.
- [ ] Every normalized role has primitive/derived classification.
- [ ] Horn roles are not merely declared derived; they require semantic
      derivability.

## Milestone 4: Semantic Horn Reduction

Goal: prove the core upper-bound engine using cubical composition/filling.

### New Agda Module

- [ ] Add `agda/Semantics/SemanticHornReduction.agda`.

### Definition Tasks

- [ ] Define semantic horn boundary data.
- [ ] Define semantic derived trace from `hfill`.
- [ ] Define semantic derived trace from `hcomp`.
- [ ] Define higher structural obligation support beyond depth two.
- [ ] Define telescopic remote comparison data.

### Theorem Tasks

- [ ] Add theorem `semantic-horn-extension-derived`.
- [ ] Add theorem `higher-structural-obligation-derived-by-hfill`.
- [ ] Add theorem `semantic-telescopic-subsumption`.
- [ ] Add theorem `semantic-remote-comparison-derived`.
- [ ] Prove higher horn trace is derived from binary boundary data.
- [ ] Prove remote comparisons factor through a depth-two boundary.
- [ ] Prove the exported trace field is computable from depth-two data.

### Proof Safety Tasks

- [ ] Do not state that all filler spaces are contractible.
- [ ] If uniqueness is needed, restrict it to the theorem-facing exported trace
      package, not all semantic fillers.
- [ ] Ensure `hfill`/`hcomp` appear in the theorem dependencies.
- [ ] Ensure substitution stability is used where required.

### Paper Tasks

- [ ] Add main upper-bound proof section.
- [ ] Present the proof as derived-trace computability.
- [ ] Explain how higher horn-shaped structural material is generated from
      binary boundary trace.
- [ ] Explain telescopic subsumption without implying truncation of the
      foundation.

### Acceptance Criteria

- [ ] The upper-bound engine is semantic, not merely syntactic.
- [ ] Derived trace explicitly uses cubical filling/composition.
- [ ] The paper does not claim semantic filler spaces are globally
      contractible.

## Milestone 5: Upper Bound, Depth At Most Two

Goal: prove primitive trace depth at most two.

### New Agda Module

- [ ] Add `agda/Semantics/DepthUpperBound.agda`.

### Theorem Tasks

- [ ] Import semantic raw adequacy.
- [ ] Import semantic trace normal forms.
- [ ] Import semantic horn reduction.
- [ ] Prove `primitive-trace-depth-at-most-two`.
- [ ] Prove primitive trace normal forms stabilize at depth two.
- [ ] Prove primitive trace fields of support depth greater than two reduce to
      depth-two primitive public trace plus derived horn trace.
- [ ] Prove the theorem parametrically over `RawAdequacyPackage`.

### Paper Tasks

- [ ] State Theorem E: upper bound, depth at most two.
- [ ] Use the normal-form split in the proof:
      unary, binary, higher horn.
- [ ] Say higher horn trace is derived rather than primitive.

### Acceptance Criteria

- [ ] The theorem is about primitive trace depth, not global truncation.
- [ ] The theorem is conditional on or supplied with semantic adequacy.
- [ ] The proof depends on semantic horn reduction.

## Milestone 6: Lower Bound, Depth Not One

Goal: prove unary trace alone is insufficient.

### New Agda Module

- [ ] Add `agda/Semantics/DepthLowerBound.agda`.

### Existing Modules To Connect

- [ ] Import `agda/Metatheory/AdjunctionBarrier.agda`.
- [ ] Import `agda/Geometry/Clutching.agda` if using the clutching witness.

### Swap Witness Tasks

- [ ] Define or reuse the two-point type witness.
- [ ] Define or reuse the nontrivial swap equivalence.
- [ ] Use univalence to obtain the swap path.
- [ ] Show transport of a unary clause along the swap path changes the
      observable action.
- [ ] Show constant-left and constant-right are distinguishable.
- [ ] Prove the binary comparison between `refl` and the swap path cannot be
      derived from unary trace alone.
- [ ] Add theorem `swap-path-forces-binary-trace`.
- [ ] Add theorem `semantic-depth-one-impossible`.
- [ ] Add theorem `semantic-binary-trace-necessary`.

### Optional Clutching Witness Tasks

- [ ] Decide whether clutching is included as a theorem, example, or appendix.
- [ ] If included, prove or connect `clutching-forces-binary-trace`.
- [ ] Keep swap as the primary lower-bound proof if it is easier to maintain.

### Paper Tasks

- [ ] Add main lower-bound proof section.
- [ ] Explain the swap witness in reviewer-facing prose.
- [ ] Optionally add the clutching witness as a richer geometric example.
- [ ] State why the lower bound connects to the semantic primitive trace
      definition, not only to the synthetic calculus.

### Acceptance Criteria

- [ ] There is a named theorem `semantic-depth-one-impossible`.
- [ ] The proof uses semantic primitive trace definitions.
- [ ] The lower bound does not rely only on the synthetic obligation language.
- [ ] The required univalence assumption is explicit.

## Milestone 7: Exact Depth Theorem

Goal: combine upper and lower bounds into the paper-facing result.

### New Agda Module

- [ ] Add `agda/Semantics/ExactDepth.agda`.

### Theorem Tasks

- [ ] Import `Semantics.DepthUpperBound`.
- [ ] Import `Semantics.DepthLowerBound`.
- [ ] Prove `cubical-foundations-primitive-coherence-depth-exactly-two`.
- [ ] Add alias `sealed-structural-trace-depth-exactly-two` if useful.
- [ ] Ensure there is one canonical theorem name used by the paper.

### Documentation Tasks

- [ ] Add exact-depth theorem to `paper-map.yaml`.
- [ ] Add exact-depth theorem to `docs/theorem_index.md`.
- [ ] Add exact-depth theorem to the paper mechanization table.

### Acceptance Criteria

- [ ] The paper has one canonical exact-depth theorem.
- [ ] The theorem combines both `depth <= 2` and `depth > 1`.
- [ ] The theorem states all required assumptions.

## Milestone 8: Chronological Window And Recurrence

Goal: derive scaling from exact depth two.

### New Or Updated Agda Modules

- [ ] Add `agda/Semantics/ChronologicalWindow.agda`.
- [ ] Add `agda/Semantics/FullCoupling.agda`.
- [ ] Add `agda/Semantics/ScalingRecurrence.agda`.
- [ ] Refactor `agda/Metatheory/UniversalRecurrence.agda` to consume the
      semantic window theorem where appropriate.
- [ ] Refactor `agda/Metatheory/SparseDependencyRecurrence.agda` to keep sparse
      cases separate.
- [ ] Refactor `agda/Metatheory/FullCouplingEnvelope.agda` to align with the
      semantic full-coupling definition.

### Chronological Window Tasks

- [ ] Define `ChronologicalWindowSize`.
- [ ] Prove `exact-depth-two-implies-chronological-window-two`.
- [ ] Prove `stage-trace-supported-by-last-two-interfaces`.
- [ ] State support as inclusion in `I_n + I_(n-1)`.

### Full Coupling Tasks

- [ ] Define `FullCoupling` as an isomorphism, not merely an inequality.
- [ ] Add field `fullCouplingIso`.
- [ ] Define sparse coupling separately.
- [ ] Define dependency footprint for sparse coupling.
- [ ] Prove sparse footprint is contained in the two-layer window.

### Affine Recurrence Tasks

- [ ] Define cardinalities `kappa_n = |K_n|` and `mu_n = |T_n|`.
- [ ] Prove `I_n = K_n + T_n` at the cardinality level.
- [ ] Prove `full-coupling-affine-recurrence`.
- [ ] Ensure the recurrence theorem assumes full coupling.
- [ ] Ensure sparse cases are not presented as equality unless their footprint
      is full.

### Paper Tasks

- [ ] Add chronological window theorem.
- [ ] Add full coupling definition.
- [ ] Add sparse coupling definition or remark.
- [ ] Add affine recurrence theorem.
- [ ] Separate full-coupling equality from sparse upper-bound behavior.

### Acceptance Criteria

- [ ] Exact depth two is the input to the chronological window theorem.
- [ ] Full coupling is an isomorphism in code.
- [ ] The recurrence theorem is bookkeeping after the full-coupling isomorphism.
- [ ] Sparse and full-coupling regimes cannot be confused.

## Milestone 9: Constant-Payload Fibonacci Corollary

Goal: connect the affine recurrence to the existing arithmetic recurrence.

### New Agda Module

- [ ] Add `agda/Semantics/FibonacciScaling.agda`.

### Existing Module To Reuse

- [ ] Reuse `agda/Core/AffineRecurrence.agda`.

### Theorem Tasks

- [ ] Define constant payload condition `ConstantPayload S c`.
- [ ] Define bootstrap assumptions.
- [ ] Define shifted trace `U_n = mu_n + 2 * c`.
- [ ] Prove `U_(n+1) = U_n + U_(n-1)`.
- [ ] Prove `constant-payload-fibonacci-scaling`.
- [ ] Align theorem indexing with `Core.AffineRecurrence`.
- [ ] Add a smoke theorem that checks the first few values.

### Paper Tasks

- [ ] State constant-payload corollary.
- [ ] State exact bootstrap convention.
- [ ] Show the shifted sequence is Fibonacci.
- [ ] Avoid implying all sealed sequences are Fibonacci.

### Acceptance Criteria

- [ ] Paper formula and Agda theorem use the same indexing.
- [ ] Bootstrap conditions are explicit.
- [ ] The corollary depends on full coupling and constant payload.

## Milestone 10: End-To-End Examples

Goal: make the theorem tangible and test classification boundaries.

### Fixture Tasks

- [ ] Add one full-coupling sealed extension sequence fixture.
- [ ] Add one sparse dependency fixture.
- [ ] Add one transparent-development fixture.
- [ ] Add one higher-payload fixture.
- [ ] Ensure each fixture has expected classification metadata.

### Possible Existing Case Studies To Review

- [ ] Review `runs/coherence_depth_case_studies/universe_extension.yaml`.
- [ ] Review `runs/coherence_depth_case_studies/universe_extension_refactored.yaml`.
- [ ] Review `runs/coherence_depth_case_studies/sparse_datatype.yaml`.
- [ ] Review `runs/coherence_depth_case_studies/transparent_lemma_extension.yaml`.
- [ ] Review `runs/coherence_depth_case_studies/promoted_interface.yaml`.
- [ ] Review `runs/coherence_depth_case_studies/global_modality.yaml`.

### Test Tasks

- [ ] Add semantic fixture tests.
- [ ] Add sparse classification tests.
- [ ] Add transparent zero-latency tests.
- [ ] Add higher-payload classification tests.
- [ ] Ensure audit script reports expected classification for each fixture.

### Paper Tasks

- [ ] Add a small table of fixtures.
- [ ] Show which fixture is full coupling.
- [ ] Show which fixture is sparse.
- [ ] Show which fixture is transparent and therefore outside recurrence.
- [ ] Show which fixture contains higher payload rather than structural trace.

### Acceptance Criteria

- [ ] Examples demonstrate the guardrails.
- [ ] Classification agrees between paper, fixtures, and audit script.
- [ ] No example accidentally treats arbitrary higher payload as trace.

## Milestone 11: Paper Rewrite And Artifact Audit

Goal: produce the next complete paper/artifact version.

### Paper Rewrite Tasks

- [ ] Rewrite abstract.
- [ ] Rewrite introduction.
- [ ] Add "scope at a glance" table.
- [ ] Add semantic cubical foundation section.
- [ ] Add sealed extensions and trace section.
- [ ] Add semantic adequacy section.
- [ ] Add trace normal form section.
- [ ] Add depth-at-most-two proof.
- [ ] Add depth-at-least-two proof.
- [ ] Add exact-depth theorem.
- [ ] Add chronological window theorem.
- [ ] Add recurrence theorem.
- [ ] Add Fibonacci corollary.
- [ ] Add theorem dependency diagram.
- [ ] Update mechanization table.
- [ ] Update limitations section.
- [ ] Check that all claims match code status.

### Files To Update

- [ ] Update `paper/1_coherence_depth.tex`.
- [ ] Update `paper-map.yaml`.
- [ ] Update `docs/theorem_index.md`.
- [ ] Update `docs/coherence_depth_trust_boundary.md`.
- [ ] Update `README.txt`.
- [ ] Update `scripts/check_coherence_depth_artifact.sh`.
- [ ] Update `scripts/check_paper_map.py`.
- [ ] Update `scripts/audit_postulates.py`.
- [ ] Update `.github/workflows/artifact-check.yml`.

### Artifact Check Tasks

- [ ] Add semantic modules to artifact check script.
- [ ] Add semantic smoke tests to artifact check script.
- [ ] Add semantic modules to CI workflow.
- [ ] Add semantic smoke tests to CI workflow.
- [ ] Run the full artifact check.
- [ ] Run the postulate audit.
- [ ] Run the paper-map audit.
- [ ] Record any remaining trusted inputs.

### Acceptance Criteria

- [ ] Paper claims match code claims.
- [ ] Every theorem has a status.
- [ ] The trust boundary is explicit.
- [ ] CI covers the new semantic modules.
- [ ] The reviewer can see exactly what is mechanized and what is conditional.

## Paper Checklist

### Title And Abstract

- [ ] Title remains accurate after theorem qualification.
- [ ] Abstract says "primitive public structural trace".
- [ ] Abstract mentions admissible sealed extensions.
- [ ] Abstract mentions higher obligations as derived from binary trace.
- [ ] Abstract mentions Kan composition/filling.
- [ ] Abstract mentions full coupling for recurrence equality.
- [ ] Abstract mentions constant-payload Fibonacci as a specialization.
- [ ] Abstract does not say higher coherences vanish.

### Introduction

- [ ] Add paragraph distinguishing higher cubical objects, higher structural
      obligations, primitive public trace, and derived trace.
- [ ] Add "scope at a glance" table.
- [ ] Include sealed foundational extension boundaries as in scope.
- [ ] Include transparent definitions as out of recurrence scope.
- [ ] Include structural integration trace as in scope.
- [ ] Include arbitrary user payload as out of structural trace scope.
- [ ] Include full-coupling equality as a maximal regime.
- [ ] Include sparse/orthogonal growth as separate from equality.

### Preliminaries

- [ ] Define cubical foundation.
- [ ] Define sealed extension.
- [ ] Define public interface.
- [ ] Define payload.
- [ ] Define resolved trace.
- [ ] Define primitive trace.
- [ ] Define derived trace.
- [ ] Define historical support.
- [ ] Define coherence depth.
- [ ] Define chronological window.
- [ ] Define full coupling.

### Semantic Sections

- [ ] Introduce `SemanticCubicalFoundation` in prose.
- [ ] List interval and endpoints.
- [ ] List cofibrations/faces.
- [ ] List partial elements.
- [ ] List paths or interval-indexed equality.
- [ ] List transport.
- [ ] List homogeneous composition.
- [ ] List filling.
- [ ] List substitution stability.
- [ ] List optional univalence for lower bound.
- [ ] State theorem is parametric in this structure.

### Sealed Extensions And Trace

- [ ] Define `E_n = (B_n, K_n, T_n, interpretation_n)` or equivalent.
- [ ] Define `I_n = K_n + T_n`.
- [ ] Define transparent development separately.
- [ ] State transparent development has zero integration latency.
- [ ] Connect transparent development to existing formal material if available.

### Adequacy Section

- [ ] Define semantic structural obligations.
- [ ] Define raw clauses.
- [ ] Prove or state raw soundness.
- [ ] Prove or state raw completeness.
- [ ] Prove or state support preservation.
- [ ] Prove or state primitive/derived preservation.
- [ ] Prove or state cardinality preservation.
- [ ] Label theorem status honestly.

### Upper Bound Section

- [ ] Normalize an arbitrary structural obligation.
- [ ] Handle unary case.
- [ ] Handle binary case.
- [ ] Handle higher horn package case.
- [ ] Use `hfill`/`hcomp` for higher horn trace.
- [ ] Use telescopic subsumption for remote comparisons.
- [ ] Conclude no primitive trace beyond depth two remains.
- [ ] Avoid filler-space contractibility claims.

### Lower Bound Section

- [ ] Present swap witness.
- [ ] Explain nontrivial equivalence on the two-point type.
- [ ] Explain univalence path.
- [ ] Explain transport of unary clauses.
- [ ] Explain distinguishability of constant-left and constant-right.
- [ ] Conclude binary comparison is not unary-derived.
- [ ] Optionally present clutching witness.

### Scaling Section

- [ ] Define `K_n`, `T_n`, `I_n`.
- [ ] Define `kappa_n` and `mu_n`.
- [ ] State chronological window theorem.
- [ ] State full coupling as `T_(n+1) ~= I_n + I_(n-1)`.
- [ ] Derive affine recurrence.
- [ ] State sparse cases separately.
- [ ] State constant-payload Fibonacci corollary.
- [ ] Include bootstrap convention.

### Limitations

- [ ] Say arbitrary Cubical Agda elaboration remains outside scope unless a
      concrete elaborator adequacy theorem is supplied.
- [ ] Say semantic adequacy may remain a package/assumption until instantiated.
- [ ] Say full coupling is maximal, not universal.
- [ ] Say higher payload can be primitive at any dimension.
- [ ] Say no global truncation of cubical foundations is claimed.

## Agda Checklist

### New Semantic Modules

- [ ] `agda/Semantics/CubicalFoundation.agda`
- [ ] `agda/Semantics/SealedExtension.agda`
- [ ] `agda/Semantics/PrimitiveTrace.agda`
- [ ] `agda/Semantics/RawAdequacy.agda`
- [ ] `agda/Semantics/TraceNormalForm.agda`
- [ ] `agda/Semantics/SemanticHornReduction.agda`
- [ ] `agda/Semantics/DepthUpperBound.agda`
- [ ] `agda/Semantics/DepthLowerBound.agda`
- [ ] `agda/Semantics/ExactDepth.agda`
- [ ] `agda/Semantics/ChronologicalWindow.agda`
- [ ] `agda/Semantics/FullCoupling.agda`
- [ ] `agda/Semantics/ScalingRecurrence.agda`
- [ ] `agda/Semantics/FibonacciScaling.agda`

### Existing Modules To Update

- [ ] `agda/Metatheory/RawStructuralSyntax.agda`
- [ ] `agda/Metatheory/RawStructuralTyping.agda`
- [ ] `agda/Metatheory/SurfaceNormalizationBridge.agda`
- [ ] `agda/Metatheory/UniversalRecurrence.agda`
- [ ] `agda/Metatheory/SparseDependencyRecurrence.agda`
- [ ] `agda/Metatheory/FullCouplingEnvelope.agda`
- [ ] `agda/Core/AffineRecurrence.agda`
- [ ] `agda/Everything.agda`
- [ ] `agda/PEN.agda`

### Tests

- [ ] Add `agda/Test/SemanticDepthSmoke.agda`.
- [ ] Add `agda/Test/FibonacciScalingSmoke.agda`.
- [ ] Add tests for semantic foundation records.
- [ ] Add tests for sealed extension interface splitting.
- [ ] Add tests for raw adequacy package plumbing.
- [ ] Add tests for trace normal form classification.
- [ ] Add tests for horn-derived trace.
- [ ] Add tests for exact depth theorem.
- [ ] Add tests for chronological window theorem.
- [ ] Add tests for full-coupling recurrence.
- [ ] Add tests for sparse coupling separation.
- [ ] Add tests for transparent zero latency.
- [ ] Add tests for higher payload classification.

### Theorem Names To Stabilize

- [ ] `SemanticCubicalFoundation`
- [ ] `KanStructure`
- [ ] `UnivalenceStructure`
- [ ] `SemanticLibraryState`
- [ ] `SemanticSealedLayer`
- [ ] `semantic-public-interface`
- [ ] `semantic-transparent-zero-latency`
- [ ] `RawAdequacyPackage`
- [ ] `raw-syntax-sound-for-semantic-extensions`
- [ ] `semantic-extension-elaborates-to-raw`
- [ ] `raw-normalization-preserves-semantics`
- [ ] `raw-normalization-preserves-support`
- [ ] `raw-normalization-preserves-primitive-status`
- [ ] `raw-normalization-preserves-cardinality`
- [ ] `semantic-trace-normal-form`
- [ ] `unary-action-trace-primitive-candidate`
- [ ] `binary-comparison-trace-primitive-candidate`
- [ ] `higher-horn-trace-derived`
- [ ] `semantic-horn-extension-derived`
- [ ] `higher-structural-obligation-derived-by-hfill`
- [ ] `semantic-telescopic-subsumption`
- [ ] `semantic-remote-comparison-derived`
- [ ] `primitive-trace-depth-at-most-two`
- [ ] `swap-path-forces-binary-trace`
- [ ] `semantic-depth-one-impossible`
- [ ] `cubical-foundations-primitive-coherence-depth-exactly-two`
- [ ] `exact-depth-two-implies-chronological-window-two`
- [ ] `full-coupling-window-iso`
- [ ] `full-coupling-affine-recurrence`
- [ ] `constant-payload-fibonacci-scaling`

## Documentation And Metadata Checklist

### `paper-map.yaml`

- [ ] Add `thm:semantic-adequacy`.
- [ ] Add `thm:semantic-horn-reduction`.
- [ ] Add `thm:primitive-depth-upper-bound`.
- [ ] Add `thm:primitive-depth-lower-bound`.
- [ ] Add `thm:cubical-depth-exactly-two`.
- [ ] Add `thm:full-coupling-affine-recurrence`.
- [ ] Add `cor:constant-payload-fibonacci`.
- [ ] Include Agda module for each theorem.
- [ ] Include Agda theorem name for each theorem.
- [ ] Include status for each theorem.
- [ ] Include trusted inputs for conditional/assumed theorems.

### `docs/theorem_index.md`

- [ ] Add section "Semantic Upgrade Theorems".
- [ ] List all semantic foundation theorems.
- [ ] List all adequacy theorems.
- [ ] List all normal-form theorems.
- [ ] List all horn-reduction theorems.
- [ ] List all depth theorems.
- [ ] List all window/scaling theorems.
- [ ] Mark conditional results clearly.

### `docs/coherence_depth_trust_boundary.md`

- [ ] State theorem is parametric in `SemanticCubicalFoundation`.
- [ ] State full semantic theorem depends on `RawAdequacyPackage`.
- [ ] State what is mechanized for the fixed admissible extension language.
- [ ] State arbitrary Cubical Agda parser/elaborator adequacy remains outside
      scope unless added.
- [ ] State which assumptions are trusted inputs.

### `README.txt`

- [ ] Add commands for checking semantic modules.
- [ ] Add commands for checking semantic smoke tests.
- [ ] Add commands for running artifact check script.
- [ ] Add commands for running postulate audit.
- [ ] Add commands for running paper-map audit.

## Automation, CI, And Audit Checklist

### Artifact Check Script

- [ ] Update `scripts/check_coherence_depth_artifact.sh`.
- [ ] Add `Semantics/CubicalFoundation.agda`.
- [ ] Add `Semantics/SealedExtension.agda`.
- [ ] Add `Semantics/PrimitiveTrace.agda`.
- [ ] Add `Semantics/RawAdequacy.agda`.
- [ ] Add `Semantics/TraceNormalForm.agda`.
- [ ] Add `Semantics/SemanticHornReduction.agda`.
- [ ] Add `Semantics/DepthUpperBound.agda`.
- [ ] Add `Semantics/DepthLowerBound.agda`.
- [ ] Add `Semantics/ExactDepth.agda`.
- [ ] Add `Semantics/ChronologicalWindow.agda`.
- [ ] Add `Semantics/FullCoupling.agda`.
- [ ] Add `Semantics/ScalingRecurrence.agda`.
- [ ] Add `Semantics/FibonacciScaling.agda`.
- [ ] Add `Test/SemanticDepthSmoke.agda`.
- [ ] Add `Test/FibonacciScalingSmoke.agda`.

### CI Workflow

- [ ] Update `.github/workflows/artifact-check.yml`.
- [ ] Ensure CI runs semantic modules.
- [ ] Ensure CI runs semantic smoke tests.
- [ ] Ensure CI runs paper-map audit.
- [ ] Ensure CI runs postulate audit.

### Audit Scripts

- [ ] Update `scripts/check_paper_map.py`.
- [ ] Update `scripts/audit_postulates.py`.
- [ ] Teach scripts status `mechanized`.
- [ ] Teach scripts status `conditional-on-adequacy-package`.
- [ ] Teach scripts status `paper-only`.
- [ ] Teach scripts status `trusted-input`.
- [ ] Make hidden semantic adequacy assumptions fail the audit.
- [ ] Make missing theorem-map entries fail the audit.

## Risk Mitigation Checklist

### Risk: Semantic Adequacy Is Too Hard

- [ ] Keep downstream theorems parametric in `RawAdequacyPackage`.
- [ ] Instantiate the package only where justified.
- [ ] Clearly distinguish conditional metatheorem from instantiated theorem.
- [ ] Track unproved adequacy fields in `paper-map.yaml`.

### Risk: Arbitrary HIT Constructors Are Counted As Trace

- [ ] Classify user-supplied higher constructors as payload.
- [ ] Add a higher-payload case study.
- [ ] Add a test that higher payload does not increase structural trace depth.

### Risk: Horn Theorem Overclaims Contractibility

- [ ] State derived-trace computability instead of filler-space
      contractibility.
- [ ] Audit paper for words like "unique filler" and qualify them if present.
- [ ] Ensure semantic horn theorem uses `hfill`/`hcomp`.

### Risk: Full Coupling Is Treated As Universal

- [ ] Define full coupling as maximal/full dependency footprint.
- [ ] Define sparse coupling separately.
- [ ] Add sparse example.
- [ ] State sparse cases as bounded by the full-coupling envelope.

### Risk: Fibonacci Indexing Mismatch

- [ ] Add indexing convention box.
- [ ] Add first-values smoke theorem.
- [ ] Cross-check paper formula against Agda theorem.
- [ ] Cross-check bootstrap assumptions.

### Risk: Universe Levels Become Unmanageable

- [ ] Split semantic records into smaller records.
- [ ] Keep universe polymorphism only where necessary.
- [ ] Add small smoke modules before larger theorem modules.

### Risk: Artifact Appears To Assume The Theorem

- [ ] Avoid classifying horn trace as derived without semantic derivation.
- [ ] Add explicit derivation theorem using `hfill`/`hcomp`.
- [ ] Make adequacy assumptions visible in docs and audits.

## Minimum Viable Next Version

Use this section if time is limited.

- [ ] Paper states the full theorem as conditional on a semantic adequacy
      package.
- [ ] Code defines `RawAdequacyPackage` explicitly.
- [ ] Downstream exact-depth theorem is mechanized relative to the package.
- [ ] Downstream recurrence theorem is mechanized relative to the package.
- [ ] Downstream Fibonacci corollary is mechanized relative to the package.
- [ ] Swap lower bound remains mechanized.
- [ ] Paper clearly labels the semantic bridge and its mechanization status.
- [ ] Artifact check includes all newly introduced semantic wrappers.
- [ ] Trust-boundary document is updated.

## Final Verification Commands

Run these after the corresponding modules exist.

```bash
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
agda --transliterate Test/SemanticDepthSmoke.agda
agda --transliterate Test/FibonacciScalingSmoke.agda
```

Also run:

```bash
scripts/check_coherence_depth_artifact.sh
python scripts/check_paper_map.py
python scripts/audit_postulates.py
```
