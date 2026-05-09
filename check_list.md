# Paper Improvement Checklist

Source: `paper_improvement_plan.md`

Use this as an implementation checklist for revising the paper. Items are grouped by theme and paper section; some high-priority items intentionally reappear in section-specific form so they can be tracked where the edit actually happens.

## Highest-Priority Pass

- [x] Reframe the paper as a model theorem plus evidence for a broader conjecture.
- [x] Demote broad claims about cubical foundations in general to conjectures unless explicitly scoped to the fixed raw calculus and adequacy package.
- [x] State as proved only the fixed sealed-extension calculus results: horn-computational replacement of higher structural obligations, depth-two primitive public trace in minimal opaque signatures, the univalent swap obstruction, and the full-coupling affine recurrence.
- [x] Move one concrete worked example to the front of the paper.
- [x] In the running example, explicitly label the payload, unary trace, binary trace, apparent ternary horn obligation, and primitive public signature count.
- [x] Add a "Guiding conjectures and what is proved here" subsection near the end of the introduction.
- [x] Rewrite the abstract using the conjecture/model-theorem distinction.
- [x] Rename the main theorem to include "fixed sealed-extension calculus."
- [x] Make full coupling a named hypothesis, not an implied consequence of canonicity.
- [x] Add one paragraph explaining the adequacy boundary.
- [x] Add a one-page informal proof sketch before the formal development.
- [x] Add an adequacy-boundary table in the mechanization section.
- [x] Use "Fibonacci full-coupling envelope" instead of unqualified Fibonacci scaling.

## Claim Hierarchy

- [x] Use a three-level claim hierarchy throughout the paper.
- [x] Mark broad claims about real cubical foundations as Level 1 conjectural program claims.
- [x] Mark fixed-calculus results as Level 2 theorem-package claims.
- [x] Mark Fibonacci scaling as a Level 3 arithmetic consequence under fixed extra assumptions.
- [x] State the broad depth-two idea boldly, but as a conjecture or programmatic thesis.
- [x] Present the fixed calculus as the actual formal theorem object.
- [x] State that the Fibonacci law is a full-coupling envelope, not a claim about ordinary library growth.
- [x] Ensure the recurrence theorem explicitly depends on primitive trace depth two, a two-layer chronological window, full coupling, and constant payload for the Fibonacci specialization.

## Conjectures To Add Or Reframe

- [x] Add Conjecture 1: Cubical sealed-extension depth two.
- [x] Make Conjecture 1 explicitly depend on sealing discipline, structural integration obligations, adequate horn computation, univalence for the lower bound, and primitive/derived normalization.
- [x] State that the paper proves Conjecture 1 only for the fixed sealed-extension calculus in Sections 2-5.
- [x] State that full Conjecture 1 requires a future adequacy/transfer theorem.
- [x] Place Conjecture 1 in the new introduction subsection on guiding conjectures and what is proved here.
- [x] Immediately follow Conjecture 1 with the fixed-calculus theorem.
- [x] Add Conjecture 2: Adequacy transfer for cubical sealed extensions.
- [x] Frame Conjecture 2 as the missing bridge from the formal model to broad cubical foundations.
- [x] Present the adequacy-transfer problem as a positive research program, not as a buried limitation.
- [x] Add or reframe Conjecture 3: Global action forces active-basis coverage.
- [x] Treat basis-density as conjectural or conditional unless the proof justifies the stronger semantic claim.
- [x] Prefer a "Full-coupling coverage hypothesis" if density is an assumption.
- [ ] Alternatively, present basis-density as a fixed-calculus theorem about the native-totality record.
- [x] Treat the current record-level density theorem as evidence for Conjecture 3, not as a general theorem about arbitrary operational semantics.
- [x] Add Conjecture 4: Full-coupling Fibonacci envelope.
- [x] Present the Fibonacci result as an envelope theorem rather than a universal law of software-library growth.
- [x] State that the exact arithmetic recurrence is proved only in the fixed calculus once full coupling and constant payload are assumed.
- [x] Add Conjecture 5 only if the paper wants to emphasize chronological dependency depth separately from arity depth.
- [x] If added, state Conjecture 5 as a two-layer chronological Markov blanket.
- [ ] Otherwise fold the chronological-window claim into Conjecture 1.
- [x] Add Conjecture 6: Horn-computational universality across suitable foundations.
- [x] Use Conjecture 6 to discuss 2D foundations, CCHM-style cubical type theory, and related systems without claiming the current formalization covers all of them.

