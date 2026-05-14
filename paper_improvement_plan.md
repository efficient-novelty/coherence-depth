# Paper Improvement Plan: LMCS-Ready Coherence Depth

## Purpose

This plan turns the current feedback on `paper/1_coherence_depth_draft.tex` into an actionable revision program. The goal is to make the paper credible as an LMCS submission by aligning the theorem claims, proof detail, mechanization status, and journal presentation.

The core diagnosis is:

- The topic is in scope for LMCS.
- The main theorem is interesting, but currently over-claimed relative to the formal core.
- The proof chain from higher structural obligation to non-primitive trace must be made fully checkable.
- The mechanization must either be strengthened to match the prose or the prose must classify the mechanization as abstract, conditional, or theorem-facing.
- The paper must be cut and restyled for LMCS.

The intended revised contribution should be stated early and consistently:

> This paper proves a depth-two theorem for a deliberately small sealed-extension calculus over a cubical core. It does not prove a theorem about arbitrary Cubical Agda developments, arbitrary module systems, or arbitrary cubical foundations. Broader transfer is formulated through an adequacy interface.

## Target theorem stack

The LMCS-ready version should be organized around the following theorem stack.

1. **Fixed calculus `C_ext`.**
   Define syntax, typing, sealing, normalized public signatures, trace roles, primitive/derived status, and `Real_k`.

2. **Lower bound.**
   In the univalent two-point interface, unary action data do not determine binary trace.

3. **Structural horn theorem.**
   Every sealing-generated higher structural obligation is equivalent to an explicit open-box extension object over lower public boundary data.

4. **Open-box total-space theorem.**
   The total space of compatible lids plus fillers is contractible.

5. **Replacement theorem.**
   A contractible structural horn factor yields a constructed `DerivedTrace` witness and is not primitive in `mu`-minimal public signatures.

6. **Main theorem.**
   For every object `X` in the fixed calculus, `Real_k(X) ~= Real_2(X)` for `k >= 2`, and no primitive structural trace above binary arity remains in minimal public signatures.

7. **Optional accounting corollary.**
   Under full coupling, factorization-complete export, bundled per-site trace counting, and uniform payload assumptions, the two-layer recurrence follows.

Each theorem should explicitly name its dependencies. The paper should not use a later normalization or presentation-equivalence convention to make an earlier cubical proof look automatic.

## Priority order

### P0: Claim calibration

These are required before the paper can be responsibly submitted.

- State that the main result is for the fixed sealed-extension calculus only.
- Replace broad claims about arbitrary cubical foundations or arbitrary implementations with conditional transfer claims through the adequacy interface.
- Make the mechanization status explicit: fully mechanized, abstract-interface mechanized, conditional on adequacy, or paper-only.
- Remove any wording that implies the current artifact already proves explicit cubical horn geometry if it only proves a based path singleton abstraction.

### P1: Formal theorem repair

These are the mathematical load-bearing repairs.

- Define `Real_k(X)` as an actual dependent object.
- Define the structural horn grammar formally.
- Prove horn-to-open-box adequacy by induction on that grammar.
- Separate total extension contractibility from fixed-boundary filler non-contractibility.
- Replace derived-status tags with constructed `DerivedTrace` witnesses.
- Prove replacement before using it to eliminate higher structural trace from `mu`-minimal signatures.

### P2: Artifact alignment

These make the repository support the paper honestly.

- Introduce an explicit structural open-box record.
- Prove contractibility of the total extension object.
- Decode sealing-generated horns into explicit open boxes.
- Replace raw higher-horn derived tags with derivation objects.
- Update theorem map, README, and appendix status vocabulary.

### P3: LMCS presentation

These are required for a polished submission.

- Cut the main text to about 45-50 pages or prepare an editor-facing length justification.
- Move or remove the table of contents currently before the introduction.
- Shorten and simplify the abstract.
- Fix Type 3 fonts and text extraction.
- Add affiliation and ORCID support.
- Archive the artifact on Zenodo and cite a DOI.
- Check bibliography, DOI coverage, theorem environments, comments, unsupported packages, and overfull boxes.

