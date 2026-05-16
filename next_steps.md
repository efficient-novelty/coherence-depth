# Next Steps

## Current Handoff

This turn sharpened the next reviewer-risk layer of the LMCS paper:

- Restated the lower-bound theorem as an explicit `Real_1`/`Real_2` separation.
  - Added `Unary and binary fragments for the swap test`.
  - The swap obstruction now gives `x_1 : Real_1(X_const)` whose `res_{1,2}` fiber is empty.
  - The proof keeps the two-point calculation and ties the obstruction directly to the public univalent swap path.
- Tightened the open-box contractibility proof.
  - The canonical lid is now explicitly computed by `hcomp`.
  - The filler is now explicitly computed by `hfill`.
  - The proof now identifies `OpenExt` as the total endpoint-plus-dependent-path object, i.e. the path-singleton/total-extension statement rather than a fixed-lid filler uniqueness claim.
- Updated `checklist.md` for the formal-core, lower-bound, open-box, derivedness, and exact-depth items that are now present in the paper.

## Verification Completed This Turn

- `pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth_LMCS.tex` passed twice from `paper/`.
- `git diff --check -- paper/1_coherence_depth_LMCS.tex checklist.md next_steps.md` passed.
- The generated LMCS PDF is currently 51 pages.
- Existing unstaged changes outside this turn were left alone:
  - `check_list.md` is deleted in the worktree.
  - `paper_improvement_plan.md` is modified in the worktree.

## Recommended Next Improvement Turn

Focus on Critical Issue 5: mechanization claims should be narrowed and synchronized with the artifact map. This is the next high-value paper pass because the mathematical proof path is now more explicit, but the mechanization table still uses broad statuses such as `checked/conditional`.

### Target Files

- `paper/1_coherence_depth_LMCS.tex`
- `paper-map.yaml`
- `docs/theorem_index.md`
- `checklist.md`
- optionally `README.txt` if the trust-boundary wording needs to match the paper

### Detailed Plan

1. Inspect current artifact metadata.
   - Read the relevant `paper-map.yaml` entries for:
     `C_ext`, generated obligations, `ObSig_k`, `Real_k`, lower bound, horn decoding,
     open-box contractibility, derived-trace replacement, exact depth, recurrence, and transfer.
   - Read `docs/theorem_index.md` for current theorem names and status wording.

2. Define a fixed status vocabulary in the paper.
   - Suggested vocabulary:
     `fully mechanized`, `mechanized for an abstract interface`, `conditional on adequacy`,
     `paper proof`, `not claimed`.
   - Add a short paragraph explaining that these statuses are theorem-by-theorem, not a blanket claim about arbitrary Cubical Agda developments.

3. Replace the Section 7 mechanization table with a theorem-to-artifact map.
   - Include rows for:
     fixed calculus grammar, generated structural obligations, `ObSig_k`/`Real_k`,
     binary lower bound, horn-to-open-box adequacy, total open-extension contractibility,
     derived-trace replacement, exact depth-two stabilization, recurrence, and broad transfer.
   - Use specific artifact module/theorem names where available.
   - Mark any abstract-interface result honestly instead of calling it fully checked.
   - Include the trusted input/condition in the final column.

4. Synchronize repository docs and maps.
   - Update `paper-map.yaml` status text if it conflicts with the paper vocabulary.
   - Update `docs/theorem_index.md` if theorem names or status wording drift.
   - Keep claims about arbitrary Cubical Agda transfer conditional.

5. Update `checklist.md`.
   - Mark only the mechanization-boundary rows that are actually completed.
   - Likely candidates:
     theorem-to-artifact table, fixed status vocabulary, fully/interface/conditional/paper-only status rows,
     trust-boundary paragraph, conditional broad-transfer claims, paper-map alignment, theorem-index alignment.

6. Verify.
   - Run `python scripts/check_paper_map.py paper-map.yaml`.
   - Run `pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth_LMCS.tex` twice from `paper/`.
   - Run `git diff --check`.

## Acceptance Criteria For Next Turn

- Section 7 no longer relies on vague `checked/conditional` wording.
- Every major theorem has a precise artifact status and trusted boundary.
- `paper-map.yaml`, `docs/theorem_index.md`, and the paper use compatible names/statuses.
- The paper still compiles after the table update.
- Unrelated worktree changes remain untouched unless explicitly requested.