## Theorem Claims To State Safely

- [x] State Theorem P1: Depth-two public trace in the fixed sealed-extension calculus.
- [x] Qualify P1 as a theorem about the fixed calculus and adequacy package, not arbitrary Cubical Agda programs or arbitrary cubical type theories.
- [x] State that P1 is the main model theorem supporting Conjecture 1.
- [x] State Theorem P2: Exact stabilization of realized structural obligations.
- [x] For P2, specify `Real_k(X) ~= Real_2(X)` for every admissible candidate `X` and every `k >= 2`.
- [x] Explain that P2 decomposes the marginal depth-`k` contribution as a contractible structural horn-extension factor.
- [x] Avoid saying that all higher cubical fillers are contractible.
- [x] Say instead that only structural horn-extension packages generated by the sealing calculus are contractible/derived.
- [x] State Theorem P3: Minimal-signature elimination.
- [x] For P3, distinguish exact obligation objects from public trace cost.
- [x] Make clear that higher presented trace fields may occur in nonminimal presentations but are derived from lower trace and not counted by `mu`.
- [x] State Theorem P4: Binary lower bound from univalence.
- [x] Use the two-point swap obstruction to show unary trace is insufficient to decide sealing.
- [ ] If available, add a stronger lower-bound witness with two admissible extensions having identical unary public behavior but distinct binary public trace.
- [x] If the stronger witness is unavailable, state only the admissibility-decision lower bound.
- [x] Do not claim every admissible extension must expose an independent binary public field unless the stronger witness is supplied.
- [x] State Theorem P5: Two-layer chronological window under factorization-complete export.
- [x] Make P5 a separate milestone in the introduction and theorem map.
- [x] Explain why the recurrence theorem needs a chronological window, not merely an arity bound.
- [x] State Theorem P6: Trace recurrence under a two-layer window.
- [x] Present the recurrence first in sparse-footprint form.
- [x] Then state the fully coupled endpoint `mu_{n+1} = mu_n + mu_{n-1} + kappa_n + kappa_{n-1}`.
- [x] Add Corollary P6a: shifted Fibonacci specialization under constant payload.
- [x] Avoid saying cubical foundations scale by Fibonacci recurrence.
- [x] Say instead that the fixed-calculus depth-two theorem yields a Fibonacci envelope for fully coupled constant-payload sequences.
- [x] State Theorem P7: Refactoring invariance of `mu`.
- [x] Include rebundling, currying/uncurrying, transparent aliases, shell splitting, and computational replacement of derived trace as presentation-equivalence generators.
- [x] State Theorem P8: Mechanized theorem-facing model.
- [x] Present the Agda artifact as an audit of the formal model, not as proof of the entire conjectural program.
- [x] Explicitly say the Agda development does not formalize parser or elaborator adequacy for arbitrary Cubical Agda programs.

## Wording Replacements

- [x] Replace "Cubical foundations have coherence depth two" with a scoped conjecture plus fixed-calculus theorem statement.
- [x] Replace "Cubical horn computation derives all higher coherence" with a claim about structural integration obligations generated by the sealing calculus.
- [x] Replace "Higher obligations disappear" with the exact/public-count distinction: higher horn factors remain in `Real_k` but contribute no primitive field to `mu`-minimal signatures.
- [x] Replace "Canonicity forces full basis coverage" with a statement about the full-coupling/native-totality record.
- [x] Replace "Fibonacci scaling follows from cubicality" with a statement about depth two plus a two-layer window under full coupling, with constant payload shifting to Fibonacci.
- [x] Replace "Mechanized theorem shows the paper's main claim" with a statement that the mechanization checks the fixed-calculus theorem package and identifies the trusted adequacy boundary.
- [x] State ordinary-library-growth limitations once in a scope box, then use "full-coupling envelope" consistently.
- [x] Split any single "Main theorem" paragraph into Model Theorem, Lower Bound, Window Theorem, and Counting Corollary.

## Title And Abstract

