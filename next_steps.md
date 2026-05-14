# Next Steps

## Current handoff

This turn completed the remaining constructor-by-constructor higher-horn decoding
mechanization item.

- Added `Metatheory/StructuralHornDecoding.agda`.
  - Introduces `HigherHornOpenBoxData`, the explicit cubical data carried by a generated
    higher horn.
  - Introduces `SealingGeneratedHigherHorn` with one constructor for each sealing-generated
    semantic case: `remoteComparisonGenerated`, `degenerateGenerated`, and
    `transportedGenerated`.
  - Provides constructor-specific decoders:
    `decodeRemoteComparisonHornOpenBox`, `decodeDegenerateHornOpenBox`, and
    `decodeTransportedHornOpenBox`.
  - Provides the general decoder:
    `decodeGeneratedHigherHornOpenBox`.
  - Repackages decoded horns as `HornOpenBoxPackage` and `StructuralHornCubicalData` via
    `decodeGeneratedHigherHornPackage` and `decodeGeneratedHigherHornCubicalData`.
  - Proves the decoded structural total extension is contractible via
    `decodeGeneratedHigherHornContractible`.
- Added `Test/StructuralHornDecodingSmoke.agda`, which instantiates all three generated horn
  constructors and checks mode selection, open-box decoding, horn-package production,
  cubical-data production, and contractibility.
- Imported the new module and test from `Everything.agda`, and exported the public decoding
  surface from `PEN.agda`.
- Updated `paper-map.yaml`, `docs/theorem_index.md`, `README.txt`, and `agda/README.md`.
- Marked the checklist item "Decode each sealing-generated higher horn into an explicit open
  box" complete.

## Verification completed this turn

- `agda --transliterate Test/StructuralHornDecodingSmoke.agda` passes.
- `agda --transliterate Everything.agda` passes.
- README-style direct Agda checklist passes for 26 files, including the new decoding smoke
  test and higher-payload checks.
- `python scripts/check_paper_map.py paper-map.yaml` passes:
  19 entries, 77 modules, 301 names.
- `python scripts/audit_postulates.py agda paper-map.yaml` passes:
  112 local modules in the transitive closure, no local postulates or primitives.
- `python scripts/coherence_depth_audit.py runs\coherence_depth_case_studies` passes:
  7 fixtures.
- Agda still emits existing `UnsupportedIndexedMatch` warnings; these remain warnings and
  were not introduced as errors.

## Mechanization status

The Mechanization checklist section is now complete except for non-mechanization external
items elsewhere in the checklist.  The artifact has:

- explicit structural open boxes;
- explicit structural total-extension and compatible-lid surfaces;
- total-extension contractibility;
- constructor-by-constructor generated higher-horn decoding;
- derivation-object based higher-horn derivedness;
- theorem-map and README coverage.

## Recommended next turn

1. Move to PDF/LMCS verification.
   - Build the intended submission TeX entry point.
   - Run `pdffonts`, `pdfinfo`, and `pdftotext`.
   - Inspect the build log for overfull boxes.
   - Mark Type 3, text extraction, page count, overfull-box, and clean-rebuild checklist
     items only after inspecting actual tool output.

2. Keep the Agda limitation visible in prose/docs.
   - `CompatibleStructuralOpenExt` exposes compatible lids plus a `PathP` filler through the
     underlying cubical family.
   - A literal `PathP` through Cubical Agda's `Sub` family remains an adequacy-bridge reading
     because the primitive `PathP` ranges over `Set`, while `Sub` is in `SSet`.

3. External-data items remain blocked.
   - ORCID requires a real author ORCID.
   - Zenodo citation requires an archived release DOI.
