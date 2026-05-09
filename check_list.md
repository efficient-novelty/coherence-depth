# Paper Improvement Checklist

Tracking checklist distilled from `paper_improvement_plan.md`. Keep detailed rationale and proof sketches in the plan; use this file to track completion.

## Open-box formalization

- [x] Replace the abstract/thin `OpenBox` object with an explicit `StructuralOpenBox`.
- [x] Include the cubical family `A`, visible-face condition `phi`, side boundary, and compatible base face.
- [x] Define `BoundaryFamily` using compatible sub-elements.
- [ ] Define `Lid` as the compatible subtype at `i1`.
- [ ] Define `Filler` as a path through compatible elements.
- [x] Define `OpenExt` as the total space of lid plus filler.
- [x] Add an optional finite `FaceSystem` layer if useful for paper exposition.
- [x] Compile finite face systems into a single `Partial` boundary.
- [x] State the explicit open-box definition in the paper.
- [x] Prove the intuitive missing-face/filler package equivalent to explicit `OpenExt`.
- [x] Prove that the missing-face/open-extension equivalence is substitution-natural.
- [x] Construct `openExtCenter` using cubical composition/filling.
- [x] Add a wrapper such as `canonicalFillSub` for library-specific `Sub` details.
- [x] Prove `isContrPathPSingleton`.
- [x] Prove `openExtIsContr` without postulates.
- [x] Explicitly distinguish total open-box extensions from fixed-lid fillers.
- [x] Explicitly distinguish open-box extensions from closed-boundary filler spaces.
- [x] Prove named substitution stability for `OpenExt`.
- [x] Prove canonical center preservation under substitution.
- [x] Add a negative/non-theorem guard against applying open-box contractibility to closed boundaries.
- [x] If the explicit theorem is not mechanized, downgrade the paper claim to an adequacy assumption.

## Open-box modules

- [x] Add `CubicalOpenBox/FaceSystem.agda` if using explicit finite faces.
- [x] Add `CubicalOpenBox/Explicit.agda`.
- [x] Add `CubicalOpenBox/Center.agda`.
- [x] Add `CubicalOpenBox/Contractible.agda`.
- [x] Add `CubicalOpenBox/MissingFaceEquiv.agda`.
- [x] Add `CubicalOpenBox/Substitution.agda`.

## Derivedness architecture

- [x] Remove any raw primitive/derived tag from horn syntax.
- [x] Keep raw structural role and arity in raw syntax.
- [x] Ensure user-authored higher operations remain payload unless generated as structural trace.
- [x] Define `TraceRole` with action, comparison, and horn roles.
- [x] Define `RawTraceField` without unverified derived status.
- [x] Define `DerivedTrace` with boundary, replacement term, support proof, and soundness proof.
- [x] Define `PublicStatus` so derived status contains a derivation witness.
- [x] Prevent cached public status from bypassing irreducibility or derivation proofs.
- [x] Define `HornSemanticDerivation`.
- [x] Include lower boundary data in `HornSemanticDerivation`.
- [x] Construct an explicit open box from lower boundary data.
- [x] Relate the horn package to `OpenExt`.
- [x] Decode the canonical open-box center into the field type.
- [x] Prove the replacement term only uses lower public fields plus cubical Kan operations.
- [x] Prove replacement soundness.
- [x] Define `hornDerivedTrace`.

## Cubical horn elaboration

- [x] Prove `structuralHornElaboration`.
- [x] Handle remote comparison horn elaboration.
- [x] Build the cubical family for each structural horn.
- [x] Build the visible-face cofibration for each structural horn.
- [x] Build the side boundary from lower unary and binary traces.
- [x] Prove side overlaps from lower trace equations.
- [x] Build the compatible base face.
- [x] Form the explicit structural open box.
- [x] Compute the canonical center.
- [x] Decode the center into the public field type.
- [x] Prove side, endpoint, and transport equations.
- [x] Handle degenerate horn elaboration.
- [x] Handle transported horn elaboration.
- [x] Prove substitution-stable derivedness.

## Replacement and normalization

- [x] Prove `replaceDerivedField`.
- [x] Define the forward map that forgets the primitive field.
- [x] Define the backward map that inserts the computed term.
- [x] Prove both presentation-equivalence round trips.
- [x] Prove `higherStructuralTraceDerived`.
- [x] Normalize trace telescopes in dependency order.
- [x] Classify unary and binary structural trace fields as primitive candidates where appropriate.
- [x] Classify higher structural fields as derived only by calling the derivation theorem.
- [x] Ensure higher structural classification requires `IsStructuralHorn`, not just arity at least 3.
- [x] Apply derived-field replacement during normalization.
- [x] Prove normalization terminates because replacements use only lower data.
- [x] Prove `normalizeEliminatesHigherStructuralTrace`.
- [x] Ensure `mu` counts only payload plus irreducible unary/binary structural trace fields.

## Exact realization and public signature claims