- [x] Consider retitling the paper to "Toward Coherence Depth Two for Cubical Sealed Extensions."
- [x] Rewrite the abstract to introduce public integration trace for sealed globally acting structural layers.
- [x] In the abstract, state the guiding conjecture before the fixed-calculus theorem.
- [x] In the abstract, separate payload from public trace.
- [x] In the abstract, separate exact realized obligations `Real_k(X)` from minimal public signatures counted by `mu`.
- [x] In the abstract, separate primitive trace fields from derived horn-computational fields.
- [x] In the abstract, mention the swap obstruction for the depth-one lower bound.
- [x] In the abstract, mention the recent-history theorem that turns arity depth into a two-layer chronological window.
- [x] In the abstract, state the full-coupling recurrence and constant-payload Fibonacci specialization.
- [x] In the abstract, describe the Agda development as checking the fixed model theorem, recurrence arithmetic, lower-bound witnesses, and trace-accounting discipline.
- [x] In the abstract, leave broad adequacy transfer to arbitrary cubical surface calculi as future/conjectural work.

## Introduction

- [x] Open with a concrete scenario rather than definitions.
- [x] Explain that sealed foundational extensions create public trace debt.
- [x] Distinguish ordinary library growth, foundational-core extension, and public trace.
- [x] Add a toy example before formal definitions.
- [x] Include a diagram showing a new layer with unary actions into old generators and a binary comparison along an old path/equivalence.
- [x] Use the toy example to introduce payload, unary trace, binary trace, higher horn package, and `mu`.
- [x] State Conjectures 1-4 in the introduction in short form.
- [x] Avoid packing all technical assumptions into the first conjecture pass.
- [x] Add a "What is proved in this paper" subsection.
- [x] In that subsection, list the fixed-calculus theorem package: `Real_k(X) ~= Real_2(X)`, no primitive arity `> 2` trace in `mu`-minimal signatures, swap obstruction, two-layer chronological window, and affine recurrence under full coupling.
- [x] Add one early scope box.
- [x] In the scope box, state that the paper proves a theorem for a fixed sealed-extension calculus, not a transfer theorem for every cubical foundation.
- [x] In the scope box, state that the paper is about public trace depth, not internal homotopy truncation.
- [x] In the scope box, state that the recurrence is a full-coupling envelope, not Fibonacci growth for ordinary libraries.
- [x] In the scope box, state that the mechanization is a model/audit, not parser/elaborator adequacy for arbitrary Cubical Agda programs.
- [x] End the introduction with a proof dependency diagram or compact roadmap.

## Agda Formalization And Artifact Framing

- [x] Reframe the mechanization as a check of the fixed theorem object.
- [x] Divide artifact status into checked internal theorems, checked record-level consequences, and paper-level interpretations.
- [x] Add a trusted-boundary paragraph near the beginning of the mechanization section.
- [x] Explain that the mechanization formalizes higher structural obligations as horn-extension packages inside the chosen representation.
- [x] State that the trusted boundary is the adequacy claim connecting intended semantic sealed extensions to the raw calculus.
- [x] Add or revise an artifact table with columns for paper claim, formal status, Agda module, adequacy dependence, and broad-conjecture role.
- [x] Include exact stabilization in the fixed calculus in the artifact table.
- [x] Include minimal public trace elimination in the artifact table.
- [x] Include full-coupling recurrence in the artifact table.
- [x] Include arbitrary Cubical Agda adequacy as not checked/open in the artifact table.

## Theorem Naming

- [x] Rename "Global admissibility forces basis coverage" to "Full-coupling coverage in the fixed native-totality record."
- [x] Rename "Basis-cardinality density law" to "Active-basis cardinality under full-coupling coverage."
- [x] Rename "Integration Trace Principle" to "Full-coupling trace decomposition principle."
- [x] Rename "Exact primitive public structural trace depth two" to "Fixed-calculus exact public trace depth two."
- [x] Rename "Cubical instantiation of the horn-computational interface" to "Fixed CCHM-style instantiation of the horn-computational interface."
- [x] Rename "Depth-two law for 2D foundations" to "Depth-two law for the specified 2D toy discipline."
- [x] Ensure theorem names carry the right quantifiers.

## Lower-Bound Presentation

