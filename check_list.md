# Coherence Depth Paper Improvement Checklist

Derived from `paper_improvement_plan.md`.

Legend:

- `[x]` completed in this artifact folder.
- `[ ]` still open.

## Completed Artifact Setup In This Folder

- [x] Create a compact local artifact folder at `C:\dev\coherence-depth`.
- [x] Include `paper/1_coherence_depth.tex`.
- [x] Include direct TeX dependencies: `paper/coherence_depth_refs.bib` and `paper/lmcs.cls`.
- [x] Include theorem-facing Agda files under `agda/`.
- [x] Include theorem-facing docs under `docs/`.
- [x] Include audit scripts under `scripts/`.
- [x] Include case-study YAML fixtures under `runs/coherence_depth_case_studies/`.
- [x] Add root `README.txt`.
- [x] Add root `.gitignore` for Agda and LaTeX build outputs.
- [x] Run the case-study audit successfully.
- [x] Scan copied Agda source files and confirm no `.agda` file contains `postulate`.
- [x] Confirm Agda version available locally: Agda 2.8.0.
- [x] Check `agda/Test/Fibonacci.agda`.
- [x] Check top-level `agda/PEN.agda`.
- [x] Record that `PEN.agda` checks with known `UnsupportedIndexedMatch` warnings documented in the trust-boundary notes.

## Priority 0: Reproducible Formal Artifact

- [x] Provide a local artifact folder with relevant paper and Agda files.
- [x] Include `README.txt`.
- [x] Include Agda library file `agda/pen.agda-lib`.
- [x] Include theorem-facing source directories: `Core`, `Metatheory`, `Geometry`, `CaseStudies`, plus imported support namespaces.
- [x] Include theorem-facing tests under `agda/Test`.
- [x] Include audit script `scripts/coherence_depth_audit.py`.
- [x] Include artifact check script `scripts/check_coherence_depth_artifact.sh`.
- [x] Include trust-boundary documentation.
- [x] Include theorem index documentation.
- [x] Include case-study audit fixtures.
- [ ] Rename or add an artifact-specific `coherence-depth.agda-lib`.
- [ ] Add `src/Everything.agda` or decide that `agda/PEN.agda` is the artifact top-level.
- [ ] Add `paper-map.yaml`.
- [ ] Add `scripts/audit_postulates.py` with transitive import-closure checking.
- [ ] Add `scripts/check_paper_map.py`.
- [ ] Add a `Makefile`.
- [ ] Add CI configuration for the artifact repository.
- [ ] Publish the artifact as a public GitHub repository or archive.
- [ ] Cite an exact artifact commit hash.
- [ ] Pin the exact Cubical library version or commit.
- [ ] State exact expected build time.
- [ ] Ensure one command rebuilds every theorem cited in the paper.
- [ ] Ensure one command verifies theorem map and postulate audit.

## Priority 1: Make The Theorem Object Explicit

- [ ] Add compact formal raw syntax in Section 2.
- [ ] Specify states `B`.
- [ ] Specify layer identifiers.
- [ ] Specify payload telescopes.
- [ ] Specify action clauses.
- [ ] Specify comparison clauses.
- [ ] Specify export selections.
- [ ] Specify surface declarations.
- [ ] Add judgments for well-formed states.
- [ ] Add judgments for raw declarations.
- [ ] Add judgments for admissible declarations.
- [ ] Add elaboration judgment to candidates.
- [ ] Add sealing judgment.
- [ ] Add normalized public signature judgment.
- [ ] Add primitive-field judgment.
- [ ] Add derived-field judgment.
- [ ] Add support computation judgment.
- [ ] Make clear what declarations are and are not admissible.

## Priority 2: Separate Signatures, Index Sets, And Realized Types

- [ ] Replace overloaded `O^(k)(X)` notation.
- [ ] Define `ObSig_k(X)` as a finite normalized obligation signature.
- [ ] Define `Ix_k(X)` as primitive schema indices.
- [ ] Define `Real_k(X)` as the realized dependent type or space.
- [ ] Define `Prim_k(X)` as the primitive irreducible part.
- [ ] Define `Der_k(X)` as the derived or transparent part.
- [ ] State exact stabilization at the `Real_k` level.
- [ ] State minimal-signature elimination at the primitive-signature level.
- [ ] State the counting theorem in terms of primitive public trace fields.
- [ ] State the contractible-factor theorem at the realized-type level.
- [ ] Remove ambiguity between exact obligations and minimal public trace signatures.

