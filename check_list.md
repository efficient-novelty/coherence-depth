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

- [x] The main theorem is stated as a theorem about primitive public structural
      trace, not about the disappearance of higher cubical objects.
- [x] The paper distinguishes sealed foundational extensions from transparent
      definitional growth.
- [x] User-supplied higher HIT constructors are classified as payload, not
      automatically generated structural trace.
- [x] Full coupling is stated as an assumption for recurrence equality and
      Fibonacci scaling.
- [x] Sparse and orthogonal dependency patterns are stated as bounded or sparse
      regimes, not as Fibonacci equality.
- [x] The semantic adequacy boundary is explicit in both paper and artifact.
- [x] Every theorem in the paper has an entry in `paper-map.yaml`.
- [x] Every theorem entry has an honest status: `mechanized`,
      `conditional-on-adequacy-package`, `paper-only`, or `trusted-input`.
- [x] The Agda artifact typechecks after each milestone.
- [x] The postulate audit reports no hidden theorem-critical assumptions.
- [x] The paper, theorem index, paper map, and artifact agree on theorem names.

## Milestone 0: Stabilize The Target Statement

Goal: rewrite the central claim so it is precise, reviewer-proof, and aligned
with the mechanization target.

### Paper Tasks

- [x] Rewrite the main depth theorem around this phrase:
      "primitive public structural trace".
- [x] State that the theorem applies to admissible sealed structural
      extensions in cubical foundations with stable Kan composition/filling.
- [x] State the theorem parametrically in a semantic adequacy package.
- [x] State the exact-depth theorem separately from the scaling theorem.
- [x] State the scaling theorem separately from the Fibonacci corollary.
- [x] Add a theorem statement for exact primitive coherence depth two.
- [x] Add a theorem statement for the full-coupling affine recurrence:
      `mu_(n+1) = mu_n + mu_(n-1) + kappa_n + kappa_(n-1)`.
- [x] Add a theorem statement for constant-payload Fibonacci scaling.
- [x] Add an indexing convention box for `n`, `n + 1`, bootstrap cases,
      `mu_n`, `kappa_n`, and shifted trace `U_n`.
- [x] Decide whether the lower-bound proof uses swap, clutching, or both.
- [x] Record that decision in the paper and in this checklist.
      Decision: swap is the load-bearing lower-bound proof; clutching remains
      an extended topological witness/example.

### Guardrail Tasks

- [x] Add wording that higher cubical cells, paths, cubes, homotopies, and HIT
      constructors may exist at all dimensions.
- [x] Add wording that higher structural integration obligations are derived
      from binary trace by Kan composition/filling.
- [x] Add wording that arbitrary user higher constructors are payload.
- [x] Add wording that transparent development has zero integration latency in
      this model.
- [x] Add wording that sparse dependency footprints give sparse recurrences or
      upper-bound envelopes.
- [x] Avoid claims that all semantic filler spaces are contractible.

### Acceptance Criteria

- [x] No theorem wording implies that higher cubical objects vanish.
- [x] No theorem wording counts arbitrary user payload as structural trace.
- [x] No theorem wording says ordinary transparent library growth is Fibonacci.
- [x] Full coupling is visible in every equality-style recurrence statement.
- [x] The paper and Agda roadmap use the same recurrence indexing convention.

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
- [x] Avoid using raw calculus results directly in paper-facing semantic theorem
      statements without the adequacy package.
- [x] Mark uninstantiated adequacy fields as trusted inputs or conditional
      assumptions in `paper-map.yaml`.

### Paper Tasks

- [x] Add section "Semantic adequacy of the extension calculus".
- [x] Define semantic structural obligations.
- [x] Define raw action clauses.
- [x] Define raw comparison clauses.
- [x] Define raw horn clauses.
- [x] State raw soundness.
- [x] State raw completeness.
- [x] State preservation of support.
- [x] State preservation of primitive/derived status.
- [x] State preservation of cardinality.
- [x] Clearly label mechanized, conditional, and assumed parts.

### Acceptance Criteria

- [x] The paper can honestly say which results are conditional on adequacy.
- [ ] Downstream theorem modules typecheck parametrically over adequacy.
- [x] Adequacy assumptions are visible to the audit tooling.
- [x] The artifact does not look as if it assumes the main theorem.

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