- [x] Move the binary lower bound earlier.
- [x] Explain the lower bound more slowly.
- [x] Present Version 1: unary trace is insufficient to decide admissibility of a sealed extension.
- [x] Use the swap obstruction as the proof of Version 1.
- [ ] Present Version 2 only if available: admissible sealed extensions with identical unary trace but distinct binary public trace.
- [x] Make the boolean swap example the first real mathematical example.
- [x] Include the old interface with `2 : Type` and `pswap : 2 = 2`.
- [x] Include the constant-left candidate unary action.
- [x] Show that binary sealing asks transport along `pswap` to preserve the candidate.
- [x] Explain that transport along `pswap` conjugates by swap, so constant-left becomes constant-right.
- [x] Add the positive control where `F2 = id` and the binary check succeeds.
- [x] Emphasize that unary data alone cannot tell whether the candidate is sealable.

## `Real_k`, `Prim_k`, `Der_k`, And `mu`

- [x] Add an early boxed glossary for `Real_k(X)`, `Prim_k(X)`, `Der_k(X)`, and `mu`.
- [x] Add a status ladder: absent from `Real_k`, present but contractible, present and derived from lower trace, present as primitive public trace.
- [x] Explain that the upper-bound theorem does not say higher obligations are absent.
- [x] Explain that higher obligations become contractible/derived horn factors.
- [x] Explain that `mu` ignores higher obligations only after canonical replacement.
- [x] Use the phrase "present in the exact object, absent from the primitive public count" consistently.

## Story And Pedagogy

- [x] Reorder the exposition into the linear story: sealing creates public trace debt; unary trace is not enough; binary trace handles naturality/comparison data; higher structural obligations are horn packages; cubical filling computes them; public trace stabilizes at depth two in the fixed calculus; full coupling over the last two layers gives the recurrence.
- [x] Build every section around that story.
- [x] Introduce a running example before definitions.
- [x] Include Example 1: old path, new action, to show unary vs binary trace.
- [x] Include Example 2: boolean swap lower bound, with a diagram and one computation.
- [x] Include Example 3: old universe plus new modality.
- [x] In Example 3, label payload as `Flat` and `eta`.
- [x] In Example 3, label unary trace as `FlatU` and `flat-El`.
- [x] In Example 3, label binary trace as preservation of `Arr` and decoding comparisons.
- [x] In Example 3, label apparent depth-three trace as compatibility among routes through `El`, `Flat`, and `Arr`.
- [x] In Example 3, explain that cubical filling computes the apparent depth-three compatibility.
- [x] Include Example 4: recurrence table.
- [x] In Example 4, show stage, payload `kappa_n`, trace `mu_n`, and total public increment.
- [x] In Example 4, note that exact seeds depend on the bootstrapping convention but the shifted recurrence is Fibonacci.

## Diagrams

- [ ] Add Diagram 1: payload vs trace at a sealed boundary.
- [ ] Use Diagram 1 to explain opacity and why `mu` is not line count.
- [ ] Add Diagram 2: unary, binary, and ternary obligations.
- [ ] Use Diagram 2 to make arity-to-dimension concrete.
- [ ] Add Diagram 3: exact vs public count.
- [ ] Use Diagram 3 to show `Real_3(X) = Real_2(X) x ContractibleHorn_3` and primitive public signatures retaining only arity `<= 2`.
- [ ] Add Diagram 4: arity bound vs chronological window.
- [ ] Use Diagram 4 to explain why arity `<= 2` does not automatically imply recent history.
- [ ] Add Diagram 5: sparse vs full coupling.
- [ ] Use Diagram 5 to make recurrence assumptions visible.

## Claim Boxes

- [ ] Add a "What this result says" box at the start of every major theorem section.
- [ ] Add a "What it does not say" line in each claim box.
- [ ] Add a "Where the assumption enters" line in each claim box.
- [ ] For horn reduction, explicitly state that higher structural integration obligations in the fixed calculus are represented as horn-extension packages and become derived public trace.
- [ ] For horn reduction, explicitly state that arbitrary higher homotopy types or filler spaces in cubical type theory are not claimed to be contractible.
- [ ] For horn reduction, identify the structural-integration grammar as the place where the horn-package assumption enters.

## Terminology