## Priority 3: Repair The Horn-Extension Argument

- [ ] Define the horn-extension object precisely.
- [ ] Define the boundary object `partial`.
- [ ] Define the missing-data package.
- [ ] Define `Fill_partial(gamma)`.
- [ ] Either prove actual contractibility with center and contraction.
- [ ] Or weaken the exact theorem and keep the cost theorem.
- [ ] If weakened, keep canonical derived witnesses from `hcomp`/`hfill`.
- [ ] If weakened, prove elimination from `mu`-minimal public signatures.
- [ ] If weakened, prove the recurrence from primitive support rather than exact obligation equivalence.
- [ ] Remove or weaken claims of the form `O^(k)(X) ~= O^(2)(X)` if they are not formally justified.

## Priority 4: Fix Basis Uniqueness

- [ ] Replace arbitrary finite minimal generating-family uniqueness.
- [ ] Define basis elements as primitive normal-form classes or an explicit canonical basis.
- [ ] Prove uniqueness only for the canonical basis or prove invariance of cardinality.
- [ ] Separate basis existence from basis uniqueness.
- [ ] Ensure counting uses presentation-invariant primitive classes.

## Priority 5: Clarify Counting Convention

- [ ] Decide between one trace schema per active basis site per layer and one trace schema per payload generator per active basis site.
- [ ] State the convention before the recurrence theorem.
- [ ] Define payload contribution `kappa_n`.
- [ ] Define trace contribution `mu_n`.
- [ ] Make the density law match the chosen convention.
- [ ] Check all examples against the chosen convention.

## Priority 6: Recast Full Coupling As A Hypothesis

- [ ] Define active interface footprint.
- [ ] Define fully coupled footprint judgment.
- [ ] State full coupling as a hypothesis, not a derived conclusion.
- [ ] Separate sparse footprints from fully coupled footprints.
- [ ] State sparse recurrence before or alongside the full-window recurrence.
- [ ] Explain that ordinary library growth is often sparse.

## Section 1: Introduction

- [ ] Narrow the abstract.
- [ ] State the main theorem early with all assumptions visible.
- [ ] Add a "not claimed" paragraph.
- [ ] Say the theorem is not about arbitrary Cubical Agda programs.
- [ ] Say the theorem is not about transparent user-level library growth.
- [ ] Say the theorem is not about all cubical type theories.
- [ ] Say the theorem does not assert arbitrary higher HoTT fillers are contractible.
- [ ] Say the theorem is not a source-code line-count model.
- [ ] Add a main-theorem-at-a-glance box.
- [ ] Adjust tone away from broad Fibonacci/coherence slogans.

## Section 2: Fixed Cubical Extension Calculus

- [ ] Add a formal syntax block.
- [ ] Add formal judgments.
- [ ] Clarify opacity and sealing.
- [ ] Replace Theorem 2.17 with a statement matching the formal calculus.
- [ ] Revise Theorem 2.20 and Theorem 2.22.
- [ ] Strengthen the Integration Trace Principle.

## Section 3: Raw Bridge And Canonical Normal Forms

- [ ] Add actual presentation-step generators.
- [ ] Include rebundling.
- [ ] Include currying/uncurrying.
- [ ] Include transparent alias removal.
- [ ] Include duplicate derived-field removal.
- [ ] Include splitting/merging shell records.
- [ ] Prove or cite normal-form termination.
- [ ] Prove or cite normal-form confluence or enough uniqueness for `mu`.
- [ ] Fix Theorem 3.5.
- [ ] Make bridge scope prominent.
- [ ] Say which raw declaration constructors are covered.
- [ ] Say what remains paper-level explanatory.

## Section 4: Obligation Depth And Cubical Dichotomy

