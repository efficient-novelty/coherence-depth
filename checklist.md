# LMCS Revision Checklist

Progress tracker for revising `paper/1_coherence_depth_LMCS.tex` before the first LMCS submission. Source plan: `paper_improvement_plan.md`.

## Phase 1 - Claim Calibration and Formal Core

- [x] Draft the final scoped main theorem statement before editing the abstract.
- [x] Add the fixed-calculus contract paragraph early in the paper.
- [x] Define the fixed calculus `C_ext` as the object of study.
- [ ] Define the cubical core assumptions used by `C_ext`.
- [x] Define raw sealed declarations and public signatures.
- [x] Define raw trace fields before assigning primitive or derived status.
- [x] Define structural trace and distinguish it from payload data.
- [x] Define the generated structural-obligation judgment.
- [x] Add constructors for action, comparison, horn, and payload/non-structural cases.
- [x] Define `Act`, `Cmp`, `Boundary_k`, and related terms before main theorem use.
- [ ] Define depth-indexed obligation signatures `ObSig_k(X)`.
- [ ] Define realization objects `Real_k(X)`.
- [x] Define restriction maps `res_{k,l}`.
- [x] Split admissibility into unary, binary, and full/depth-indexed variants.
- [ ] Define normalized public signatures and the normalization relation/function.
- [ ] State what normalization erases, replaces, and preserves.
- [ ] Add the non-goals paragraph once, early.
- [ ] Update the abstract to match the fixed-calculus scope.
- [x] Update the introduction to match the fixed-calculus scope.

## Phase 2 - Lower Bound and Upper Bound Core

- [ ] Define unary candidates separately from binary/full admissibility.
- [ ] Rewrite the lower-bound theorem as a `Real_1` vs `Real_2` or unary vs binary separation.
- [ ] Spell out the two-point/swap calculation.
- [ ] Connect the swap obstruction to public paths and binary comparison trace.
- [ ] Avoid calling the lower-bound counterexample fully admissible.
- [ ] Add the structural horn grammar for arity at least 3.
- [ ] State the structural-horn induction principle.
- [ ] State horn-to-open-box adequacy with explicit open-box data.
- [ ] Introduce an explicit structural open-box record/object.
- [ ] Define the total open-extension object `OpenExt(B)`.
- [ ] State total open-extension contractibility with the lid/remote face included.
- [ ] Add the fixed-lid non-contractibility/non-claim sentence.
- [ ] Explain the path-singleton proof idea for total contractibility.
- [ ] Clarify where `hcomp` supplies the canonical lid.
- [ ] Clarify where `hfill` supplies the canonical filler/path.
- [x] Prove or outline `Real_k(X) ~= Real_2(X)` using named `res` and `ext` maps.
- [x] Name the completion map `ext_{2,k}`.
- [x] State the equivalence laws for `res_{2,k}` and `ext_{2,k}`.
- [ ] Keep higher obligations inside `Real_k`; prove them contractible/derivable instead of excluding them.

## Phase 3 - Derivedness and Normalization

- [ ] Separate the exact realization layer from primitive public fields.
- [ ] Define `DerivedTrace(field)` as a witness object.
- [ ] Specify the components of a derived-trace witness.
- [ ] Prove derived witnesses for every generated higher structural field.
- [ ] Prove or describe the replacement theorem before defining primitive cost.
- [ ] Define primitive cost `mu` only after replacement is available.
- [ ] Prove that `mu`-minimal signatures contain no primitive structural trace field above arity 2.
- [x] Restate the main theorem as equivalence of `res_{2,k}` with constructed inverse.
- [ ] State the corollary on no primitive structural trace above binary arity.
- [ ] Ensure derivedness is never justified only by a tag or cost convention.

## Phase 4 - Mechanization Boundary and Artifact Map

- [ ] Add a theorem-to-artifact status table in the paper.
- [ ] Use a fixed status vocabulary for mechanization claims.
- [ ] Mark fully mechanized claims explicitly.
- [ ] Mark claims mechanized for an abstract interface explicitly.
- [ ] Mark claims conditional on adequacy explicitly.
- [ ] Mark paper-only claims explicitly.
- [ ] Add a trust-boundary paragraph near the contribution list.
- [ ] Make broad transfer claims conditional on an adequacy package.
- [ ] Clarify postulate/audit language.
- [ ] Align paper theorem statuses with `paper-map.yaml`.
- [ ] Add or update `paper-map.yaml` entries for the calculus definition and obligation grammar.
- [ ] Add or update theorem-map entries for `Real_k`, restriction maps, extension maps, equivalence proof, and contractible-factor elimination.
- [ ] Add or update theorem-map entries for horn decoding, total open-extension contractibility, replacement, depth-two stabilization, and recurrence.
- [ ] Ensure the theorem index points to modules implementing or approximating raw structural syntax.
- [ ] Ensure the theorem index points to modules implementing or approximating structural typing.
- [ ] Ensure the theorem index points to modules implementing or approximating structural boundary.
- [ ] Ensure the theorem index points to modules implementing or approximating horn decoding.
- [ ] Ensure the theorem index points to modules implementing or approximating public-signature normalization.
- [ ] Update `docs/theorem_index.md` to match the paper wording.
- [ ] Update trust-boundary docs to match the paper wording.
- [ ] Ensure Agda/module names reflect total extension rather than arbitrary filler uniqueness.
- [ ] Add a theorem-map note distinguishing total-extension contractibility from fixed-lid filler uniqueness.
- [ ] Mark recurrence theorem-map entries as conditional on accounting hypotheses.
- [ ] Add fixture names distinguishing sparse cases from full-coupling cases.
- [ ] Ensure the Zenodo artifact contains the theorem map.
- [ ] Ensure the Zenodo artifact contains trust-boundary documentation.
- [ ] Ensure the Zenodo artifact contains exact check commands.
- [ ] Freeze a tagged artifact release before Zenodo upload.
- [ ] Ensure the Zenodo artifact points to the tagged release.