- [ ] Introduce early only the terms: sealed extension, payload, public trace, primitive vs derived, `Real_k(X)`, `mu`, and full coupling.
- [ ] Delay primitive basis transversals.
- [ ] Delay canonical telescope isomorphisms.
- [ ] Delay support cardinality classes.
- [ ] Delay promoted interface package.
- [ ] Delay factorization-complete trace export.
- [ ] Delay raw adequacy package.
- [ ] Delay CCHM-style core instantiation details.
- [ ] Do not introduce a term until the reader has seen the example it classifies.

## Dependency Tables

- [x] Add a short dependency table near the introduction.
- [x] Include raw sealed-extension calculus as the step that defines payload and trace.
- [x] Include horn representation as the step that describes higher structural obligations.
- [x] Include horn computation as the step that makes depth `> 2` derived/contractible.
- [x] Include swap obstruction as the step showing depth `1` is insufficient.
- [x] Include recent-history factorization as the step turning arity depth into a two-layer time window.
- [x] Include the counting theorem as the step giving sparse/full recurrence.
- [ ] Add a detailed formal dependency table before the formal proof, in Section 7, or in an appendix.
- [ ] Link paper theorem numbers to Agda modules in the detailed table.

## Adequacy Boundary

- [x] Consolidate repeated "not claimed" statements under a positive heading: "The adequacy boundary."
- [x] State that the theorem is intentionally split into an internal theorem and an external adequacy problem.
- [x] State that the paper solves the internal theorem for a fixed calculus.
- [x] State that the paper records the adequacy interface needed for transfer to broader cubical systems.
- [ ] Prefer the phrase "adequacy boundary" over repeated defensive disclaimers.

## Opening Pages

- [x] Answer why readers should expect depth two before formal definitions.
- [x] Explain that univalent paths/equivalences force binary naturality checks.
- [x] Answer why readers should not expect primitive depth three or higher.
- [x] Explain that sealing-generated higher structural obligations are open-box extension problems computed from boundary data.
- [x] Answer why Fibonacci appears.
- [x] Explain that a depth-two chronological window plus full coupling to the previous two primitive public bases gives a two-step affine recurrence.

## Section 1: Introduction

- [x] State the motivating problem in ordinary language.
- [x] Give one small example.
- [x] State conjectures and exact theorem package separately.
- [x] Include scope and roadmap.
- [x] Move detailed "what is not claimed" material into a compact scope box.
- [ ] Move the `OldU`/`Flat` example or a simplified version into the introduction.
- [x] Add the conjectures.
- [x] Replace the broad "core thesis" with a two-part conjectural thesis plus fixed-calculus theorem.

## Section 2: Fixed Sealed-Extension Calculus

- [x] Rename the section to "The fixed sealed-extension calculus" or "A formal calculus of sealed public trace."
- [x] Define the model clearly as a model.
- [x] Avoid implying that the grammar is forced by all cubical foundations.
- [x] Add a paragraph stating that the definitions are part of the theorem object and are not claimed to be the unique possible formalization of cubical sealed extension.
- [x] Present full coupling as a hypothesis/record unless the proof justifies a stronger semantic claim.
- [x] Put primitive basis definitions after a simple example.

## Section 3: Adequacy And Normalized Public Signatures

- [x] Rename the section to "The adequacy boundary and normalized public signatures."
- [x] Make the bridge explicit.
- [x] Show exactly which claims depend on the bridge.
- [ ] Start with a diagram from semantic sealed extension through adequacy package to raw declarations, normalized public signature, and `mu` count.
- [x] Split theorem labels into internal normalization results, conditional adequacy results, and presentation-invariance results.

## Section 4: Normal Forms For Structural Trace

- [x] Teach the counting discipline.
- [x] Convince readers that `mu` is invariant and meaningful.
- [x] Add examples of `mu`-preserving transformations.
- [x] Include currying/uncurrying as `mu`-preserving.
- [x] Include record rebundling as `mu`-preserving.
- [x] Include transparent alias expansion as `mu`-preserving.
- [x] Include derived horn filler elimination as `mu`-preserving.
- [x] Add one example of a transformation that changes `mu` by adding a genuinely new primitive trace field.

## Section 5: Depth Theorem

