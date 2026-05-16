# Next Steps

## Current Handoff

This turn completed the page-budget and packaging cleanup for
`paper/1_coherence_depth_LMCS.tex`:

- Kept the LMCS paper at 47 pages after the final compression/proof-contract
  pass, below the earlier 50-page fallback target.
- Updated the length note in `paper/lmcs_length_justification_fallback.md` to
  match the current 47-page build.
- Added compact proof contracts to the load-bearing theorem statements and
  tightened related-work/scope wording.
- Marked broad transfer to arbitrary cubical languages as a paper-only
  non-claim in the LMCS mechanization table.
- Updated the Zenodo package metadata to 47 pages and synced the package
  LMCS source/PDF/BibTeX output/length note with the current root build.

Pre-existing worktree changes outside this turn were preserved:

- `check_list.md` is deleted in the worktree.
- `paper_improvement_plan.md` is modified in the worktree.

## Verification Completed This Turn

- `pdflatex -interaction=nonstopmode -halt-on-error 1_coherence_depth_LMCS.tex`
  passed twice from `paper/`.
- The final LaTeX log reports `1_coherence_depth_LMCS.pdf (47 pages, 648983 bytes)`.
- The final LaTeX log has no undefined-reference or rerun warnings.
- Remaining LaTeX layout warnings are accepted for now: small overfull boxes near
  the Section 3.1 heading and dependency lines, plus underfull boxes in narrow
  role/theorem-map table cells.
- `git diff --check` passed for the edited paper, package, checklist, and
  length-note files.
- `python scripts/check_paper_map.py paper-map.yaml` passed.
- `bash scripts/check_coherence_depth_artifact.sh` passed, including Agda
  typechecking, theorem-map checking, postulate audit, and case-study audit.
- `bash scripts/check_coherence_depth_artifact.sh` also passed from
  `coherence_depth_zenodo/`, verifying the upload folder in place.
- The root and Zenodo-package LMCS TeX/PDF hashes match after syncing.
- `make artifact-check` could not be used because `make` is not installed in
  this PowerShell environment; the bash artifact script was used instead.

## Recommended Next Improvement Turn

Focus on the final archival release loop.  The DOI is reserved; the remaining
release-blocking decision is the final tag and hosted workflow URL.

### Target Files

- `paper/1_coherence_depth_LMCS.tex`
- `paper/lmcs_length_justification_fallback.md`
- `coherence_depth_zenodo/README_ZENODO.md`
- `coherence_depth_zenodo/.zenodo.json`
- `coherence_depth_zenodo/paper/1_coherence_depth_LMCS.tex`
- `coherence_depth_zenodo/paper/1_coherence_depth_LMCS.pdf`
- `checklist.md`
- `next_steps.md`

### Detailed Plan

1. Choose the final archival tag name.
   - The reserved Zenodo DOI is `10.5281/zenodo.20235005`.
   - Do not create a final tag until the release metadata are ready to point at
     the same snapshot.

2. Insert final tag metadata consistently.
   - DOI metadata has been inserted in the LMCS paper text, Zenodo metadata,
     Zenodo README, and root README.
   - Replace any remaining development-only artifact wording with the archived
     record once the release tag and hosted workflow URL exist.

3. Rebuild and resync the archive package.
   - Run `pdflatex` twice from `paper/`.
   - Copy the final LMCS TeX/PDF into `coherence_depth_zenodo/paper/`.
   - Recheck that root and package hashes match.

4. Run the final gates and publish the archival snapshot.
   - Run `bash scripts/check_coherence_depth_artifact.sh`.
   - Push the final commit and tag.
   - Wait for the hosted GitHub Actions artifact-check run on the tag, then
     record the final workflow URL in the checklist or release notes.

5. Do one last proof/layout sanity pass if time permits.
   - Revisit the remaining unchecked proof-sketch audit items in `checklist.md`.
   - Reassess the small LaTeX overfull/underfull warnings only if the DOI/tag
     edits disturb layout.

## Acceptance Criteria For Next Turn

- The paper, Zenodo metadata, and archive README agree on DOI, tag, title,
  authorship, repository URL, and version.
- The final root LMCS TeX/PDF and Zenodo-package copies are byte-identical.
- The local artifact check passes on the final release commit.
- The hosted GitHub Actions artifact-check URL for the tagged archival commit is
  recorded.
- `checklist.md` contains only deliberately deferred proof-polish items or
  post-submission follow-up.
