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
- [x] Rename or add an artifact-specific `coherence-depth.agda-lib`.
- [x] Add `src/Everything.agda` or decide that `agda/PEN.agda` is the artifact top-level.
- [x] Add `paper-map.yaml`.
- [x] Add `scripts/audit_postulates.py` with transitive import-closure checking.
- [x] Add `scripts/check_paper_map.py`.
- [x] Add a `Makefile`.
- [x] Add CI configuration for the artifact repository.
- [x] Publish the artifact as a public GitHub repository or archive.
- [ ] Cite an exact artifact commit hash.
- [x] Pin the exact Cubical library version or commit.
- [x] State exact expected build time.
- [x] Ensure one command rebuilds every theorem cited in the paper.
- [x] Ensure one command verifies theorem map and postulate audit.

## Priority 1: Make The Theorem Object Explicit

- [x] Add compact formal raw syntax in Section 2.
- [x] Specify states `B`.
- [x] Specify layer identifiers.
- [x] Specify payload telescopes.
- [x] Specify action clauses.
- [x] Specify comparison clauses.
- [x] Specify export selections.
- [x] Specify surface declarations.
- [x] Add judgments for well-formed states.
- [x] Add judgments for raw declarations.
- [x] Add judgments for admissible declarations.
- [x] Add elaboration judgment to candidates.
- [x] Add sealing judgment.
- [x] Add normalized public signature judgment.
- [x] Add primitive-field judgment.
- [x] Add derived-field judgment.
- [x] Add support computation judgment.
- [x] Make clear what declarations are and are not admissible.

## Priority 2: Separate Signatures, Index Sets, And Realized Types

- [x] Replace overloaded `O^(k)(X)` notation.
- [x] Define `ObSig_k(X)` as a finite normalized obligation signature.
- [x] Define `Ix_k(X)` as primitive schema indices.
- [x] Define `Real_k(X)` as the realized dependent type or space.
- [x] Define `Prim_k(X)` as the primitive irreducible part.
- [x] Define `Der_k(X)` as the derived or transparent part.
- [x] State exact stabilization at the `Real_k` level.
- [x] State minimal-signature elimination at the primitive-signature level.
- [x] State the counting theorem in terms of primitive public trace fields.
- [x] State the contractible-factor theorem at the realized-type level.
- [x] Remove ambiguity between exact obligations and minimal public trace signatures.

## Priority 3: Repair The Horn-Extension Argument

- [x] Define the horn-extension object precisely.
- [x] Define the boundary object `partial`.
- [x] Define the missing-data package.
- [x] Define `Fill_partial(gamma)`.
- [x] Either prove actual contractibility with center and contraction.
- [ ] Or weaken the exact theorem and keep the cost theorem.
- [ ] If weakened, keep canonical derived witnesses from `hcomp`/`hfill`.
- [ ] If weakened, prove elimination from `mu`-minimal public signatures.
- [ ] If weakened, prove the recurrence from primitive support rather than exact obligation equivalence.
- [x] Remove or weaken claims of the form `O^(k)(X) ~= O^(2)(X)` if they are not formally justified.

## Priority 4: Fix Basis Uniqueness

- [x] Replace arbitrary finite minimal generating-family uniqueness.
- [x] Define basis elements as primitive normal-form classes or an explicit canonical basis.
- [x] Prove uniqueness only for the canonical basis or prove invariance of cardinality.
- [x] Separate basis existence from basis uniqueness.
- [x] Ensure counting uses presentation-invariant primitive classes.

## Priority 5: Clarify Counting Convention

- [x] Decide between one trace schema per active basis site per layer and one trace schema per payload generator per active basis site.
- [x] State the convention before the recurrence theorem.
- [x] Define payload contribution `kappa_n`.
- [x] Define trace contribution `mu_n`.
- [x] Make the density law match the chosen convention.
- [x] Check all examples against the chosen convention.

## Priority 6: Recast Full Coupling As A Hypothesis

- [x] Define active interface footprint.
- [x] Define fully coupled footprint judgment.
- [x] State full coupling as a hypothesis, not a derived conclusion.
- [x] Separate sparse footprints from fully coupled footprints.
- [x] State sparse recurrence before or alongside the full-window recurrence.
- [x] Explain that ordinary library growth is often sparse.

## Section 1: Introduction