- [x] Separate exact obligations, minimal public trace, chronology, and lower bound.
- [x] Restructure Section 5 into four subsections.
- [x] Add subsection 5.1: Exact obligations vs public trace, introducing `Real_k`, `Prim_k`, `Der_k`, and `mu`.
- [x] Add subsection 5.2: Upper bound, showing horn computation derives higher structural trace and proving `Real_k ~= Real_2` plus `d_mu <= 2`.
- [x] Add subsection 5.3: Chronology, explaining why depth two becomes a two-layer window and proving recent-history factorization.
- [x] Add subsection 5.4: Lower bound, showing univalence forces binary checks with the swap obstruction and optional clutching example.
- [x] Consider moving the swap example before the technical upper bound as motivation, then proving it formally later.

## Section 6: Complexity Scaling Theorem

- [x] Make clear that the recurrence is conditional arithmetic.
- [x] Emphasize sparse footprints before full coupling.
- [x] Begin with the most general sparse formula.
- [x] Then specialize to full coupling.
- [x] Then specialize to constant payload.
- [x] Add a small numeric table.
- [ ] Consider adding a plot or diagram.
- [x] Use "Fibonacci envelope" consistently.

## Section 7: Mechanization

- [x] Make the formal status audit precise.
- [x] Avoid overclaiming broad semantic adequacy.
- [x] Use the three statuses: checked internal, checked record-level, and paper-level interpretation.
- [x] Add a trusted-boundary paragraph near the beginning, not only at the end.
- [x] For each theorem, specify whether the proof is internal to the raw calculus or depends on the adequacy bridge.

## Section 8: Scope And Limitations

- [x] Avoid repeating disclaimers already stated.
- [x] Turn limitations into future work.
- [x] Organize the section around adequacy transfer being conjectural.
- [x] State that full coupling is an envelope, not ordinary library growth.
- [x] State that `mu` is not source code size.
- [x] State that higher homotopy is not truncated.
- [x] State that case-study elaboration remains future work if not fully mechanized.

## Section 9: Conclusion

- [x] Restate the contribution crisply.
- [x] End with the conjectural program.
- [x] State that the fixed formal calculus has exact public trace depth two.
- [x] State that sparse footprints give sparse recurrences and the fully coupled constant-payload envelope is Fibonacci.
- [x] State that the broader claim about cubical foundations in general should be treated as a conjectural program.
- [x] State that future work is to prove transfer theorems from richer cubical surface calculi and concrete foundational extension mechanisms into the sealed-extension model.

## Main Theorem Paragraph

- [x] Replace the current main theorem paragraph if it mixes semantic, syntactic, chronological, and arithmetic claims.
- [x] Use a three-part structure: Guiding conjecture, Theorem proved here, Counting corollary.
- [x] In the guiding conjecture, say adequate cubical sealed-extension systems have primitive public structural trace depth two.
- [x] In the theorem proved here, scope the result to the fixed sealed-extension calculus.
- [x] In the theorem proved here, include `Real_k(X) ~= Real_2(X)` for `k >= 2`.
- [x] In the theorem proved here, include that `mu`-minimal public signatures have no primitive trace field above arity two.
- [x] In the theorem proved here, include that the swap obstruction shows arity one is insufficient.
- [x] In the counting corollary, require full coupling and recent-history factorization.
- [x] In the counting corollary, state the affine recurrence and constant-payload Fibonacci shift.

## One-Page Informal Proof

- [x] Add the proof sketch after the theorem statement.
- [x] Explain the upper bound as a horn-filling argument.
- [x] Explain that once unary action and binary comparison are present, an apparent depth-three obligation is an open box.
- [x] Explain that cubical composition and filling compute the marginal higher package from boundary data.
- [x] Explain that the higher package remains present in the exact obligation object but is derived in the public signature.
- [x] Explain the lower bound as a univalence argument.
- [x] Use swap of the two-point type as the accessible example.
- [x] Explain the recurrence as arithmetic over the primitive public bases of the previous two interfaces.

## Notation Discipline