## Workstream 1: Reframe the paper contract

### Problem

The draft oscillates between a broad foundational narrative and a theorem about a deliberately fixed calculus. This creates a mismatch between reader expectations and the formal proof.

### Required revisions

1. **Abstract.**
   Rewrite the abstract to state:
   - fixed calculus;
   - depth-two theorem;
   - binary lower bound;
   - higher structural trace eliminated by open-box replacement;
   - mechanization status, without implying more than the artifact proves.

   Avoid dense notation where possible. If notation remains, prepare an HTML abstract for LMCS.

2. **Introduction.**
   Add the fixed-calculus contract in the first two pages. Keep only one strong scope paragraph in the introduction, one before the main theorem, and one in the conclusion.

3. **Title.**
   Decide whether the paper is unconditional or conditional:
   - If the horn/open-box and replacement proofs are fully made precise, consider removing "Toward".
   - If the main result remains conditional on an adequacy package, keep "Toward" or use another title that signals the conditional state.

4. **Contribution list.**
   Replace broad claims with a tight list:
   - fixed sealed-extension calculus;
   - formal `Real_k`;
   - binary lower bound;
   - structural horn-to-open-box adequacy;
   - open-box total-space contractibility;
   - derived trace replacement;
   - exact depth two for structural trace;
   - conditional recurrence/accounting corollary.

5. **Non-goals.**
   State once:
   - not arbitrary Cubical Agda;
   - not arbitrary module systems;
   - not arbitrary cubical foundations;
   - not a claim that all higher payload data are eliminable;
   - not a claim that fixed-boundary filler spaces are generally contractible.

### Acceptance criteria

- A referee can tell by page 2 exactly what is proved and what is conditional.
- No major theorem statement depends on informal scope disclaimers scattered later in the paper.
- The abstract and title agree on whether the result is unconditional, conditional, or "toward" a larger theorem.

## Workstream 2: Define `Real_k(X)` formally

### Problem

The current draft treats `Real_k(X)` too much like an interpretation slogan: "the dependent type, space, or cubical object interpreting `ObSig_k(X)`." That is not precise enough for the equivalence `Real_k(X) ~= Real_2(X)`.

### Required definition

Introduce a definition with the following data:

- A fixed sealed-extension calculus `C_ext`.
- Raw declarations and raw trace fields before primitive/derived classification.
- Public signature extraction `PubSig(X)`.
- Arity filtering operation `ObSig_k(X)`.
- A semantics or realization interpretation `[[ - ]]`.
- A dependent object:

  ```text
  Real_k(X) := [[ ObSig_k(X) ]]
  ```

  or the more explicit dependent sum/product object used by the semantics.

- Restriction maps:

  ```text
  res_{k,l} : Real_l(X) -> Real_k(X)      for k <= l
  ```

- Weakening/extension maps where applicable.
- Functoriality:

  ```text
  res_{k,k} = id
  res_{j,k} . res_{k,l} = res_{j,l}
  ```

- The exact equivalence relation used in statements:
  - definitional equality;
  - isomorphism of dependent records;
  - equivalence of types;
  - cubical path/equivalence.

### Proof obligations

For each equivalence `Real_k(X) ~= Real_2(X)`, state:

- the forward map;
- the inverse or section/retraction data;
- the homotopies or judgmental equalities proving equivalence;
- whether the proof is natural in `X`;
- whether the proof is internal to the calculus, meta-theoretic, or artifact-level.

### Placement

Place this before the main theorem in Section 5, or earlier if Section 2 is the definitional home for public signatures.

### Acceptance criteria

- `Real_k(X)` has a stable definition that later theorems refer to.
- The maps between depths are named and typed.
- The main theorem no longer relies on an informal interpretation of `ObSig_k(X)`.

## Workstream 3: Formal structural horn grammar

### Problem

The paper currently relies on the claim that the sealing grammar generates exactly open boxes. A referee will expect this to be proved by induction on derivations from a precise grammar.

### Required grammar

For every constructor generating a higher structural obligation, specify:

