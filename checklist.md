# Checklist: Finish the LMCS Improvement Plan

## Claim calibration

- [x] Rewrite the abstract around the fixed sealed-extension calculus.
- [x] State by page 2 that the result is not about arbitrary Cubical Agda developments, arbitrary module systems, or arbitrary cubical foundations.
- [x] Decide whether the title should keep "Toward" or claim the theorem directly.
- [x] Replace broad transfer claims with adequacy-interface claims.
- [x] Remove repeated scope disclaimers after keeping one in the introduction, one near the main theorem, and one in the conclusion.

## Formal core

- [x] Define `Real_k(X)` as an actual dependent object.
- [x] Define restriction maps `res_{k,l} : Real_l(X) -> Real_k(X)`.
- [x] Prove restriction-map functoriality.
- [x] State the exact equivalence used in `Real_k(X) ~= Real_2(X)`.
- [x] Define raw trace fields before primitive/derived classification.
- [x] Define the structural horn grammar with constructors, boundaries, missing faces, filler types, support, substitutions, and export status.
- [x] State the structural horn induction principle.
- [x] Prove horn-to-open-box adequacy by induction on the grammar.
- [x] In the adequacy proof, identify `A`, `phi`, `u`, `u0`, compatible lids, and fillers for every constructor.
- [x] Define explicit structural open boxes in the paper.
- [x] Prove total open-extension contractibility.
- [x] State clearly that fixed-lid filler spaces are not generally contractible.
- [x] Define `DerivedTrace` witnesses.
- [x] Prove every higher structural trace field has a `DerivedTrace` witness.
- [x] Prove the replacement theorem for derived structural trace.
- [x] Define primitive status and `mu` only after replacement is established.
- [x] Prove the final upper bound `Real_k(X) ~= Real_2(X)` for `k >= 2`.

## Lower bound

- [x] Restate the lower bound as a separation between unary and binary obligations.
- [x] Show the unary fragment accepts the objectwise constant-left endomap.
- [x] Show binary sealing fails along `ua(swap)`.
- [x] Prove transport in the endomorphism family conjugates by `swap`.
- [x] Show identity is fixed by conjugation.
- [x] Show constant-left is transported to constant-right.
- [x] Conclude the naturality equation is uninhabited for constant-left.
- [x] Derive `d_obl >= 2` explicitly.

## Mechanization

- [x] Add or update an explicit Agda `StructuralOpenBox` record.
- [x] Include fields for `A : I -> Type`, `phi`, partial boundary `u`, compatible base face `u0`, compatible lids, side equations, endpoint laws, and substitution stability.
- [x] Define `OpenExt(ob)` as compatible lids plus `PathP` fillers.
- [x] Mechanize contractibility of `OpenExt(ob)` as a dependent path singleton.
- [x] Decode each sealing-generated higher horn into an explicit open box.
- [x] Replace raw higher-horn derived tags with derivation objects where feasible.
- [x] Clarify whether `RawAdequacyPackage` is assumed, instantiated, partially proved, or paper-only.
- [x] Update the theorem map.
- [x] Update README artifact-check commands.
- [x] Update the mechanization appendix with statuses: fully mechanized, abstract-interface mechanized, conditional on adequacy, paper-only.

## Section 6 and length

- [x] Decide whether recurrence material stays in the main paper or moves to supplementary material.
- [x] If kept, rename or frame it as conditional counting consequences.
- [x] Put all recurrence assumptions in theorem names and first sentences.
- [x] Remove any implication that ordinary library growth follows a Fibonacci law.
- [x] Compress Sections 2-4 by removing trivial "by definition" propositions.
- [x] Replace long level audits with one theorem-dependency diagram.
- [x] Use one running example consistently.
- [x] Move most Appendix A details to artifact documentation or supplement.
- [x] Cut the main paper to about 45-50 pages or prepare a length justification.

## LMCS presentation

- [x] Move `\tableofcontents` from before the introduction to the end of the introduction, or remove it.
- [x] Shorten the abstract and reduce mathematical notation.
- [x] Prepare an HTML abstract if symbols remain necessary.
- [x] Verify the current `lmcs.cls` is used.
- [x] Use LMCS theorem environments consistently.
- [x] Add author affiliation.
- [ ] Add ORCID via `\lmcsorcid{}` if available.
- [x] Check for unsupported font packages.
- [ ] Eliminate Type 3 fonts.
- [ ] Verify clean text extraction for ligature-heavy words such as "fixed" and "affine."
- [ ] Fix overfull boxes.
- [x] Remove leftover comments.
- [x] Normalize bibliography formatting.
- [x] Add DOIs where possible.
- [ ] Archive a release on Zenodo.
- [ ] Cite the Zenodo DOI in the paper.

## Final verification

- [ ] Rebuild the PDF from a clean checkout.
- [x] Run Agda/artifact checks from the README.
- [ ] Run `pdffonts` and confirm no Type 3 fonts.
- [ ] Extract PDF text and spot-check readability.
- [x] Confirm every main theorem has a dependency list.
- [x] Confirm every artifact claim has a status classification.
- [x] Confirm no theorem uses "derived" as an unproved tag.
- [x] Confirm fixed-boundary filler contractibility is never claimed.
- [x] Confirm the main theorem statement matches the abstract and introduction.
- [ ] Do a final LMCS submission-guideline pass.