- [x] Add a notation table near the start of Section 2 or as front matter.
- [x] Include `X` as candidate sealed extension.
- [x] Include `L_n` as sealed layer at stage `n`.
- [x] Include `kappa_n` as payload size of layer `n`.
- [x] Include `mu_n` as primitive public trace size of layer `n`.
- [x] Include `Real_k(X)` as realized obligation object after depth `k` history.
- [x] Include `Prim_k(X)` as primitive part of the normalized obligation signature.
- [x] Include `Der_k(X)` as derived part of the normalized obligation signature.
- [x] Include `d_obl` as exact obligation stabilization depth.
- [x] Include `d_mu` as minimal public-signature depth.
- [x] Include `Foot_n` as active footprint touched by the new layer.
- [x] Use "obligation depth" only for `Real_k` stabilization.
- [x] Use "minimal-signature depth" only for primitive fields in normalized public signatures.
- [x] Use "chronological window" only for recent-layer support.
- [x] Use "Fibonacci envelope" only after full coupling and constant payload.

## Glossary

- [x] Add a compact glossary.
- [x] Define sealed extension.
- [x] Define payload.
- [x] Define trace.
- [x] Define primitive trace.
- [x] Define derived trace.
- [x] Define full coupling.
- [x] Define sparse footprint.
- [x] Define adequacy boundary.

## Examples And Their Jobs

- [x] Tie every example explicitly to a theorem or concept.
- [x] Use Boolean swap for the depth-one lower bound in the introduction and Section 5.
- [x] Use old universe plus modality for payload/trace separation and horn-derived depth-three data.
- [x] Use clutching family only as optional topological intuition for binary data, not as a load-bearing proof.
- [x] Use sparse vs full matrix for recurrence assumptions in Section 6.
- [x] Use refactoring examples for `mu` invariance in Section 4.
- [x] End each example with a sentence of the form "This is the phenomenon formalized by Theorem X."

## Sparse-Vs-Full Example

- [x] Add a small sparse-vs-full example to prevent misreading the Fibonacci result.
- [ ] Use an active interface with primitive sites such as `A, B, C, D, E`.
- [ ] Show a sparse extension touching only selected sites such as `A` and `C`.
- [x] Explain that sparse trace cost is proportional to selected sites, not the full interface.
- [x] Show a full-coupling extension advertised as a global modality or universe-level operation.
- [x] Explain that full coupling must act on every active primitive basis site.
- [x] State that the Fibonacci recurrence is the full-coupling endpoint of the sparse footprint theorem.

## Writing Style

- [ ] Split dense theorem prose into layered paragraphs with explicit headings.
- [ ] Avoid mixing semantic assumptions, syntactic normalization, mechanization status, recurrence consequences, and scope limitations in a single paragraph.
- [ ] Introduce "primitive public structural trace" once, then use "public trace" when unambiguous.
- [ ] Replace repeated "admissible sealed structural extensions" with "sealed extensions" after the formal definition.
- [x] Define `C_ext` for the fixed sealed-extension calculus.
- [x] Use `C_ext` to shorten theorem statements.
- [ ] Replace repeated disclaimers with the term "full-coupling envelope."
- [ ] Later refer back with "As above, this is an envelope theorem."

## Adequacy Discussion

- [x] Add a subsection titled "What an adequacy theorem would have to prove."
- [x] List preservation of semantic admissibility.
- [x] List preservation of primitive vs derived status.
- [x] List preservation of historical support.
- [x] List preservation of public cardinality `mu`.
- [x] List adequacy of horn-extension representation for structural integration obligations.
- [x] List correspondence between opacity/sealing and the intended semantic boundary.
- [x] List correspondence between full-coupling coverage and advertised global action.
- [x] State that the internal theorem is conditional on exactly these properties.
- [x] State that the conjecture is falsifiable: a counterexample must violate the adequacy interface or exhibit a structural obligation not representable as a derived horn-extension package.

## Reviewer-Facing FAQ

- [x] Add a short FAQ near the end or in an appendix.
- [x] Add "Does the theorem say higher paths vanish?" and answer no.
- [x] Add "Does the theorem say Cubical Agda libraries grow by Fibonacci recurrence?" and answer no.
- [x] Add "Is `mu` a line count?" and answer no.
- [x] Add "Does `hcomp` make every higher coherence contractible?" and answer no.
- [x] Add "Is the Agda artifact a proof for arbitrary surface programs?" and answer no.
- [x] Keep the FAQ brief and reviewer-facing.

## Reviewer Objections And Planned Responses