- [x] Add section "Normal forms for structural trace".
- [x] Explain unary action trace.
- [x] Explain binary comparison trace.
- [x] Explain higher horn packages.
- [x] Explain why higher algebraic operations supplied by users are payload.
- [x] Make clear that horn packages are derived by semantic cubical structure,
      not by definition alone.

### Acceptance Criteria

- [x] Every normalized role has support data.
- [x] Every normalized role has primitive/derived classification.
- [x] Horn roles are not merely declared derived; they require semantic
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

- [x] Do not state that all filler spaces are contractible.
- [x] If uniqueness is needed, restrict it to the theorem-facing exported trace
      package, not all semantic fillers.
- [x] Ensure `hfill`/`hcomp` appear in the theorem dependencies.
- [ ] Ensure substitution stability is used where required.

### Paper Tasks

- [x] Add main upper-bound proof section.
- [x] Present the proof as derived-trace computability.
- [x] Explain how higher horn-shaped structural material is generated from
      binary boundary trace.
- [x] Explain telescopic subsumption without implying truncation of the
      foundation.

### Acceptance Criteria

- [x] The upper-bound engine is semantic, not merely syntactic.
- [x] Derived trace explicitly uses cubical filling/composition.
- [x] The paper does not claim semantic filler spaces are globally
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

- [x] State Theorem E: upper bound, depth at most two.
- [x] Use the normal-form split in the proof:
      unary, binary, higher horn.
- [x] Say higher horn trace is derived rather than primitive.

### Acceptance Criteria

- [x] The theorem is about primitive trace depth, not global truncation.
- [x] The theorem is conditional on or supplied with semantic adequacy.
- [x] The proof depends on semantic horn reduction.

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

- [x] Decide whether clutching is included as a theorem, example, or appendix.
- [x] If included, prove or connect `clutching-forces-binary-trace`.
- [x] Keep swap as the primary lower-bound proof if it is easier to maintain.

### Paper Tasks

- [x] Add main lower-bound proof section.
- [x] Explain the swap witness in reviewer-facing prose.
- [x] Optionally add the clutching witness as a richer geometric example.
- [x] State why the lower bound connects to the semantic primitive trace
      definition, not only to the synthetic calculus.

### Acceptance Criteria

- [ ] There is a named theorem `semantic-depth-one-impossible`.
- [x] The proof uses semantic primitive trace definitions.
- [x] The lower bound does not rely only on the synthetic obligation language.
- [x] The required univalence assumption is explicit.

## Milestone 7: Exact Depth Theorem

Goal: combine upper and lower bounds into the paper-facing result.

### New Agda Module

- [ ] Add `agda/Semantics/ExactDepth.agda`.

### Theorem Tasks

- [ ] Import `Semantics.DepthUpperBound`.
- [ ] Import `Semantics.DepthLowerBound`.
- [ ] Prove `cubical-foundations-primitive-coherence-depth-exactly-two`.
- [ ] Add alias `sealed-structural-trace-depth-exactly-two` if useful.
- [x] Ensure there is one canonical theorem name used by the paper.

### Documentation Tasks

- [x] Add exact-depth theorem to `paper-map.yaml`.
- [x] Add exact-depth theorem to `docs/theorem_index.md`.
- [x] Add exact-depth theorem to the paper mechanization table.

### Acceptance Criteria

- [x] The paper has one canonical exact-depth theorem.
- [x] The theorem combines both `depth <= 2` and `depth > 1`.
- [x] The theorem states all required assumptions.

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

- [x] Define cardinalities `kappa_n = |K_n|` and `mu_n = |T_n|`.
- [x] Prove `I_n = K_n + T_n` at the cardinality level.
- [x] Prove `full-coupling-affine-recurrence`.
- [x] Ensure the recurrence theorem assumes full coupling.
- [x] Ensure sparse cases are not presented as equality unless their footprint
      is full.

### Paper Tasks

- [x] Add chronological window theorem.
- [x] Add full coupling definition.
- [x] Add sparse coupling definition or remark.
- [x] Add affine recurrence theorem.
- [x] Separate full-coupling equality from sparse upper-bound behavior.

### Acceptance Criteria

- [x] Exact depth two is the input to the chronological window theorem.
- [ ] Full coupling is an isomorphism in code.
- [x] The recurrence theorem is bookkeeping after the full-coupling isomorphism.
- [x] Sparse and full-coupling regimes cannot be confused.

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
- [x] Align theorem indexing with `Core.AffineRecurrence`.
- [ ] Add a smoke theorem that checks the first few values.

