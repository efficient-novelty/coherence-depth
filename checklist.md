# LMCS Revision Checklist

Progress tracker for revising `paper/1_coherence_depth_LMCS.tex` before the first LMCS submission. Source plan: `paper_improvement_plan.md`.

## Phase 1 - Claim Calibration and Formal Core

- [x] Draft the final scoped main theorem statement before editing the abstract.
- [x] Add the fixed-calculus contract paragraph early in the paper.
- [x] Define the fixed calculus `C_ext` as the object of study.
- [x] Define the cubical core assumptions used by `C_ext`.
- [x] Define raw sealed declarations and public signatures.
- [x] Define raw trace fields before assigning primitive or derived status.
- [x] Define structural trace and distinguish it from payload data.
- [x] Define the generated structural-obligation judgment.
- [x] Add constructors for action, comparison, horn, and payload/non-structural cases.
- [x] Define `Act`, `Cmp`, `Boundary_k`, and related terms before main theorem use.
- [x] Define depth-indexed obligation signatures `ObSig_k(X)`.
- [x] Define realization objects `Real_k(X)`.
- [x] Define restriction maps `res_{k,l}`.
- [x] Split admissibility into unary, binary, and full/depth-indexed variants.
- [x] Define normalized public signatures and the normalization relation/function.
- [x] State what normalization erases, replaces, and preserves.
- [x] Add the non-goals paragraph once, early.
- [x] Update the abstract to match the fixed-calculus scope.
- [x] Update the introduction to match the fixed-calculus scope.

## Phase 2 - Lower Bound and Upper Bound Core

- [x] Define unary candidates separately from binary/full admissibility.
- [x] Rewrite the lower-bound theorem as a `Real_1` vs `Real_2` or unary vs binary separation.
- [x] Spell out the two-point/swap calculation.
- [x] Connect the swap obstruction to public paths and binary comparison trace.
- [x] Avoid calling the lower-bound counterexample fully admissible.
- [x] Add the structural horn grammar for arity at least 3.
- [x] State the structural-horn induction principle.
- [x] State horn-to-open-box adequacy with explicit open-box data.
- [x] Introduce an explicit structural open-box record/object.
- [x] Define the total open-extension object `OpenExt(B)`.
- [x] State total open-extension contractibility with the lid/remote face included.
- [x] Add the fixed-lid non-contractibility/non-claim sentence.
- [x] Explain the path-singleton proof idea for total contractibility.
- [x] Clarify where `hcomp` supplies the canonical lid.
- [x] Clarify where `hfill` supplies the canonical filler/path.
- [x] Prove or outline `Real_k(X) ~= Real_2(X)` using named `res` and `ext` maps.
- [x] Name the completion map `ext_{2,k}`.
- [x] State the equivalence laws for `res_{2,k}` and `ext_{2,k}`.
- [x] Keep higher obligations inside `Real_k`; prove them contractible/derivable instead of excluding them.

## Phase 3 - Derivedness and Normalization

- [x] Separate the exact realization layer from primitive public fields.
- [x] Define `DerivedTrace(field)` as a witness object.
- [x] Specify the components of a derived-trace witness.
- [x] Prove derived witnesses for every generated higher structural field.
- [x] Prove or describe the replacement theorem before defining primitive cost.
- [x] Define primitive cost `mu` only after replacement is available.
- [x] Prove that `mu`-minimal signatures contain no primitive structural trace field above arity 2.
- [x] Restate the main theorem as equivalence of `res_{2,k}` with constructed inverse.
- [x] State the corollary on no primitive structural trace above binary arity.
- [x] Ensure derivedness is never justified only by a tag or cost convention.

## Phase 4 - Mechanization Boundary and Artifact Map

- [x] Add a theorem-to-artifact status table in the paper.
- [x] Use a fixed status vocabulary for mechanization claims.
- [x] Mark fully mechanized claims explicitly.
- [x] Mark claims mechanized for an abstract interface explicitly.
- [x] Mark claims conditional on adequacy explicitly.
- [x] Mark paper-only claims explicitly.
- [x] Add a trust-boundary paragraph near the contribution list.
- [x] Make broad transfer claims conditional on an adequacy package.
- [x] Clarify postulate/audit language.
- [x] Align paper theorem statuses with `paper-map.yaml`.
- [x] Add or update `paper-map.yaml` entries for the calculus definition and obligation grammar.
- [x] Add or update theorem-map entries for `Real_k`, restriction maps, extension maps, equivalence proof, and contractible-factor elimination.
- [x] Add or update theorem-map entries for horn decoding, total open-extension contractibility, replacement, depth-two stabilization, and recurrence.
- [x] Ensure the theorem index points to modules implementing or approximating raw structural syntax.
- [x] Ensure the theorem index points to modules implementing or approximating structural typing.
- [x] Ensure the theorem index points to modules implementing or approximating structural boundary.
- [x] Ensure the theorem index points to modules implementing or approximating horn decoding.
- [x] Ensure the theorem index points to modules implementing or approximating public-signature normalization.
- [x] Update `docs/theorem_index.md` to match the paper wording.
- [x] Update trust-boundary docs to match the paper wording.
- [x] Ensure Agda/module names reflect total extension rather than arbitrary filler uniqueness.
- [x] Add a theorem-map note distinguishing total-extension contractibility from fixed-lid filler uniqueness.
- [x] Mark recurrence theorem-map entries as conditional on accounting hypotheses.
- [x] Add fixture names distinguishing sparse cases from full-coupling cases.
- [x] Ensure the Zenodo artifact contains the theorem map.
- [x] Ensure the Zenodo artifact contains trust-boundary documentation.
- [x] Ensure the Zenodo artifact contains exact check commands.
- [x] Sync the Zenodo package LMCS source and PDF with the current 52-page build.
- [ ] Freeze a tagged artifact release before Zenodo upload.
- [ ] Ensure the Zenodo artifact points to the tagged release.
- [ ] Replace the Zenodo DOI placeholder in the paper and release metadata once the DOI is reserved.
- [ ] Record the final hosted artifact-check workflow URL for the tagged archival commit.
- [x] Decide whether final artifact checking should keep `paper-map.yaml` pointed at `paper/1_coherence_depth.tex` or add an LMCS-specific theorem-map target for `paper/1_coherence_depth_LMCS.tex`.