- [x] For the objection that the upper bound is built into the definition of obligations, acknowledge the model-theorem status and reframe the calculus as a precise auditable theorem object.
- [x] Add near the start of Section 2 that the calculus is the formal theorem object, not the unique possible syntax of cubical extension.
- [x] For the objection that canonicity alone does not force full coverage, make full coupling explicit and conditional.
- [x] Rename the relevant theorem and define full coupling before proving the recurrence.
- [x] For the objection that the Fibonacci recurrence is trivial arithmetic once assumptions are made, agree and emphasize that the nontrivial contribution is the depth/window theorem.
- [x] Add in Section 6 that the recurrence theorem is intentionally arithmetic and exposes the scaling consequence of the depth-two public-trace theorem under full coupling.
- [x] For the objection that the swap example only gives an inadmissible candidate, state precisely that it proves unary data do not decide admissibility.
- [ ] Add a stronger admissible-pair witness if available.
- [x] For the objection that the Agda formalization proves only a tailored representation, agree and present that as the model theorem.
- [x] Make transfer a conjecture.

## Revision Phases

- [x] Phase 1: Add guiding conjectures.
- [x] Phase 1: Rewrite abstract.
- [x] Phase 1: Rename overbroad theorem titles.
- [x] Phase 1: Replace universal claims with fixed-calculus claims.
- [x] Phase 1: Make full coupling explicit.
- [x] Phase 1: Add one paragraph explaining the adequacy boundary.
- [x] Phase 2: Move or create the running example near the start.
- [x] Phase 2: Add the one-page informal proof.
- [x] Phase 2: Add notation/glossary boxes.
- [x] Phase 2: Add the scope table and dependency diagram.
- [x] Phase 3: Separate exact obligation stabilization, minimal public trace elimination, chronological factorization, and recurrence.
- [x] Phase 3: Ensure every theorem states which level it lives at.
- [x] Phase 3: Make the lower-bound theorem precise as an admissibility-decision lower bound unless a stronger public-field witness is supplied.
- [x] Phase 4: Recast the Agda section using the three formal statuses.
- [x] Phase 4: Add a theorem-to-module table.
- [x] Phase 4: Mark broad transfer explicitly as conjectural/future work.
- [ ] Phase 5: Remove repeated disclaimers.
- [ ] Phase 5: Shorten dense paragraphs.
- [ ] Phase 5: Replace repeated long phrases with defined abbreviations.
- [ ] Phase 5: Verify all theorem statements use the same terms for depth, chronology, and trace.

## Revised Contribution List

- [x] Replace the current contribution list with four contributions.
- [x] Contribution 1: formulate a sealed-extension calculus with opaque public signatures and presentation-invariant primitive public trace count.
- [x] Contribution 2: prove in the fixed calculus that above-binary structural integration obligations are horn-computationally derived and `mu`-minimal signatures have no primitive arity `> 2` trace.
- [x] Contribution 3: prove the binary lower bound from univalence using the two-point swap obstruction.
- [x] Contribution 4: prove the sparse footprint recurrence and fully coupled affine endpoint, with shifted Fibonacci behavior under constant payload.
- [x] End the contribution list by saying these theorems support, but do not establish, the broader cubical depth-two conjecture.

## Conclusion

- [x] Rewrite the conclusion to isolate the depth-two mechanism for sealed structural extension.
- [x] State that in the fixed formal calculus, univalence supplies genuine binary sealing obligations.
- [x] State that cubical horn computation makes higher structural integration packages derived rather than primitive public trace.
- [x] State that the model has exact public trace depth two.
- [x] State that sparse footprints give sparse recurrences.
- [x] State that the fully coupled constant-payload envelope is Fibonacci.
- [x] State that the broader cubical-foundations claim is a conjectural program.
- [x] State that the present calculus supplies a checked theorem object, trace-accounting discipline, lower-bound witnesses, and an explicit adequacy boundary.
- [x] State that future work is transfer from richer cubical surface calculi and concrete foundational extension mechanisms into the sealed-extension model.

## Final Framing Sentence

- [x] Use this sentence in the introduction.
- [x] Use this sentence in the conclusion.
- [x] Consider using this sentence in the abstract.
- [x] Sentence: "The paper proves a depth-two theorem for a fixed formal sealed-extension calculus and proposes it as evidence for a broader cubical depth-two conjecture."