- constructor name;
- arity;
- raw input data;
- lower public boundary data;
- support/history footprint;
- boundary faces;
- missing face;
- filler type;
- public/export status;
- substitution action;
- stability under weakening and renaming;
- whether it can introduce payload or only structural trace.

### Suggested record shape

Use a grammar judgment like:

```text
Gamma |- H : StructuralHorn(n, X)
```

with fields or derived projections:

```text
support(H)
boundary(H)
missing(H)
baseFace(H)
fillerType(H)
publicStatus(H)
subst(H, sigma)
```

The grammar should distinguish:

- unary action trace;
- binary comparison trace;
- higher structural trace;
- payload fields that are not structural trace.

### Induction principle

State and use the induction principle:

```text
To prove P(H) for every sealing-generated structural horn H,
prove P for each constructor and show P is stable under substitution,
weakening, and public-signature normalization.
```

### Acceptance criteria

- There is no theorem whose proof says only "by expanding the sealing grammar."
- Every higher structural obligation is produced by a named grammar constructor.
- The horn-to-open-box theorem can literally be proved by induction on the displayed grammar.

## Workstream 4: Horn-to-open-box adequacy theorem

### Problem

The current load-bearing chain contains asserted links:

```text
higher structural obligation
  -> structural horn
  -> open-box extension
  -> contractible total extension space
  -> derived public field
  -> removed from mu-minimal signature
```

The horn-to-open-box step must become an explicit theorem, not a paragraph about reassociating dependent sums.

### Theorem to add

For every sealing-generated higher structural horn `H`, construct:

- a family `A : I -> Type`;
- a cofibration or face formula `phi`;
- a partial boundary

  ```text
  u : (t : I) -> Partial phi (A t)
  ```

- a compatible base face

  ```text
  u0 : A i0 [ phi |-> u i0 ]
  ```

- a compatible lid type;
- a filler type;
- an equivalence between the original structural obligation and the explicit open extension object.

Suggested statement:

```text
HornOpenBoxAdequacy(H) :
  StructuralObligation(H) ~= OpenExt(decodeOpenBox(H))
```

where:

```text
OpenExt(ob) := Sigma lid, Filler(ob, lid)
```

### Proof method

Use induction on the structural horn grammar.

For each constructor:

- identify `A`;
- compute `phi`;
- define `u`;
- prove side compatibility;
- identify the missing face;
- identify the lid;
- show the original filler obligation is equivalent to `PathP` through the boundary-compatible subtype;
- prove substitution stability.

### What not to claim

Do not say:

```text
fixed missing face -> filler
```

is contractible in general.

Say:

```text
Sigma (compatible missing face), filler
```

is contractible as a dependent path singleton.

### Acceptance criteria

- The theorem statement contains the open-box data explicitly.
- The proof has one case per structural horn constructor.
- The proof exposes where the total-space singleton arises.
- Fixed-lid filler spaces are never accidentally claimed to be contractible.

## Workstream 5: Open-box total-space contractibility

### Problem

The current mechanized `OpenBox` appears too thin: an empty record with a `Lid` essentially given by `A i1`, and `Filler` as `outS u0 == lid`. This captures the total-space shape but not explicit boundary geometry.

### Required paper theorem

Define an explicit open-box record in the paper:

```text
record StructuralOpenBox where
  A        : I -> Type
  phi      : Cofibration
  u        : (t : I) -> Partial phi (A t)
  u0       : A i0 [ phi |-> u i0 ]
  lidType  : Type
  lidOk    : lidType -> BoundaryCompatibility
  filler   : (lid : lidType) -> lidOk lid -> Type
```

Then define:

```text
OpenExt(ob) := Sigma lid, Sigma lidOk, Filler(ob, lid, lidOk)
```

or the equivalent subtype formulation:

```text
OpenExt(ob) :=
  Sigma (lid : A i1 [ phi |-> u i1 ]),
    PathP BoundaryFamily base lid
```

### Required proof distinction

State both facts explicitly:

1. Total extension contractibility:

   ```text
   isContr(OpenExt(ob))
   ```

   because it is a dependent path singleton.