## Phase 5 - Presentation Simplification

- [x] Audit every theorem-like statement.
- [x] Remove theorem labels from definitional statements.
- [x] Convert rhetorical/scope statements into prose or remarks.
- [x] Keep named theorem labels only for load-bearing results and useful corollaries.
- [x] Add a proof dependency diagram.
- [x] Add one running example and reuse it throughout.
- [x] Use the running example in the introduction.
- [x] Use the running example in the lower-bound section.
- [x] Use the running example in the horn/open-box explanation.
- [x] Use the running example in the final summary.
- [x] Replace broad mechanization prose with the theorem-to-artifact table.
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
- [x] Move detailed artifact instructions to repository or Zenodo documentation.
- [x] Review remaining LaTeX overfull boxes before final submission, especially the displayed grammar around lines 482 and 2394 in the LMCS source.
- [x] Reassess the LMCS page budget after the mechanization table increased the compiled PDF to 52 pages.
- [x] Decide whether the theorem-to-artifact table should stay in the main LMCS text if the final page budget target is stricter than 51 pages.
- [x] Resolve or explicitly accept the remaining minor LaTeX layout warnings around the Section 3.1 heading, narrow role tables, and theorem-to-artifact status table.
- [x] Return to abstract, introduction, and conclusion after the core proof is stable.
- [x] Prepare either a final 50-page compression pass or an editor-facing length note if the LMCS PDF remains at 52 pages.
- [x] Keep release metadata out of the theorem-to-artifact table.

## Conditional Recurrence and Accounting

- [x] Rename the recurrence section to emphasize conditional accounting.
- [x] State all full-coupling and factorization-complete export assumptions in the theorem name or statement.
- [x] Move most recurrence material out of the main proof path.
- [x] Add an explicit non-goal paragraph for ordinary transparent library growth.
- [x] Audit recurrence indexing conventions.
- [x] Audit payload counting conventions.
- [x] Add a notation table for accounting symbols.
- [x] Separate the recurrence corollary from the exact-depth theorem.
- [x] Demote recurrence to a conditional accounting corollary.

## Suggested Section Outline Tracking

- [x] Revise Section 1: Introduction.
- [x] Add or revise Section 1.1: motivation, payload vs public structural trace.
- [x] Add or revise Section 1.2: main result for the fixed calculus.
- [x] Add or revise Section 1.3: scope, non-goals, and mechanization boundary.
- [ ] Add or revise Section 1.4: related work.
- [x] Add or revise Section 2: fixed sealed-extension calculus `C_ext`.
- [x] Add or revise Section 2.1: cubical core assumptions.
- [x] Add or revise Section 2.2: raw sealed declarations and public signatures.
- [x] Add or revise Section 2.3: generated structural obligations.
- [x] Add or revise Section 2.4: depth-indexed signatures `ObSig_k`.
- [x] Add or revise Section 2.5: realization objects `Real_k` and restriction maps.
- [x] Add or revise Section 3: binary trace is necessary.
- [x] Add or revise Section 4: higher structural obligations as open boxes.
- [x] Add or revise Section 5: replacement and depth-two stabilization.
- [x] Add or revise Section 6: conditional counting consequences.
- [x] Add or revise Section 7: mechanization and artifact boundary.
- [x] Revise Section 8: conclusion.

## Definition and Theorem Template Tracking

- [x] Add definition: generated structural obligations.
- [x] Add definition: depth-indexed realization.
- [x] Add theorem: binary lower bound.
- [x] Add theorem: horn-to-open-box adequacy.
- [x] Add theorem: total open-extension contractibility.
- [x] Add theorem: higher structural fields are derived.
- [x] Add main theorem: exact structural depth two for `C_ext`.
- [x] Add corollary: `mu`-minimal signatures omit higher primitive structural trace.

## Final Readiness Checks

- [x] A referee can locate the complete definition of `C_ext`.
- [x] A referee can locate the generated obligation judgment.
- [x] `Real_k(X)` is defined independently of `Real_k(X) ~= Real_2(X)`.
- [x] `res_{2,k}` is named, typed, and proved to be an equivalence.
- [x] The inverse/completion map for `res_{2,k}` is constructed.
- [x] Open-box contractibility is stated only for the total extension object.
- [x] The lid/remote face is included in the total extension object.
- [x] The paper explicitly avoids fixed-lid filler uniqueness claims.
- [x] The lower-bound example formally separates unary trace from binary trace.
- [x] The lower-bound wording avoids calling a binary-failing object fully admissible.
- [x] Every artifact claim has one of the fixed mechanization statuses.
- [x] Broad transfer claims are conditional on the adequacy package.
- [x] The recurrence is visibly conditional and downstream.
- [x] Definitional/rhetorical propositions have been converted into definitions, remarks, or proof paragraphs.
- [x] The upper-bound proof path is visible from grammar to horn decoding to total contractibility to replacement to depth-two equivalence.
