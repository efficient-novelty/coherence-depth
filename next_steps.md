# Next Steps

## Current Handoff

This turn focused on the Critical Issue 7 presentation pass for
`paper/1_coherence_depth_LMCS.tex`:

- Replaced fragile manual theorem-number references in Section 2 with stable
  labels for primitive bases, full coupling, trace-counting convention, sparse
  extensions, coverage, and basis minimality.
- Demoted low-yield theorem-like bookkeeping statements to prose paragraphs:
  transparent user-level code, primitive basis invariants, irreducible public
  fields, canonical normalized presentations, the trace-cost dictionary,
  primitive status of trace roles, and payload-to-trace non-leakage.
- Tightened the proof-path display into a compact dependency audit that keeps
  exact obligation depth, public-signature minimality, chronology, and recurrence
  separate.
- Renamed Section 6 to "Conditional counting consequences" and demoted the
  recurrence theorem to a conditional accounting corollary with the bundled
  per-site and full-coupling hypotheses in the statement.
- Decided the theorem-map target strategy: keep `paper-map.yaml` pointed at the
  full repository paper source, and use the LMCS compressed-label bridge in
  `docs/theorem_index.md` plus the Section 7 table for the LMCS submission file.
- Split the wide horn-to-open-box data display and shortened the early judgment
  display. The compiled LMCS PDF is now 51 pages, down from 52.

## Verification Completed This Turn

- `python scripts/check_paper_map.py paper-map.yaml` passed.
- `git diff --check -- paper/1_coherence_depth_LMCS.tex docs/theorem_index.md`
  passed.
- `pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth_LMCS.tex`
  passed twice from `paper/`.
- The final LaTeX run has no undefined-reference warnings.
- Remaining layout warnings are minor: small overfull hboxes around the Section
  3.1 heading, a dependencies line near the syntactic horn reduction, and narrow
  cells in the theorem-to-artifact table; the old wide displays around the
  former LMCS lines 482 and 2394 were fixed.
- Pre-existing worktree changes outside this turn were left untouched:
  - `check_list.md` is deleted in the worktree.
  - `paper_improvement_plan.md` is modified in the worktree.

## Recommended Next Improvement Turn

Focus on the last reader-facing LMCS polish pass: running example, introduction
and conclusion alignment, remaining fixture/naming tasks, and final artifact
readiness.

### Target Files

- `paper/1_coherence_depth_LMCS.tex`
- `checklist.md`
- `next_steps.md`
- optionally Agda/doc fixture files if sparse/full-coupling fixture naming is
  addressed

### Detailed Plan

1. Add and reuse one running example.
   - Thread the two-point/swap example through the introduction, lower-bound
     section, horn/open-box explanation, and conclusion.
   - Keep it short: it should orient the referee, not become a second proof.

2. Return to the abstract, introduction, and conclusion.
   - Make sure the now-conditional Section 6 wording is mirrored exactly.
   - Make the fixed-calculus theorem path visible before the accounting story.
   - Check that no broad Cubical Agda transfer claim outruns the adequacy
     boundary.

3. Finish the remaining Phase 4 artifact-polish items.
   - Check whether Agda/module names visibly say total extension rather than
     arbitrary filler uniqueness.
   - Add fixture names or docs that distinguish sparse cases from full-coupling
     cases.
   - Prepare the Zenodo checklist: theorem map, trust-boundary docs, exact check
     commands, tagged release, and DOI placeholder.

4. Decide the final treatment of the theorem-to-artifact table.
   - If the LMCS page target is stricter than 51 pages, consider shortening the
     table or moving some artifact detail to the release docs.
   - Otherwise explicitly accept the table warnings as the cost of an auditable
     mechanization boundary.

5. Verify.
   - Run `python scripts/check_paper_map.py paper-map.yaml`.
   - Run `pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth_LMCS.tex`
     twice from `paper/`.
   - Run `git diff --check`.

## Acceptance Criteria For Next Turn

- The paper has one visible running example instead of several disconnected
  intuitions.
- The abstract, introduction, Section 6, and conclusion use the same scoped
  theorem language.
- Remaining artifact-readiness checklist items are either completed or narrowed
  to release-only work.
- Remaining layout warnings are either fixed or explicitly accepted with a short
  reason.