2. Fixed lid non-contractibility warning:

   ```text
   Filler(ob, fixedLid)
   ```

   is not generally contractible and may even be empty when the lid is incompatible.

### Acceptance criteria

- The distinction is in definitions, not only in prose.
- The proof of the main theorem uses total extension contractibility only after the lid is included in the total space.
- Examples and explanations avoid suggesting arbitrary boundary fillers are unique.

## Workstream 6: Derivedness as constructed witness

### Problem

The paper says "derivedness is a theorem, not a tag," but the definitions still risk treating derivedness as a status assigned by the grammar.

### Required architecture

1. Define raw trace fields without primitive/derived status.

2. Define a witness:

   ```text
   DerivedTrace(field) :=
     Sigma lowerBoundaryData,
     Sigma replacementTerm,
     Sigma typingProof,
     Sigma semanticProof,
       UsesOnlyAllowedLowerData(replacementTerm)
   ```

3. Define primitive status negatively or canonically:

   ```text
   Primitive(field) :=
     no admissible DerivedTrace(field) in the fixed normalization relation
   ```

   or by canonical minimal presentation after replacement has been proved.

4. Define `mu` only after replacement and primitive status are defined.

### Replacement theorem

Add or strengthen the theorem:

```text
Replacement(H) :
  DerivedTrace(field(H)) ->
  PubSig(X) equivalent to PubSig(X without field(H), replacementTerm(H))
```

This theorem must show:

- the replacement term has the same type;
- the replacement preserves semantics;
- the replacement uses only lower boundary data plus allowed cubical operations;
- the normalized public signature is preserved;
- the field does not count as primitive in `mu`.

### Acceptance criteria

- No raw grammar constructor takes "derived" as unverified input.
- Theorem 5.16, or its revised version, constructs `DerivedTrace` for every structural trace field of arity at least 3.
- The `mu`-minimal signature theorem depends on constructed witnesses, not tags.

## Workstream 7: Lower bound repair

### Problem

The boolean-swap obstruction is strong, but the lower-bound theorem should be stated as a formal separation between unary and binary obligations.

### Required theorem shape

Use one of these formulations.

Formulation A:

```text
There exists X such that Real_1(X) is inhabited, but Real_2(X) is empty
or not equivalent to Real_1(X).
```

Formulation B:

```text
There exists a raw objectwise action accepted by the unary fragment whose
sealing fails in the binary fragment.
```

Then prove:

```text
d_obl >= 2
```

### Boolean-swap details to make explicit

State the precise calculation:

- The interface is the univalent two-point interface.
- Transport in the endomorphism family along `ua(swap)` conjugates an endomap by `swap`.
- The identity endomap is fixed by conjugation.
- The constant-left endomap is transported to constant-right.
- Therefore the naturality equation for constant-left along the swap path is uninhabited.

### Wording to avoid

Avoid language that makes the failing binary candidate sound like an admissible sealed extension. It is a unary-accepted candidate that fails binary sealing.

### Acceptance criteria

- The lower-bound theorem has a direct implication to `d_obl >= 2`.
- The proof separates objectwise well-formedness from binary naturality/sealing.
- The identity and constant-left examples are stated with the conjugation calculation.

## Workstream 8: Mechanization alignment

### Problem

The artifact currently appears to support an abstract total-space singleton model more than the full paper theorem. That can be acceptable if stated honestly, but it cannot be presented as a complete mechanization of explicit cubical boundary geometry unless the artifact is upgraded.

### Artifact upgrade path

Upgrade the Agda development with:

1. **Explicit open boxes.**
   Add a record with:
   - `A : I -> Type`;
   - `phi`;
   - partial boundary `u`;
   - compatible base face `u0`;
   - compatible lid subtype;
   - `PathP` fillers through the compatible-subtype family;
   - endpoint laws;
   - side equations;
   - substitution stability.

2. **Total extension contractibility.**
   Prove:

   ```text
   isContr (OpenExt ob)
   ```

   by identifying it as a dependent path singleton.