- [x] Narrow the abstract.
- [x] State the main theorem early with all assumptions visible.
- [x] Add a "not claimed" paragraph.
- [x] Say the theorem is not about arbitrary Cubical Agda programs.
- [x] Say the theorem is not about transparent user-level library growth.
- [x] Say the theorem is not about all cubical type theories.
- [x] Say the theorem does not assert arbitrary higher HoTT fillers are contractible.
- [x] Say the theorem is not a source-code line-count model.
- [x] Add a main-theorem-at-a-glance box.
- [x] Adjust tone away from broad Fibonacci/coherence slogans.

## Section 2: Fixed Cubical Extension Calculus

- [x] Add a formal syntax block.
- [x] Add formal judgments.
- [x] Clarify opacity and sealing.
- [x] Replace Theorem 2.17 with a statement matching the formal calculus.
- [x] Revise Theorem 2.20 and Theorem 2.22.
- [x] Strengthen the Integration Trace Principle.

## Section 3: Raw Bridge And Canonical Normal Forms

- [x] Add actual presentation-step generators.
- [x] Include rebundling.
- [x] Include currying/uncurrying.
- [x] Include transparent alias removal.
- [x] Include duplicate derived-field removal.
- [x] Include splitting/merging shell records.
- [x] Prove or cite normal-form termination.
- [x] Prove or cite normal-form confluence or enough uniqueness for `mu`.
- [x] Fix Theorem 3.5.
- [x] Make bridge scope prominent.
- [x] Say which raw declaration constructors are covered.
- [x] Say what remains paper-level explanatory.

## Section 4: Obligation Depth And Cubical Dichotomy

- [x] Replace Definition 4.1 with separate `ObSig`, `Ix`, `Real`, and `Prim` definitions.
- [x] Distinguish obligation depth from minimal-signature depth.
- [x] Define chronological window size.
- [x] Strengthen the taxonomy in Remark 4.2.
- [x] Repair Lemma 4.5 with a dimension assignment or grammar induction.
- [x] Rewrite Lemma 4.9 as the key upper-bound theorem.
- [x] Add a labeled depth-three horn diagram.
- [x] Define the remote layer in the general case.
- [x] State which faces are visible from public traces.
- [x] State which face is missing.
- [x] Construct the missing-data package.
- [x] Define the filler predicate.
- [x] Prove the upper bound by induction using factorization-complete trace export.
- [x] Fix Theorem 4.13 by proving contractibility or weakening to the cost/signature theorem.
- [x] Clarify Theorem 4.11.
- [x] Rewrite Theorem 4.15.
- [x] Specify whether equality is definitional, path equality, quotient equality, or presentation equivalence.

## Section 4 Lower Bound

- [x] Replace the risky global polymorphic endomap example.
- [x] Use an objectwise promoted-interface candidate.
- [x] Define the unary candidate.
- [x] Define the binary sealing obligation.
- [x] Show admissibility after full sealing.
- [x] Show failure of depth-one sufficiency.
- [x] Prove or explain transport by conjugation along `ua(swap)`.
- [x] Add a positive control using identity.
- [x] State the lower bound as depth-one insufficiency.

## Section 4 Clutching Family

- [x] Decide whether the clutching family is load-bearing or an extended example.
- [ ] If load-bearing, define the exact raw extension declaration.
- [ ] If load-bearing, show primitive arity two.
- [ ] If load-bearing, show no primitive arity three.
- [x] If not load-bearing, move it to an extended example.

## Section 5: Recurrence Theorem

- [x] Rewrite Theorem 5.1 with explicit assumptions.
- [x] State sparse recurrence before full recurrence or move sparse recurrence to an appendix.
- [x] State full-window recurrence.
- [x] Specialize to depth one.
- [x] Specialize to depth two.
- [x] Check indexing carefully.
- [x] Add a bootstrap table.
- [x] Add concrete counts for the running example.
- [x] State the payload-aware affine recurrence.
- [x] State the shifted Fibonacci consequence only under constant payload.

## Section 6: Mechanization

- [x] Include theorem-facing docs in the artifact.
- [x] Include a theorem index in `docs/theorem_index.md`.
- [x] Include trust-boundary notes in `docs/coherence_depth_trust_boundary.md`.
- [x] Include an artifact README.
- [x] Include a no-postulate scan result for copied Agda files.
- [x] Include a successful top-level Agda check result from this machine.
- [x] Add a shorter theorem-map table to the paper.
- [x] Add a machine-readable theorem map.
- [x] Add a trusted-boundary box to the paper.
- [x] Add true transitive import-closure postulate audit.
- [x] Report uses of Agda primitives and trusted Cubical primitives.
- [x] Add CI badge or build log.
- [ ] Add exact commit hash.
- [x] Add exact dependency pins.
- [x] Add one-command build evidence.