### Paper Tasks

- [x] State constant-payload corollary.
- [x] State exact bootstrap convention.
- [x] Show the shifted sequence is Fibonacci.
- [x] Avoid implying all sealed sequences are Fibonacci.

### Acceptance Criteria

- [x] Paper formula and Agda theorem use the same indexing.
- [x] Bootstrap conditions are explicit.
- [x] The corollary depends on full coupling and constant payload.

## Milestone 10: End-To-End Examples

Goal: make the theorem tangible and test classification boundaries.

### Fixture Tasks

- [x] Add one full-coupling sealed extension sequence fixture.
- [x] Add one sparse dependency fixture.
- [x] Add one transparent-development fixture.
- [x] Add one higher-payload fixture.
- [x] Ensure each fixture has expected classification metadata.

### Possible Existing Case Studies To Review

- [x] Review `runs/coherence_depth_case_studies/universe_extension.yaml`.
- [x] Review `runs/coherence_depth_case_studies/universe_extension_refactored.yaml`.
- [x] Review `runs/coherence_depth_case_studies/sparse_datatype.yaml`.
- [x] Review `runs/coherence_depth_case_studies/transparent_lemma_extension.yaml`.
- [x] Review `runs/coherence_depth_case_studies/promoted_interface.yaml`.
- [x] Review `runs/coherence_depth_case_studies/global_modality.yaml`.

### Test Tasks

- [ ] Add semantic fixture tests.
- [ ] Add sparse classification tests.
- [ ] Add transparent zero-latency tests.
- [x] Add higher-payload classification tests.
- [x] Ensure audit script reports expected classification for each fixture.

### Paper Tasks

- [x] Add a small table of fixtures.
- [x] Show which fixture is full coupling.
- [x] Show which fixture is sparse.
- [x] Show which fixture is transparent and therefore outside recurrence.
- [x] Show which fixture contains higher payload rather than structural trace.

### Acceptance Criteria

- [x] Examples demonstrate the guardrails.
- [x] Classification agrees between paper, fixtures, and audit script.
- [x] No example accidentally treats arbitrary higher payload as trace.

## Milestone 11: Paper Rewrite And Artifact Audit

Goal: produce the next complete paper/artifact version.

### Paper Rewrite Tasks

- [x] Rewrite abstract.
- [x] Rewrite introduction.
- [x] Add "scope at a glance" table.
- [x] Add semantic cubical foundation section.
- [x] Add sealed extensions and trace section.
- [x] Add semantic adequacy section.
- [x] Add trace normal form section.
- [x] Add depth-at-most-two proof.
- [x] Add depth-at-least-two proof.
- [x] Add exact-depth theorem.
- [x] Add chronological window theorem.
- [x] Add recurrence theorem.
- [x] Add Fibonacci corollary.
- [x] Add theorem dependency diagram.
- [x] Update mechanization table.
- [x] Update limitations section.
- [x] Check that all claims match code status.

### Files To Update

- [x] Update `paper/1_coherence_depth.tex`.
- [x] Update `paper-map.yaml`.
- [x] Update `docs/theorem_index.md`.
- [x] Update `docs/coherence_depth_trust_boundary.md`.
- [x] Update `README.txt`.
- [x] Update `scripts/check_coherence_depth_artifact.sh`.
- [x] Update `scripts/check_paper_map.py`.
- [x] Update `scripts/audit_postulates.py`.
- [x] Update `.github/workflows/artifact-check.yml`.

### Artifact Check Tasks

- [ ] Add semantic modules to artifact check script.
- [ ] Add semantic smoke tests to artifact check script.
- [ ] Add semantic modules to CI workflow.
- [ ] Add semantic smoke tests to CI workflow.
- [x] Run the full artifact check.
- [x] Run the postulate audit.
- [x] Run the paper-map audit.
- [x] Record any remaining trusted inputs.

### Acceptance Criteria

- [x] Paper claims match code claims.
- [x] Every theorem has a status.
- [x] The trust boundary is explicit.
- [ ] CI covers the new semantic modules.
- [x] The reviewer can see exactly what is mechanized and what is conditional.

## Paper Checklist

### Title And Abstract