3. **Structural horn decoding.**
   For each sealing-generated higher structural horn, construct an explicit `StructuralOpenBox` and prove the obligation is equivalent to `OpenExt`.

4. **Derived trace witnesses.**
   Replace higher-horn derived tags with witness objects that carry:
   - lower data;
   - replacement term;
   - typing proof;
   - semantic proof;
   - allowed-dependency proof.

5. **Raw adequacy bridge.**
   Clarify whether `RawAdequacyPackage` is:
   - assumed interface;
   - proved for a concrete grammar fragment;
   - partially mechanized;
   - paper-only.

### Paper appendix update

Create a theorem-to-artifact map with four statuses:

- **Fully mechanized.**
  The exact paper theorem is checked.

- **Mechanized for an abstract interface.**
  Agda checks an interface theorem, but the paper must separately justify the interface applies.

- **Conditional on adequacy.**
  The result follows once an adequacy package is supplied.

- **Paper-only.**
  The proof is in the text and not currently checked.

### Acceptance criteria

- The mechanization appendix no longer overstates artifact coverage.
- A reader can see exactly which theorem depends on `RawAdequacyPackage`.
- The README and theorem map use the same status vocabulary as the paper.

## Workstream 9: Main theorem dependency cleanup

### Problem

The heart of the paper currently includes Lemma 5.11, Theorem 5.12, Lemma 5.15, Theorem 5.16, and Theorem 5.19. These are likely to draw referee scrutiny.

### Required upgrades

For each load-bearing result, provide:

- exact statement with all parameters;
- dependency list;
- proof method;
- artifact status;
- role in the main theorem;
- failure mode if the theorem were weakened.

### Suggested dependency diagram

Replace long prose "level audits" with a compact theorem dependency diagram:

```text
Fixed grammar
  -> structural horn induction
  -> horn-to-open-box adequacy
  -> total open-extension contractibility
  -> DerivedTrace construction
  -> replacement theorem
  -> mu-minimal elimination
  -> Real_k ~= Real_2

Boolean swap obstruction
  -> lower bound d_obl >= 2
```

### Acceptance criteria

- The proof chain is linear and auditable.
- No theorem uses its conclusion through a definition of "primitive" or "derived."
- The final main theorem has both upper-bound and lower-bound dependencies clearly separated.

## Workstream 10: Demote or split recurrence material

### Problem

Section 6 risks looking like the main contribution or like a broad empirical law, while it is a conditional accounting corollary under strong assumptions.

### Options

Option A: Keep a short counting section.

- Rename it to "Counting consequences."
- State assumptions in the theorem name and first sentence.
- Keep only the essential recurrence theorem and one explanation.
- Move sparse footprints, wrappers, robustness, and most examples to an appendix or supplement.

Option B: Move recurrence to companion material.

- Keep a short paragraph after the main theorem.
- Say the recurrence is a conditional accounting consequence, not the proof core.
- Put the detailed recurrence story in a note or artifact documentation.

### Required theorem wording

Use a title like:

```text
Theorem (Primitive trace cost under factorization-complete export,
full coupling, bundled per-site counting, and uniform payload).
```

The first sentence should repeat the assumptions before giving the recurrence.

### Acceptance criteria

- Readers cannot mistake the Fibonacci endpoint for the main mathematical theorem.
- The recurrence does not claim ordinary library growth follows a Fibonacci law.
- The LMCS main paper becomes shorter and more focused.

## Workstream 11: Cut to LMCS length

### Problem

The current draft is about 74 pages, while LMCS submissions generally should not exceed 50 pages unless the authors justify the length.

### Cutting plan

1. **Introduction.**
   Remove repeated scope disclaimers and keep the central contract once.

2. **Sections 2-4.**
   Compress definitions followed by "by definition" propositions.
   Combine trivial presentation-equivalence lemmas.
   Keep only definitions needed for the main theorem stack.

3. **Section 5.**
   Expand the load-bearing proof detail even if other sections shrink.
   This is the place where added pages are justified.

4. **Section 6.**
   Move most recurrence/accounting content out of the main text.