- [ ] Replace Definition 4.1 with separate `ObSig`, `Ix`, `Real`, and `Prim` definitions.
- [ ] Distinguish obligation depth from minimal-signature depth.
- [ ] Define chronological window size.
- [ ] Strengthen the taxonomy in Remark 4.2.
- [ ] Repair Lemma 4.5 with a dimension assignment or grammar induction.
- [ ] Rewrite Lemma 4.9 as the key upper-bound theorem.
- [ ] Add a labeled depth-three horn diagram.
- [ ] Define the remote layer in the general case.
- [ ] State which faces are visible from public traces.
- [ ] State which face is missing.
- [ ] Construct the missing-data package.
- [ ] Define the filler predicate.
- [ ] Prove the upper bound by induction using factorization-complete trace export.
- [ ] Fix Theorem 4.13 by proving contractibility or weakening to the cost/signature theorem.
- [ ] Clarify Theorem 4.11.
- [ ] Rewrite Theorem 4.15.
- [ ] Specify whether equality is definitional, path equality, quotient equality, or presentation equivalence.

## Section 4 Lower Bound

- [ ] Replace the risky global polymorphic endomap example.
- [ ] Use an objectwise promoted-interface candidate.
- [ ] Define the unary candidate.
- [ ] Define the binary sealing obligation.
- [ ] Show admissibility after full sealing.
- [ ] Show failure of depth-one sufficiency.
- [ ] Prove or explain transport by conjugation along `ua(swap)`.
- [ ] Add a positive control using identity.
- [ ] State the lower bound as depth-one insufficiency.

## Section 4 Clutching Family

- [ ] Decide whether the clutching family is load-bearing or an extended example.
- [ ] If load-bearing, define the exact raw extension declaration.
- [ ] If load-bearing, show primitive arity two.
- [ ] If load-bearing, show no primitive arity three.
- [ ] If not load-bearing, move it to an extended example.

## Section 5: Recurrence Theorem

- [ ] Rewrite Theorem 5.1 with explicit assumptions.
- [ ] State sparse recurrence before full recurrence or move sparse recurrence to an appendix.
- [ ] State full-window recurrence.
- [ ] Specialize to depth one.
- [ ] Specialize to depth two.
- [ ] Check indexing carefully.
- [ ] Add a bootstrap table.
- [ ] Add concrete counts for the running example.
- [ ] State the payload-aware affine recurrence.
- [ ] State the shifted Fibonacci consequence only under constant payload.

## Section 6: Mechanization

- [x] Include theorem-facing docs in the artifact.
- [x] Include a theorem index in `docs/theorem_index.md`.
- [x] Include trust-boundary notes in `docs/coherence_depth_trust_boundary.md`.
- [x] Include an artifact README.
- [x] Include a no-postulate scan result for copied Agda files.
- [x] Include a successful top-level Agda check result from this machine.
- [ ] Add a shorter theorem-map table to the paper.
- [ ] Add a machine-readable theorem map.
- [ ] Add a trusted-boundary box to the paper.
- [ ] Add true transitive import-closure postulate audit.
- [ ] Report uses of Agda primitives and trusted Cubical primitives.
- [ ] Add CI badge or build log.
- [ ] Add exact commit hash.
- [ ] Add exact dependency pins.
- [ ] Add one-command build evidence.

## Proof Patch Checklist

- [ ] Replace overloaded obligation notation everywhere.
- [ ] Audit every theorem statement for the level it concerns: syntax, index set, realized type, or cardinality.
- [ ] Prove or weaken horn contractibility.
- [ ] Repair basis uniqueness.
- [ ] Fix full-coupling and density assumptions.
- [ ] Repair lower-bound example.
- [ ] Recheck recurrence indexing and payload accounting.
- [ ] Align mechanization claims with actual artifact output.

## Suggested Revised Paper Outline

- [ ] Section 1: Introduction with problem, theorem, non-claims, contributions, and running example.
- [ ] Section 2: Sealed extension calculus.
- [ ] Section 3: Canonical normal forms and cost.
- [ ] Section 4: Obligation objects and depth notions.
- [ ] Section 5: Cubical horn-generation theorem.
- [ ] Section 6: Binary lower bound.
- [ ] Section 7: Recurrence theorem.
- [ ] Section 8: Mechanization and artifact.
- [ ] Section 9: Limitations and related work.

## Definitions To Add Or Tighten

- [ ] Normalized public signature.
- [ ] Primitive schema.
- [ ] Support and arity.
- [ ] Exact obligation object.
- [ ] Minimal-signature depth.
- [ ] Chronological window.
- [ ] Full coupling footprint.

## New Lemmas To Add Or Strengthen

- [ ] Normalization lemmas.
- [ ] Basis lemmas.
- [ ] Trace/cost lemmas.
- [ ] Horn lemmas.
- [ ] Chronology lemmas.
- [ ] Lower-bound lemmas.
- [ ] Recurrence lemmas.