- [x] Title remains accurate after theorem qualification.
- [x] Abstract says "primitive public structural trace".
- [x] Abstract mentions admissible sealed extensions.
- [x] Abstract mentions higher obligations as derived from binary trace.
- [x] Abstract mentions Kan composition/filling.
- [x] Abstract mentions full coupling for recurrence equality.
- [x] Abstract mentions constant-payload Fibonacci as a specialization.
- [x] Abstract does not say higher coherences vanish.

### Introduction

- [x] Add paragraph distinguishing higher cubical objects, higher structural
      obligations, primitive public trace, and derived trace.
- [x] Add "scope at a glance" table.
- [x] Include sealed foundational extension boundaries as in scope.
- [x] Include transparent definitions as out of recurrence scope.
- [x] Include structural integration trace as in scope.
- [x] Include arbitrary user payload as out of structural trace scope.
- [x] Include full-coupling equality as a maximal regime.
- [x] Include sparse/orthogonal growth as separate from equality.

### Preliminaries

- [x] Define cubical foundation.
- [x] Define sealed extension.
- [x] Define public interface.
- [x] Define payload.
- [x] Define resolved trace.
- [x] Define primitive trace.
- [x] Define derived trace.
- [x] Define historical support.
- [x] Define coherence depth.
- [x] Define chronological window.
- [x] Define full coupling.

### Semantic Sections

- [x] Introduce `SemanticCubicalFoundation` in prose.
- [x] List interval and endpoints.
- [x] List cofibrations/faces.
- [x] List partial elements.
- [x] List paths or interval-indexed equality.
- [x] List transport.
- [x] List homogeneous composition.
- [x] List filling.
- [x] List substitution stability.
- [x] List optional univalence for lower bound.
- [x] State theorem is parametric in this structure.

### Sealed Extensions And Trace

- [x] Define `E_n = (B_n, K_n, T_n, interpretation_n)` or equivalent.
- [x] Define `I_n = K_n + T_n`.
- [x] Define transparent development separately.
- [x] State transparent development has zero integration latency.
- [x] Connect transparent development to existing formal material if available.

### Adequacy Section

- [x] Define semantic structural obligations.
- [x] Define raw clauses.
- [x] Prove or state raw soundness.
- [x] Prove or state raw completeness.
- [x] Prove or state support preservation.
- [x] Prove or state primitive/derived preservation.
- [x] Prove or state cardinality preservation.
- [x] Label theorem status honestly.

### Upper Bound Section

- [x] Normalize an arbitrary structural obligation.
- [x] Handle unary case.
- [x] Handle binary case.
- [x] Handle higher horn package case.
- [x] Use `hfill`/`hcomp` for higher horn trace.
- [x] Use telescopic subsumption for remote comparisons.
- [x] Conclude no primitive trace beyond depth two remains.
- [x] Avoid filler-space contractibility claims.

### Lower Bound Section

- [x] Present swap witness.
- [x] Explain nontrivial equivalence on the two-point type.
- [x] Explain univalence path.
- [x] Explain transport of unary clauses.
- [x] Explain distinguishability of constant-left and constant-right.
- [x] Conclude binary comparison is not unary-derived.
- [x] Optionally present clutching witness.

### Scaling Section

- [x] Define `K_n`, `T_n`, `I_n`.
- [x] Define `kappa_n` and `mu_n`.
- [x] State chronological window theorem.
- [x] State full coupling as `T_(n+1) ~= I_n + I_(n-1)`.
- [x] Derive affine recurrence.
- [x] State sparse cases separately.
- [x] State constant-payload Fibonacci corollary.
- [x] Include bootstrap convention.

### Limitations

- [x] Say arbitrary Cubical Agda elaboration remains outside scope unless a
      concrete elaborator adequacy theorem is supplied.
- [x] Say semantic adequacy may remain a package/assumption until instantiated.
- [x] Say full coupling is maximal, not universal.
- [x] Say higher payload can be primitive at any dimension.
- [x] Say no global truncation of cubical foundations is claimed.

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
- [x] Add tests for higher payload classification.

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

- [x] Add `thm:semantic-adequacy`.
- [x] Add `thm:semantic-horn-reduction`.
- [x] Add `thm:primitive-depth-upper-bound`.
- [x] Add `thm:primitive-depth-lower-bound`.
- [x] Add `thm:cubical-depth-exactly-two`.
- [x] Add `thm:full-coupling-affine-recurrence`.
- [x] Add `cor:constant-payload-fibonacci`.
- [x] Include Agda module for each theorem.
- [x] Include Agda theorem name for each theorem.
- [x] Include status for each theorem.
- [x] Include trusted inputs for conditional/assumed theorems.