5. **Section 7 and Appendix A.**
   Replace long prose audits with a theorem-to-artifact table.
   Move artifact usage details to README or supplementary material.

6. **Examples.**
   Use one running example consistently instead of several partial examples.

### Page target

- Main paper: 45-50 pages.
- Supplement or artifact docs: detailed recurrence, long examples, extended mechanization guide.

### Acceptance criteria

- Main PDF is within or near LMCS expectations.
- Any remaining excess length is justified by formal proof detail, not repetition.
- The central theorem stack is easier to follow after cutting.

## Workstream 12: LMCS style and presentation fixes

### Required fixes

1. **Introductory section first.**
   Move `\tableofcontents` currently before the introduction to the end of the introduction, or remove it.

2. **Abstract.**
   Keep concise, plain-language, and near LMCS expectations. Reduce symbols.

3. **Class and environments.**
   Use current `lmcs.cls` and LMCS theorem environments consistently.

4. **Author block.**
   Add affiliation or suitable independent-researcher affiliation line.
   Add ORCID via `\lmcsorcid{...}` if available.

5. **Bibliography.**
   Use BibTeX with `alphaurl` or equivalent.
   Make formatting consistent.
   Add DOIs where possible.

6. **Artifact citation.**
   Archive a release on Zenodo and cite the DOI.
   Keep GitHub as the development repository, not the only archival artifact.

7. **Fonts and extraction.**
   Remove Type 3 fonts.
   Fix ligature extraction issues.
   Verify text extraction for words like "fixed" and "affine."

8. **Build hygiene.**
   Fix overfull boxes.
   Remove leftover comments.
   Remove unsupported font packages.
   Ensure links are stable.

### Acceptance criteria

- The PDF starts with the required introductory structure.
- The abstract is journal-appropriate.
- `pdffonts` shows no Type 3 fonts.
- Text extraction is clean enough for search/accessibility.
- The artifact citation includes a DOI.

## Workstream 13: Repository deliverables

### Paper deliverables

- Revised `paper/1_coherence_depth_draft.tex`.
- Revised section files if the draft continues to use split sources.
- Updated bibliography.
- Shorter main PDF.
- Optional supplementary note for recurrence/accounting.

### Artifact deliverables

- Explicit open-box Agda modules.
- Total extension contractibility proof.
- Structural horn decoding modules.
- Derived trace witness modules.
- Updated theorem map.
- Updated README with exact verification commands and status vocabulary.

### Review deliverables

- A theorem dependency diagram.
- A theorem-to-artifact status table.
- A page-budget table showing cuts.
- A submission checklist matching LMCS requirements.

## Suggested revision sequence

1. Reframe abstract, introduction, and theorem claims.
2. Define `Real_k(X)` and the restriction maps.
3. Formalize the structural horn grammar.
4. Prove horn-to-open-box adequacy in the paper.
5. Prove total open-extension contractibility with the total-space/fixed-lid distinction.
6. Redesign derivedness around `DerivedTrace` witnesses.
7. Repair the lower-bound theorem statement.
8. Update the mechanization or downgrade mechanization claims.
9. Demote recurrence material.
10. Cut the paper to LMCS length.
11. Fix LMCS formatting, fonts, artifact DOI, and bibliography.
12. Rebuild, run artifact checks, and do a final theorem-claim audit.

## Final readiness test

Before submission, the answer to each question should be "yes."

- Can a referee locate the exact definition of `Real_k(X)`?
- Is the structural horn grammar precise enough for induction?
- Does horn-to-open-box adequacy identify `A`, `phi`, `u`, `u0`, lids, and fillers?
- Is total extension contractibility separated from fixed-lid filler uniqueness?
- Is derivedness witnessed by constructed replacement terms?
- Is `mu` defined only after primitive/derived status has been justified?
- Does the lower bound formally imply `d_obl >= 2`?
- Does the mechanization appendix honestly classify every theorem?
- Is the recurrence section visibly optional and conditional?
- Is the paper within or near LMCS length?
- Does the PDF satisfy LMCS style, font, abstract, author, bibliography, and artifact requirements?