## Proof Patch Checklist

- [x] Replace overloaded obligation notation everywhere.
- [x] Audit every theorem statement for the level it concerns: syntax, index set, realized type, or cardinality.
- [x] Prove or weaken horn contractibility.
- [x] Repair basis uniqueness.
- [x] Fix full-coupling and density assumptions.
- [x] Repair lower-bound example.
- [x] Recheck recurrence indexing and payload accounting.
- [x] Align mechanization claims with actual artifact output.

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

- [x] Normalized public signature.
- [x] Primitive schema.
- [x] Support and arity.
- [x] Exact obligation object.
- [x] Minimal-signature depth.
- [x] Chronological window.
- [x] Full coupling footprint.

## New Lemmas To Add Or Strengthen

- [x] Normalization lemmas.
- [x] Basis lemmas.
- [x] Trace/cost lemmas.
- [x] Horn lemmas.
- [x] Chronology lemmas.
- [x] Lower-bound lemmas.
- [x] Recurrence lemmas.

## Mechanization Upgrade Plan

- [x] Create a minimum local artifact skeleton.
- [x] Include paper source.
- [x] Include checked Agda top-level `PEN.agda`.
- [x] Include theorem-facing modules.
- [x] Include audit fixtures and script.
- [x] Include README with build/check commands.
- [x] Add `Everything.agda`.
- [x] Add `paper-map.yaml`.
- [x] Add theorem-map checker.
- [x] Add import-closure postulate checker.
- [x] Add Makefile.
- [x] Add CI.
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
- [x] Explicitly state what theorem is formalized.
- [x] Explicitly state what theorem is not formalized.
- [x] Pin exact Cubical library version or commit.
- [x] State expected build time.
- [x] Explain how to locate theorem numbers such as Theorem 4.13, 4.17, and 5.1 without relying only on prose docs.

## Postulate Audit Checklist

- [x] Check copied `.agda` files for `postulate` tokens.
- [x] Check transitive import closure of theorem-facing modules.
- [x] Report module name.
- [x] Report whether each module uses `postulate`.
- [x] Report whether each module uses `primitive`.
- [x] Report whether each module compiles with `--safe`.
- [x] Report whether each module imports outside the trusted root.
- [x] List trusted Agda and Cubical primitives explicitly.

## Paper-To-Agda Theorem Map

- [x] Include prose theorem index in `docs/theorem_index.md`.
- [x] Include trust-boundary table in `docs/coherence_depth_trust_boundary.md`.
- [x] Convert theorem map to machine-readable `paper-map.yaml`.
- [x] Include columns: paper claim, Agda module, Agda theorem names, status, uses bridge, trusted inputs.
- [x] Keep a shorter table in the main paper.
- [x] Put the complete map in an appendix or artifact file.

## Rhetorical And Exposition Improvements

- [x] Reduce repeated theorem-stack summaries.
- [x] Replace repetition with one dependency diagram and one theorem map.
- [x] Add a running example with concrete counts.
- [x] Add a sealed-layer export diagram.
- [x] Add a depth-three horn diagram.
- [x] Add a dependency graph from exact obligations to minimal signatures to recurrence.
- [x] Add a sparse versus fully coupled footprint diagram.
- [x] Add a frequently confused distinctions box.

## Literature And Positioning

- [x] Position the contribution as a normalized cost invariant, not a replacement for standard coherence theory.
- [x] Discuss cubical type theory and CCHM-style composition as operational substrate.
- [x] Discuss Cubical Agda as proof assistant environment, not theorem target.
- [x] Discuss univalence as source of binary lower-bound examples.
- [x] Discuss Mac Lane/Stasheff/coherence as qualitative background.
- [x] Discuss algebraic signatures, module systems, and normalization analogues.
- [x] Explain why the result is not about arbitrary HoTT or arbitrary cubical calculi.

## Decision Tree If The Hard Theorem Fails

- [ ] If contractibility is fully provable, keep the exact obligation-depth theorem.
- [ ] If only canonical derived witnesses are provable, revise the main result to the minimal public-signature cost theorem.
- [ ] If only grammar-specific factorization is formalized, state the grammar-specific theorem.
- [ ] If the raw bridge is partial, restrict theorem statements and examples to covered constructors.

## Pre-Submission Checklist: Theorem Clarity

- [x] The main theorem is stated in the introduction with all hypotheses visible.
- [x] The theorem target is a fixed extension calculus, not cubical type theory in general.
- [x] `ObSig`, `Real`, `Prim`, and `mu` are distinct objects.
- [x] The recurrence theorem depends on a chronological-window theorem.
- [x] Sparse extensions are explicitly outside the full-coupling recurrence or covered by a sparse recurrence.