## Mechanization Upgrade Plan

- [x] Create a minimum local artifact skeleton.
- [x] Include paper source.
- [x] Include checked Agda top-level `PEN.agda`.
- [x] Include theorem-facing modules.
- [x] Include audit fixtures and script.
- [x] Include README with build/check commands.
- [ ] Add `Everything.agda`.
- [ ] Add `paper-map.yaml`.
- [ ] Add theorem-map checker.
- [ ] Add import-closure postulate checker.
- [ ] Add Makefile.
- [ ] Add CI.
- [ ] Add archival release or public repository.

## README Checklist

- [x] State artifact purpose.
- [x] State broader development repository.
- [x] List directory layout.
- [x] List Agda requirement.
- [x] List Cubical library requirement.
- [x] List build/check commands.
- [x] Point to theorem index.
- [x] Point to trusted boundary.
- [ ] Explicitly state what theorem is formalized.
- [ ] Explicitly state what theorem is not formalized.
- [ ] Pin exact Cubical library version or commit.
- [ ] State expected build time.
- [ ] Explain how to locate theorem numbers such as Theorem 4.13, 4.17, and 5.1 without relying only on prose docs.

## Postulate Audit Checklist

- [x] Check copied `.agda` files for `postulate` tokens.
- [ ] Check transitive import closure of theorem-facing modules.
- [ ] Report module name.
- [ ] Report whether each module uses `postulate`.
- [ ] Report whether each module uses `primitive`.
- [ ] Report whether each module compiles with `--safe`.
- [ ] Report whether each module imports outside the trusted root.
- [ ] List trusted Agda and Cubical primitives explicitly.

## Paper-To-Agda Theorem Map

- [x] Include prose theorem index in `docs/theorem_index.md`.
- [x] Include trust-boundary table in `docs/coherence_depth_trust_boundary.md`.
- [ ] Convert theorem map to machine-readable `paper-map.yaml`.
- [ ] Include columns: paper claim, Agda module, Agda theorem names, status, uses bridge, trusted inputs.
- [ ] Keep a shorter table in the main paper.
- [ ] Put the complete map in an appendix or artifact file.

## Rhetorical And Exposition Improvements

- [ ] Reduce repeated theorem-stack summaries.
- [ ] Replace repetition with one dependency diagram and one theorem map.
- [ ] Add a running example with concrete counts.
- [ ] Add a sealed-layer export diagram.
- [ ] Add a depth-three horn diagram.
- [ ] Add a dependency graph from exact obligations to minimal signatures to recurrence.
- [ ] Add a sparse versus fully coupled footprint diagram.
- [ ] Add a frequently confused distinctions box.

## Literature And Positioning

- [ ] Position the contribution as a normalized cost invariant, not a replacement for standard coherence theory.
- [ ] Discuss cubical type theory and CCHM-style composition as operational substrate.
- [ ] Discuss Cubical Agda as proof assistant environment, not theorem target.
- [ ] Discuss univalence as source of binary lower-bound examples.
- [ ] Discuss Mac Lane/Stasheff/coherence as qualitative background.
- [ ] Discuss algebraic signatures, module systems, and normalization analogues.
- [ ] Explain why the result is not about arbitrary HoTT or arbitrary cubical calculi.

## Decision Tree If The Hard Theorem Fails

- [ ] If contractibility is fully provable, keep the exact obligation-depth theorem.
- [ ] If only canonical derived witnesses are provable, revise the main result to the minimal public-signature cost theorem.
- [ ] If only grammar-specific factorization is formalized, state the grammar-specific theorem.
- [ ] If the raw bridge is partial, restrict theorem statements and examples to covered constructors.

## Pre-Submission Checklist: Theorem Clarity

- [ ] The main theorem is stated in the introduction with all hypotheses visible.
- [ ] The theorem target is a fixed extension calculus, not cubical type theory in general.
- [ ] `ObSig`, `Real`, `Prim`, and `mu` are distinct objects.
- [ ] The recurrence theorem depends on a chronological-window theorem.
- [ ] Sparse extensions are explicitly outside the full-coupling recurrence or covered by a sparse recurrence.

## Pre-Submission Checklist: Definitions