## Phase 5 - Presentation Simplification

- [ ] Audit every theorem-like statement.
- [ ] Remove theorem labels from definitional statements.
- [ ] Convert rhetorical/scope statements into prose or remarks.
- [ ] Keep named theorem labels only for load-bearing results and useful corollaries.
- [ ] Add a proof dependency diagram.
- [ ] Add one running example and reuse it throughout.
- [ ] Use the running example in the introduction.
- [ ] Use the running example in the lower-bound section.
- [ ] Use the running example in the horn/open-box explanation.
- [ ] Use the running example in the final summary.
- [ ] Replace broad mechanization prose with the theorem-to-artifact table.
- [ ] Strengthen proof sketches for load-bearing results.
- [ ] For each load-bearing theorem, state the exact input data.
- [ ] For each load-bearing theorem, state the exact constructed output.
- [ ] For each load-bearing theorem, state the induction principle used.
- [ ] For each load-bearing theorem, state where cubical operations enter.
- [ ] For each load-bearing theorem, state why only lower-arity dependencies are used.
- [ ] For each load-bearing theorem, state artifact status.
- [ ] For each load-bearing theorem, state what would fail without it.
- [ ] Cut repeated scope disclaimers.
- [ ] Compress rhetorical terminology not used in theorem statements.
- [ ] Move detailed artifact instructions to repository or Zenodo documentation.
- [ ] Return to abstract, introduction, and conclusion after the core proof is stable.

## Conditional Recurrence and Accounting

- [ ] Rename the recurrence section to emphasize conditional accounting.
- [ ] State all full-coupling and factorization-complete export assumptions in the theorem name or statement.
- [ ] Move most recurrence material out of the main proof path.
- [ ] Add an explicit non-goal paragraph for ordinary transparent library growth.
- [ ] Audit recurrence indexing conventions.
- [ ] Audit payload counting conventions.
- [ ] Add a notation table for accounting symbols.
- [ ] Separate the recurrence corollary from the exact-depth theorem.
- [ ] Demote recurrence to a conditional accounting corollary.

## Suggested Section Outline Tracking

- [ ] Revise Section 1: Introduction.
- [ ] Add or revise Section 1.1: motivation, payload vs public structural trace.
- [x] Add or revise Section 1.2: main result for the fixed calculus.
- [ ] Add or revise Section 1.3: scope, non-goals, and mechanization boundary.
- [ ] Add or revise Section 1.4: related work.
- [x] Add or revise Section 2: fixed sealed-extension calculus `C_ext`.
- [ ] Add or revise Section 2.1: cubical core assumptions.
- [ ] Add or revise Section 2.2: raw sealed declarations and public signatures.
- [x] Add or revise Section 2.3: generated structural obligations.
- [ ] Add or revise Section 2.4: depth-indexed signatures `ObSig_k`.
- [ ] Add or revise Section 2.5: realization objects `Real_k` and restriction maps.
- [ ] Add or revise Section 3: binary trace is necessary.
- [ ] Add or revise Section 4: higher structural obligations as open boxes.
- [ ] Add or revise Section 5: replacement and depth-two stabilization.
- [ ] Add or revise Section 6: conditional counting consequences.
- [ ] Add or revise Section 7: mechanization and artifact boundary.
- [ ] Revise Section 8: conclusion.

## Definition and Theorem Template Tracking

- [x] Add definition: generated structural obligations.
- [ ] Add definition: depth-indexed realization.
- [ ] Add theorem: binary lower bound.
- [ ] Add theorem: horn-to-open-box adequacy.
- [ ] Add theorem: total open-extension contractibility.
- [ ] Add theorem: higher structural fields are derived.
- [ ] Add main theorem: exact structural depth two for `C_ext`.
- [ ] Add corollary: `mu`-minimal signatures omit higher primitive structural trace.

## Final Readiness Checks

- [ ] A referee can locate the complete definition of `C_ext`.
- [x] A referee can locate the generated obligation judgment.
- [ ] `Real_k(X)` is defined independently of `Real_k(X) ~= Real_2(X)`.
- [x] `res_{2,k}` is named, typed, and proved to be an equivalence.
- [x] The inverse/completion map for `res_{2,k}` is constructed.
- [ ] Open-box contractibility is stated only for the total extension object.
- [ ] The lid/remote face is included in the total extension object.
- [ ] The paper explicitly avoids fixed-lid filler uniqueness claims.
- [ ] The lower-bound example formally separates unary trace from binary trace.
- [ ] The lower-bound wording avoids calling a binary-failing object fully admissible.
- [ ] Every artifact claim has one of the fixed mechanization statuses.
- [ ] Broad transfer claims are conditional on the adequacy package.
- [ ] The recurrence is visibly conditional and downstream.
- [ ] Definitional/rhetorical propositions have been converted into definitions, remarks, or proof paragraphs.
- [ ] The upper-bound proof path is visible from grammar to horn decoding to total contractibility to replacement to depth-two equivalence.