### `docs/theorem_index.md`

- [x] Add section "Semantic Upgrade Theorems".
- [x] List all semantic foundation theorems.
- [x] List all adequacy theorems.
- [x] List all normal-form theorems.
- [x] List all horn-reduction theorems.
- [x] List all depth theorems.
- [x] List all window/scaling theorems.
- [x] Mark conditional results clearly.

### `docs/coherence_depth_trust_boundary.md`

- [x] State theorem is parametric in `SemanticCubicalFoundation`.
- [x] State full semantic theorem depends on `RawAdequacyPackage`.
- [x] State what is mechanized for the fixed admissible extension language.
- [x] State arbitrary Cubical Agda parser/elaborator adequacy remains outside
      scope unless added.
- [x] State which assumptions are trusted inputs.

### `README.txt`

- [ ] Add commands for checking semantic modules.
- [ ] Add commands for checking semantic smoke tests.
- [x] Add commands for running artifact check script.
- [x] Add commands for running postulate audit.
- [x] Add commands for running paper-map audit.

## Automation, CI, And Audit Checklist

### Artifact Check Script

- [x] Update `scripts/check_coherence_depth_artifact.sh`.
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
- [x] Ensure CI runs paper-map audit.
- [x] Ensure CI runs postulate audit.

### Audit Scripts

- [x] Update `scripts/check_paper_map.py`.
- [x] Update `scripts/audit_postulates.py`.
- [x] Teach scripts status `mechanized`.
- [x] Teach scripts status `conditional-on-adequacy-package`.
- [x] Teach scripts status `paper-only`.
- [x] Teach scripts status `trusted-input`.
- [ ] Make hidden semantic adequacy assumptions fail the audit.
- [x] Make missing theorem-map entries fail the audit.

## Risk Mitigation Checklist

### Risk: Semantic Adequacy Is Too Hard

- [ ] Keep downstream theorems parametric in `RawAdequacyPackage`.
- [ ] Instantiate the package only where justified.
- [x] Clearly distinguish conditional metatheorem from instantiated theorem.
- [x] Track unproved adequacy fields in `paper-map.yaml`.

### Risk: Arbitrary HIT Constructors Are Counted As Trace

- [x] Classify user-supplied higher constructors as payload.
- [x] Add a higher-payload case study.
- [x] Add a test that higher payload does not increase structural trace depth.

### Risk: Horn Theorem Overclaims Contractibility

- [x] State derived-trace computability instead of filler-space
      contractibility.
- [x] Audit paper for words like "unique filler" and qualify them if present.
- [x] Ensure semantic horn theorem uses `hfill`/`hcomp`.

### Risk: Full Coupling Is Treated As Universal

- [x] Define full coupling as maximal/full dependency footprint.
- [x] Define sparse coupling separately.
- [x] Add sparse example.
- [x] State sparse cases as bounded by the full-coupling envelope.

### Risk: Fibonacci Indexing Mismatch

- [x] Add indexing convention box.
- [ ] Add first-values smoke theorem.
- [x] Cross-check paper formula against Agda theorem.
- [x] Cross-check bootstrap assumptions.

### Risk: Universe Levels Become Unmanageable

- [ ] Split semantic records into smaller records.
- [ ] Keep universe polymorphism only where necessary.
- [ ] Add small smoke modules before larger theorem modules.

### Risk: Artifact Appears To Assume The Theorem

- [x] Avoid classifying horn trace as derived without semantic derivation.
- [x] Add explicit derivation theorem using `hfill`/`hcomp`.
- [x] Make adequacy assumptions visible in docs and audits.

## Minimum Viable Next Version

Use this section if time is limited.

- [x] Paper states the full theorem as conditional on a semantic adequacy
      package.
- [ ] Code defines `RawAdequacyPackage` explicitly.
- [ ] Downstream exact-depth theorem is mechanized relative to the package.
- [ ] Downstream recurrence theorem is mechanized relative to the package.
- [ ] Downstream Fibonacci corollary is mechanized relative to the package.
- [x] Swap lower bound remains mechanized.
- [x] Paper clearly labels the semantic bridge and its mechanization status.
- [ ] Artifact check includes all newly introduced semantic wrappers.
- [x] Trust-boundary document is updated.

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
