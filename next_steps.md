# Next Steps

## Current Handoff

This turn tightened the LMCS mechanization boundary instead of adding more proof
machinery:

- Replaced the vague Section 7 `checked/conditional` table with a theorem-to-artifact
  status table using the fixed vocabulary:
  `fully mechanized`, `mechanized for an abstract interface`,
  `conditional on adequacy`, and `paper-only`.
- Added explicit trusted inputs/conditions for the fixed calculus, `Real_k`
  stabilization, horn decoding, total `OpenExt` contractibility, derived-trace
  replacement, lower bound, exact public depth-two corollary, recurrence, the
  concrete SMod adequacy instance, broad transfer, and final archival metadata.
- Added section labels for the fixed-calculus and mechanization sections so the
  new table can point to stable LMCS paper locations.
- Synchronized the repository-side status story:
  - updated `paper-map.yaml` status details where weaker statuses were still
    described as simply "fully formalized";
  - added an LMCS compressed-label table to `docs/theorem_index.md`;
  - updated `docs/coherence_depth_trust_boundary.md` to spell out the four
    status phrases and theorem-by-theorem reading.
- Updated `checklist.md` for the completed mechanization-boundary items and
  added two newly identified final-polish items:
  - decide whether the final artifact should keep `paper-map.yaml` pointed at
    `paper/1_coherence_depth.tex` or add an LMCS-specific theorem-map target;
  - revisit remaining LaTeX overfull boxes and the page budget before submission.

## Verification Completed This Turn

- `python scripts/check_paper_map.py paper-map.yaml` passed.
- `pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth_LMCS.tex`
  passed twice from `paper/` after the final table edit.
- `git diff --check -- paper/1_coherence_depth_LMCS.tex paper-map.yaml docs/theorem_index.md docs/coherence_depth_trust_boundary.md`
  passed.
- The generated LMCS PDF is now 52 pages.
- Pre-existing worktree changes outside this turn were left untouched:
  - `check_list.md` is deleted in the worktree.
  - `paper_improvement_plan.md` is modified in the worktree.

## Recommended Next Improvement Turn

Focus on Critical Issue 7 and the final LMCS presentation pass. The main proof
path and mechanization boundary are now explicit, but the paper still has
presentation-density risks: page count, recurrence placement, some wide displays,
and theorem-like statements that may still read heavier than necessary.

### Target Files

- `paper/1_coherence_depth_LMCS.tex`
- `checklist.md`
- `next_steps.md`
- optionally `paper-map.yaml` if the LMCS-specific theorem-map decision is made

### Detailed Plan

1. Audit theorem-like statements in the LMCS source.
   - Use `rg "\\\\begin\\{(thm|lem|prop|cor)\\}|\\\\label\\{(thm|lem|prop|cor):" paper/1_coherence_depth_LMCS.tex`.
   - Keep named theorem labels for the load-bearing proof spine.
   - Demote any definitional, rhetorical, or direct-unpacking statements to prose
     or remarks.

2. Tighten the visual proof path.
   - Add or improve a compact dependency diagram only if it reduces text.
   - Ensure the fixed calculus -> horn decoding -> total `OpenExt` ->
     replacement -> `Real_k ~= Real_2` chain is visible without forcing the
     reader through artifact prose.

3. Demote and compress recurrence material.
   - Keep Section 6 visibly conditional and downstream.
   - Consider moving lengthy recurrence commentary to repository/Zenodo docs if
     the LMCS page budget is tight.
   - Make sure full-coupling and factorization-complete assumptions appear in the
     theorem statement or immediately before it.

4. Fix high-value layout warnings.
   - The current build still reports overfull boxes in earlier displays/tables,
     especially around LMCS source lines 482 and 2394.
   - Prefer mathematical line breaks or smaller local displays over cosmetic
     global spacing changes.

5. Decide the theorem-map target strategy.
   - Either keep `paper-map.yaml` as the full-paper theorem map and document the
     LMCS compressed-label bridge, or add a separate LMCS-specific map/check.
   - Do not retarget `paper-map.yaml` blindly: the current checker validates the
     full `paper/1_coherence_depth.tex` label set.

6. Verify.
   - Run `python scripts/check_paper_map.py paper-map.yaml`.
   - Run `pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth_LMCS.tex`
     twice from `paper/`.
   - Run `git diff --check`.

## Acceptance Criteria For Next Turn

- The central proof path reads linearly and with fewer low-yield theorem labels.
- Recurrence remains clearly conditional and downstream.
- The PDF page count and worst layout warnings are improved or deliberately
  accepted with reasons.
- The theorem-map strategy for the LMCS file is decided rather than left implicit.
