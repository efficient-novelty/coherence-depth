# Next Steps

## Current Handoff

This turn focused on the final reader-facing LMCS polish pass for
`paper/1_coherence_depth_LMCS.tex`:

- Added a single running two-point/swap example in the introduction and reused
  it in the payload/trace discussion, the lower-bound section, the depth-three
  open-box explanation, and the conclusion.
- Kept the example technically honest: the constant-left branch proves the
  unary-vs-binary lower bound, while the swap-respecting branch is the one used
  to explain later generated horn/open-box obligations.
- Rechecked the abstract/introduction/conclusion alignment and changed the
  contribution wording so Section 6 is consistently a conditional accounting
  corollary, not part of the exact-depth theorem.
- Clarified the Section 6 counting convention inline: `kappa_n` is a payload
  basis summand, `mu_n` is counted only after derived replacement, and missing
  earlier indices are zero.
- Added an explicit fixture-name sentence in the mechanization section
  distinguishing full-coupling examples, sparse local growth, zero-footprint
  transparent growth, and higher payload that is not structural trace.
- Audited the remaining artifact-polish checklist items. The Agda/OpenExt names
  already expose total extension rather than arbitrary filler uniqueness, and
  the Zenodo package already contains the theorem map, trust-boundary docs, and
  exact check commands.
- Decided to keep the theorem-to-artifact table in the LMCS text despite the
  narrow-cell warnings because it is the cleanest audit surface for referees.

## Verification Completed This Turn

- `python scripts/check_paper_map.py paper-map.yaml` passed.
- `git diff --check -- paper/1_coherence_depth_LMCS.tex checklist.md next_steps.md`
  passed.
- `pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth_LMCS.tex`
  passed twice from `paper/` after the paper edits.
- The final LaTeX log has no undefined-reference or rerun warnings.
- The compiled PDF is currently 52 pages. Remaining layout warnings are accepted
  for now: small overfull hboxes around the Section 3.1 heading, the main
  Section 5 slogan/dependency lines, and narrow cells in the theorem-to-artifact
  table, plus underfull boxes in dense role/table material.
- Pre-existing worktree changes outside this turn were preserved:
  - `check_list.md` is deleted in the worktree.
  - `paper_improvement_plan.md` is modified in the worktree.

## Recommended Next Improvement Turn

Focus on final submission packaging and the last page-budget decision.

### Target Files

- `paper/1_coherence_depth_LMCS.tex`
- `coherence_depth_zenodo/README_ZENODO.md`
- `coherence_depth_zenodo/.zenodo.json`
- `checklist.md`
- `next_steps.md`
- optionally `README.txt` and `docs/coherence_depth_trust_boundary.md` if the
  final release instructions change

### Detailed Plan

1. Make the final page-budget decision.
   - If the target is a hard 50 pages, do a compression pass aimed at 2 pages:
     shorten Section 6 further, move the final archival-tag row out of the
     theorem-to-artifact table, and compress repeated scope prose.
   - If 52 pages is acceptable for first submission, prepare a short
     editor-facing length note explaining that the extra space is used for the
     mechanization boundary and theorem-to-artifact audit.

2. Finish archival metadata.
   - Reserve or insert the Zenodo DOI.
   - Ensure `.zenodo.json`, `README_ZENODO.md`, the paper source, and the final
     PDF all agree on title, authorship, repository URL, and version.
   - Make sure the artifact points to the final tagged release rather than only
     the moving development repository.

3. Run the full artifact gate on the final commit.
   - `make artifact-check` or `bash scripts/check_coherence_depth_artifact.sh`.
   - `python scripts/check_paper_map.py paper-map.yaml`.
   - `python scripts/audit_postulates.py agda paper-map.yaml`.
   - Record the hosted GitHub Actions artifact-check URL once the tag is pushed.

4. Do one final PDF pass.
   - Run `pdflatex` twice from `paper/`.
   - Check there are no undefined references.
   - Reassess Type 3/font extraction if the submission system complains.

## Acceptance Criteria For Next Turn

- The page-count decision is explicit: compressed to target or accompanied by a
  clear length rationale.
- The paper and Zenodo metadata contain the final DOI/tag information.
- The full artifact check passes locally and, if possible, on GitHub Actions for
  the tagged archival commit.
- `checklist.md` contains only release-blocking or deliberately deferred items.