## Pre-Submission Checklist: Definitions

- [x] Raw syntax is specified.
- [x] Admissibility is specified.
- [x] Full coupling is specified by a footprint judgment.
- [x] Presentation equivalence is generated by explicit constructors.
- [x] Counting normalization has uniqueness or invariance lemmas.
- [x] Primitive/derived tags are formal.
- [x] Support and arity are invariant under normalization.

## Pre-Submission Checklist: Proofs

- [x] Basis uniqueness no longer relies on arbitrary finite minimal generating families.
- [x] Density theorem resolves the per-site/per-payload ambiguity.
- [x] Horn-extension theorem includes explicit boundary/filler definitions.
- [x] Contractibility is proved with center and contraction, or the exact theorem is weakened.
- [x] Recent-history factorization specifies the equality notion used.
- [x] Swap lower bound is formulated as a promoted-interface unary/binary separation.
- [x] Clutching family is either formal and precise or moved to examples.

## Pre-Submission Checklist: Mechanization

- [x] Local artifact folder exists.
- [ ] Public repository or artifact archive exists.
- [ ] Commit hash is cited.
- [x] Agda version is identified locally.
- [x] Agda version and Cubical library version are both pinned in the artifact.
- [x] One-command build works from a Makefile or equivalent artifact command.
- [x] Copied theorem-facing Agda files are postulate-scanned.
- [x] The theorem-facing import closure is postulate-audited.
- [x] The theorem map is machine-readable.
- [x] Paper-level explanatory claims are separated from formalized claims.

## Pre-Submission Checklist: Exposition

- [x] Abstract is narrower and less overstuffed.
- [x] Introduction has a not-claimed paragraph.
- [x] The paper has one running example with concrete counts.
- [x] The paper has diagrams for the trace principle and horn step.
- [x] Repeated theorem-stack summaries are consolidated.
- [x] Related work frames the result as a normalized cost model for sealed extensions.

## Recommended Order Of Work

### Phase 1: Lock The Theorem Target

- [x] Define the raw calculus.
- [x] Split `O^(k)` into `ObSig`, `Ix`, `Real`, and `Prim`.
- [x] Fix basis uniqueness.
- [x] Define full-coupling footprints.
- [x] Settle the per-site/per-payload convention.

### Phase 2: Resolve The Horn Theorem

- [x] Write the exact horn-extension object.
- [x] Try to prove center and contraction in Agda.
- [ ] If contraction fails, downgrade exact stabilization and preserve the `mu`-elimination theorem.
- [x] Update all downstream theorems accordingly.

### Phase 3: Repair The Lower Bound

- [x] Replace the global endomap example with an objectwise promoted-interface candidate.
- [x] Prove transport-by-conjugation along `ua(swap)`.
- [x] Add the positive control using identity.
- [x] State the lower bound as a depth-one insufficiency theorem.

### Phase 4: Rebuild Recurrence Section

- [x] State sparse recurrence.
- [x] State full-window recurrence.
- [x] Specialize to depth one and depth two.
- [x] Add bootstrap table and concrete counts.

### Phase 5: Publish The Artifact

- [x] Build/check `PEN.agda` as the current top-level artifact module.
- [x] Build `Everything.agda` if that becomes the artifact top-level.
- [x] Run theorem-map checker.
- [x] Run available postulate scan over copied `.agda` files.
- [x] Run transitive import-closure postulate audit.
- [x] Add CI.
- [x] Update Section 6 from artifact output.

### Phase 6: Final Exposition Pass

- [x] Narrow abstract.
- [x] Add diagrams.
- [x] Remove duplicate summaries.
- [x] Add limitations.
- [x] Update related work.
- [x] Ensure every claim in the introduction is proved later or clearly labeled as motivation.

## Final Publication Standard

- [x] Make explicit what calculus is being studied.
- [x] Make explicit which declarations are admissible.
- [x] Make explicit what full coupling means.
- [x] Make explicit what exactly is counted.
- [x] Make explicit what is a signature-level statement versus a type-level statement.
- [x] Make explicit how cubical horn computation enters.
- [x] Make explicit whether horn extension spaces are contractible or merely canonically represented.
- [x] Make explicit why binary obligations are necessary.
- [x] Make explicit why remote history does not add primitive trace fields.
- [x] Make explicit why the recurrence follows.
- [x] Make explicit what has been machine-checked.