- [ ] Raw syntax is specified.
- [ ] Admissibility is specified.
- [ ] Full coupling is specified by a footprint judgment.
- [ ] Presentation equivalence is generated by explicit constructors.
- [ ] Counting normalization has uniqueness or invariance lemmas.
- [ ] Primitive/derived tags are formal.
- [ ] Support and arity are invariant under normalization.

## Pre-Submission Checklist: Proofs

- [ ] Basis uniqueness no longer relies on arbitrary finite minimal generating families.
- [ ] Density theorem resolves the per-site/per-payload ambiguity.
- [ ] Horn-extension theorem includes explicit boundary/filler definitions.
- [ ] Contractibility is proved with center and contraction, or the exact theorem is weakened.
- [ ] Recent-history factorization specifies the equality notion used.
- [ ] Swap lower bound is formulated as a promoted-interface unary/binary separation.
- [ ] Clutching family is either formal and precise or moved to examples.

## Pre-Submission Checklist: Mechanization

- [x] Local artifact folder exists.
- [ ] Public repository or artifact archive exists.
- [ ] Commit hash is cited.
- [x] Agda version is identified locally.
- [ ] Agda version and Cubical library version are both pinned in the artifact.
- [ ] One-command build works from a Makefile or equivalent artifact command.
- [x] Copied theorem-facing Agda files are postulate-scanned.
- [ ] The theorem-facing import closure is postulate-audited.
- [ ] The theorem map is machine-readable.
- [ ] Paper-level explanatory claims are separated from formalized claims.

## Pre-Submission Checklist: Exposition

- [ ] Abstract is narrower and less overstuffed.
- [ ] Introduction has a not-claimed paragraph.
- [ ] The paper has one running example with concrete counts.
- [ ] The paper has diagrams for the trace principle and horn step.
- [ ] Repeated theorem-stack summaries are consolidated.
- [ ] Related work frames the result as a normalized cost model for sealed extensions.

## Recommended Order Of Work

### Phase 1: Lock The Theorem Target

- [ ] Define the raw calculus.
- [ ] Split `O^(k)` into `ObSig`, `Ix`, `Real`, and `Prim`.
- [ ] Fix basis uniqueness.
- [ ] Define full-coupling footprints.
- [ ] Settle the per-site/per-payload convention.

### Phase 2: Resolve The Horn Theorem

- [ ] Write the exact horn-extension object.
- [ ] Try to prove center and contraction in Agda.
- [ ] If contraction fails, downgrade exact stabilization and preserve the `mu`-elimination theorem.
- [ ] Update all downstream theorems accordingly.

### Phase 3: Repair The Lower Bound

- [ ] Replace the global endomap example with an objectwise promoted-interface candidate.
- [ ] Prove transport-by-conjugation along `ua(swap)`.
- [ ] Add the positive control using identity.
- [ ] State the lower bound as a depth-one insufficiency theorem.

### Phase 4: Rebuild Recurrence Section

- [ ] State sparse recurrence.
- [ ] State full-window recurrence.
- [ ] Specialize to depth one and depth two.
- [ ] Add bootstrap table and concrete counts.

### Phase 5: Publish The Artifact

- [x] Build/check `PEN.agda` as the current top-level artifact module.
- [ ] Build `Everything.agda` if that becomes the artifact top-level.
- [ ] Run theorem-map checker.
- [x] Run available postulate scan over copied `.agda` files.
- [ ] Run transitive import-closure postulate audit.
- [ ] Add CI.
- [ ] Update Section 6 from artifact output.

### Phase 6: Final Exposition Pass

- [ ] Narrow abstract.
- [ ] Add diagrams.
- [ ] Remove duplicate summaries.
- [ ] Add limitations.
- [ ] Update related work.
- [ ] Ensure every claim in the introduction is proved later or clearly labeled as motivation.

## Final Publication Standard

- [ ] Make explicit what calculus is being studied.
- [ ] Make explicit which declarations are admissible.
- [ ] Make explicit what full coupling means.
- [ ] Make explicit what exactly is counted.
- [ ] Make explicit what is a signature-level statement versus a type-level statement.
- [ ] Make explicit how cubical horn computation enters.
- [ ] Make explicit whether horn extension spaces are contractible or merely canonically represented.
- [ ] Make explicit why binary obligations are necessary.
- [ ] Make explicit why remote history does not add primitive trace fields.
- [ ] Make explicit why the recurrence follows.
- [ ] Make explicit what has been machine-checked.