- [x] Prove each depth-k marginal structural obligation is an explicit `OpenExt` over `Real_{k-1}(X)`.
- [x] Prove each such `OpenExt` is contractible.
- [x] Prove `Real_k(X) ~= Real_{k-1}(X)` for `k >= 3`.
- [x] Prove `Real_k(X) ~= Real_2(X)` for `k >= 2`.
- [x] State separately that arity `>= 3` structural trace fields have `DerivedTrace` witnesses.
- [x] State separately that such fields are removed from `mu`-minimal public trace signatures.
- [x] Keep exact-object contractibility separate from public-signature elimination.

## Artifact refactor

- [x] Update `Metatheory/RawStructuralSyntax.agda`.
- [x] Add or update `Metatheory/StructuralBoundary.agda`.
- [x] Add or update `Metatheory/HornOpenBox.agda`.
- [x] Add or update `Metatheory/HornElaboration.agda`.
- [x] Add or update `Metatheory/DerivedTrace.agda`.
- [x] Add or update `Metatheory/ReplaceDerivedField.agda`.
- [x] Add or update `Metatheory/NormalizationDerived.agda`.
- [x] Update `Surface/Modal/Adequacy.agda`.
- [x] Ensure SMod explicit horn fields elaborate through `HornElaboration`.
- [x] Ensure SMod no longer assigns derivedness by tag.
- [x] Run a `derived` search and verify it appears only in derivation records, witnessed public statuses, theorem names, or prose comments.

## Negative tests

- [x] Add a fake high-arity trace-shaped field without `StructuralBoundary`.
- [x] Verify that fake high-arity field is not classified as derived by tag.
- [x] Add or describe a closed-boundary filler request.
- [x] Verify `openExtIsContr` cannot be applied to arbitrary closed-boundary fillers.
- [x] Add an explicit SMod horn test.
- [x] Verify explicit SMod horn elaborates to `HornSemanticDerivation`.
- [x] Verify explicit SMod horn is removed from primitive trace.
- [x] Verify explicit SMod horn has the same `mu` as the omitted-horn presentation.
- [x] Add an omitted SMod horn test.
- [x] Verify omitted SMod horn inserts the same derived term.
- [x] Verify explicit and omitted SMod horn presentations are presentation-equivalent.
- [x] Add a fake higher payload test.
- [x] Verify fake higher payload is not eliminated as structural trace.

## Paper rewrites

- [x] Rewrite the open-box theorem with explicit `A`, `phi`, `u`, and `u0` data.
- [x] Add the warning that the theorem is not about fixed-lid fillers.
- [x] Add the warning that the theorem is not about closed boundaries.
- [x] Add the bridge lemma from generated structural horns to explicit open boxes.
- [x] Rewrite derivedness prose so horn clauses are derived only through derivation witnesses.
- [x] Remove wording that says horn clauses are simply tagged derived.
- [x] Add the minimal-signature elimination theorem.
- [x] Include proof steps for constructing `HornSemanticDerivation`, converting to `DerivedTrace`, replacing the field, and iterating over the telescope.
- [x] Add the scope warning for user-authored higher operations, HIT constructors, coherence axioms, and closed-boundary fillers.
- [x] Insert theorem/proof draft A for explicit open-box extension contractibility.
- [x] Insert lemma/proof draft B for generated structural horns as explicit open boxes.
- [x] Insert theorem/proof draft C for exact stabilization.
- [x] Insert theorem/proof draft D for derivedness-as-theorem.
- [x] Insert theorem/proof draft E for minimal-signature elimination.
- [x] Label any remaining abstraction as an adequacy assumption.

## Acceptance gates

- [x] `StructuralOpenBox` is not empty.
- [x] `OpenExt` contains `Partial`/`Sub` data or explicit side/agreement equations.
- [x] `openExtIsContr` is proved, not postulated.
- [x] The proof contracts `Sigma lid, filler`, not arbitrary fixed-lid fillers.
- [x] The proof does not claim arbitrary closed-boundary filler spaces are contractible.
- [x] Raw syntax has no unverified primitive/derived tag for horn clauses.
- [x] `DerivedTrace` contains an actual replacement term.
- [x] `HornSemanticDerivation` constructs an explicit open box from lower boundary data.
- [x] The replacement term is obtained from `openExtCenter` and decoded into the field type.
- [x] The replacement term uses only lower public fields plus cubical Kan operations.
- [x] Replacement soundness is proved.
- [x] Deleting a derived field is justified by presentation equivalence.
- [x] Normalization eliminates higher structural primitive fields by calling the derivation theorem.
- [x] User-authored higher payload data is not eliminated by this theorem.
- [x] Exact `Real_k` stabilization is proved using contractible open-box factors.
- [x] Minimal-public-signature elimination is proved using `DerivedTrace` and replacement.
- [x] The paper does not conflate contractible exact factors, derived fields, `mu`-minimal elimination, and absent obligations.
- [x] Any remaining abstraction is labeled as an adequacy assumption.
