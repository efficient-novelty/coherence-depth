# Paper Improvement Plan for LMCS Submission

**Paper:** `1_coherence_depth_LMCS.pdf` / `paper/1_coherence_depth.tex`  
**Repository:** `efficient-novelty/coherence-depth`  
**Target:** LMCS submission with versioned Zenodo artifact  
**Purpose:** Turn the seven critical review issues into concrete paper and artifact revisions.

## Executive Summary

The paper is plausibly in scope for LMCS, but the current submission risk is that referees may read the main theorem as a definitional consequence of a bespoke calculus rather than as a checkable theorem with a nontrivial proof chain. The revision should therefore make three things completely explicit:

1. **The fixed calculus.** Define the syntax, obligations, public signatures, and depth-indexed realizations in a way that a reader can inspect without reverse-engineering the artifact.
2. **The non-tautological theorem path.** Show that higher sealing-generated structural obligations are decoded into explicit open-box total-extension objects, whose contractibility yields constructed derived-trace witnesses and replacement terms.
3. **The mechanization boundary.** Say exactly which claims are fully mechanized, which are mechanized for an abstract interface, which are conditional on adequacy, and which remain paper-only.

The revised contribution should be presented as:

> For the fixed cubical sealed-extension calculus `C_ext`, unary trace is insufficient, binary trace is necessary, and every sealing-generated higher **structural** obligation is derivable from lower public boundary data via cubical open-box total-extension contractibility. Hence exact realized structural obligation objects stabilize at binary trace, and normalized minimal public signatures contain no primitive structural trace field above binary arity.

This plan focuses only on the seven critical issues identified in the assessment. Recurrence/accounting, LMCS style, PDF font extraction, and Zenodo packaging are mentioned where they affect the seven issues, but they should be tracked separately in a final submission checklist.

---

## Revision North Star

A skeptical LMCS referee should be able to verify the following chain from the paper alone:

```text
fixed sealed-extension grammar
  -> generated structural-obligation judgment
  -> depth-indexed obligation signature ObSig_k(X)
  -> realization object Real_k(X)
  -> structural horn grammar for arity >= 3
  -> horn-to-open-box decoding
  -> total open-extension contractibility
  -> constructed DerivedTrace witnesses
  -> replacement/normalization theorem
  -> Real_k(X) ≃ Real_2(X) for k >= 2
  -> no primitive structural trace above binary arity in μ-minimal signatures

boolean/two-point swap obstruction
  -> unary/objectwise trace is insufficient
  -> exact structural integration depth is at least two
```

The most important editorial goal is to prevent this objection:

> “Is the depth-two theorem a mathematical consequence, or did the calculus define all higher obligations to be derived?”

The answer in the revised paper should be:

> The calculus generates higher structural obligations by a precise grammar. A structural induction decodes each generated higher obligation into an explicit cubical open-box total-extension object. Contractibility of that total object constructs a derived-trace witness and replacement term. Thus higher structural fields are not merely tagged as derived; their derivedness is proved for this fixed grammar.

---

## Proposed Revised Theorem Stack

Use this theorem stack as the organizing spine of the LMCS revision.

| Layer | Paper object | Status goal | Role |
|---|---|---:|---|
| 1 | Fixed sealed-extension calculus `C_ext` | Fully defined in paper | Prevents scope ambiguity |
| 2 | Generated structural-obligation judgment | Fully defined in paper | Determines what the theorem ranges over |
| 3 | `ObSig_k(X)`, `Real_k(X)`, restriction maps | Fully defined in paper | Gives the main equivalence a typed target |
| 4 | Unary/binary separation theorem | Paper proof + artifact witness | Proves depth one is insufficient |
| 5 | Structural horn grammar for arity `>= 3` | Fully defined in paper | Makes higher obligations inductive |
| 6 | Horn-to-open-box adequacy | Main proof theorem | Shows higher obligations have open-box form |
| 7 | Total open-extension contractibility | Paper proof + artifact theorem | Supplies canonical derived witnesses |
| 8 | DerivedTrace construction | Main proof theorem | Avoids derivedness-as-tag |
| 9 | Replacement/normalization theorem | Main proof theorem | Removes higher structural fields from minimal public signatures |
| 10 | Depth-two stabilization | Main theorem | Concludes `Real_k(X) ≃ Real_2(X)` for `k >= 2` |
| 11 | Mechanization map | Appendix/table | Makes artifact claims auditable |

---

## Critical Issue 1 — Fixed Calculus Is Too Schematic

### Reviewer Risk

A referee may not be able to tell whether the central theorem is about a formally defined calculus or about an informal family of intended calculi. Terms such as `Act`, `Cmp`, `Boundary_k`, “admissible,” “normalized public signature,” “realized obligation,” “structural trace,” “factorization-complete export,” and `Real_k` need explicit definitions before they are used in theorem statements.

### Revision Goal

Add a compact formal-core subsection that defines the fixed calculus and its generated obligation system before the main theorem is stated in its final form.

Recommended placement: immediately after the introductory scope section, or at the start of the first technical section.

Suggested section title:

```text
2. The Fixed Sealed-Extension Calculus C_ext
```

or, if Section 2 already exists:

```text
2.x. Formal Core of the Fixed Calculus
```

### Concrete Paper Edits

#### 1. Add a “calculus contract” box

Add a boxed paragraph early in the paper:

```text
Fixed-calculus contract. All theorems in Sections ... concern the calculus C_ext defined in this section. C_ext consists of:
(i) a cubical core with interval, cofibrations, transport, hcomp/hfill, and univalence;
(ii) raw sealed-extension declarations;
(iii) public-signature extraction;
(iv) a generated structural-obligation judgment;
(v) depth-indexed obligation signatures ObSig_k;
(vi) a normalization relation for public signatures;
(vii) a primitive/derived trace classification defined only after replacement witnesses are constructed.
No theorem in this paper asserts the depth-two result for arbitrary Cubical Agda developments or arbitrary cubical foundations without an adequacy package.
```

#### 2. Define the raw syntactic categories

Use a small grammar, not prose only. For example:

```text
Raw declarations    D ::= payload a:A | act α | cmp β | seal X.D | export f | ...
Trace fields        τ ::= Act(g) | Cmp(p) | Horn(H) | PayloadField(q)
Public signatures   Σ ::= · | Σ, f : T | Σ, τ : Trace(T)
Depths              k ::= 0 | 1 | 2 | ... | ∞
```

The exact grammar can use your actual names, but every later theorem should point back to it.

#### 3. Define the generated structural-obligation judgment

Introduce a judgment such as:

```text
Γ ; Σ_old ⊢ X ⇝ τ : Obl(n)
```

where:

- `Γ` is the ambient cubical context;
- `Σ_old` is the previously exported public signature;
- `X` is the sealed candidate/layer;
- `τ` is the generated obligation;
- `n` is the arity/depth of the obligation.

Then give constructors for:

```text
Act     : old generator/object -> Obl(1)
Cmp     : old comparison/path/equivalence -> Obl(2)
Horn    : compatible lower boundary -> Obl(n >= 3)
Payload : user-supplied data, explicitly not structural trace
```

Even if the artifact uses a different representation, the paper should expose this small judgment.

#### 4. Define admissibility in layers

Avoid one overloaded word “admissible.” Split it into at least:

```text
unary-admissible / pre-admissible_1
binary-admissible / admissible_2
fully admissible for C_ext
```

or define:

```text
Admissible_k(X) := Real_k(X) is inhabited and all required depth <= k obligations are satisfied.
Admissible(X)   := Admissible_∞(X), equivalently Admissible_2(X) after the main theorem.
```

Do not define `Admissible(X)` using the depth-two theorem before proving it.

#### 5. Define normalized public signatures

Give a relation:

```text
Σ ↝norm Σ'
```

or a function, if deterministic:

```text
normalize : PubSigRaw(X) -> PubSigNorm(X)
```

and specify:

- what gets erased;
- what gets replaced by a derived term;
- what remains primitive;
- whether normalization is unique, canonical, or unique only up to presentation equivalence.

### Suggested Formal Definition Block

```text
Definition (fixed sealed-extension calculus C_ext).
A C_ext-context consists of a cubical context Γ, an old normalized public signature Σ, and a sealed candidate X. The generated structural obligations of X over Σ are the least family of judgments

    Γ ; Σ ⊢ τ ∈ SObl_n(X)

closed under the constructors Act, Cmp, and Horn listed in Figure N, and stable under weakening, substitution, and public-signature presentation equivalence.

The arity n is the maximum public boundary dimension inspected by τ. Payload declarations are not members of SObl_n unless explicitly exported as structural integration trace.
```

### Artifact Alignment Tasks

- Ensure `paper-map.yaml` has one entry for the calculus definition and generated obligation grammar.
- Ensure the theorem index points to modules implementing or approximating:
  - raw structural syntax;
  - structural typing;
  - structural boundary;
  - horn decoding;
  - public-signature normalization.
- Where the artifact only models an abstract interface, mark the paper theorem as “mechanized for an abstract interface,” not “fully mechanized.”

### Acceptance Criteria

- A reader can find the exact formal object called `C_ext`.
- `Act`, `Cmp`, `Boundary_k`, public signatures, normalized signatures, and structural trace are defined before the main theorem.
- The paper distinguishes payload from structural trace in a definition, not only in prose.
- The theorem statement ranges over generated obligations of the displayed calculus.
- No proof step relies on an undefined phrase such as “by the fixed calculus” without citing a constructor or lemma.

---

## Critical Issue 2 — Make `Real_k ≃ Real_2` Non-Tautological

### Reviewer Risk

The theorem may look like this:

```text
higher obligations are non-primitive because the calculus classifies them as non-primitive.
```

To avoid this, derivedness must be a constructed theorem, and `Real_k` must be defined independently of the theorem that collapses it to `Real_2`.

### Revision Goal

Define `Real_k(X)` as an actual dependent object with named restriction maps and a constructed equivalence. Then prove the equivalence using horn decoding, total-extension contractibility, and replacement—not by definition.

### Concrete Paper Edits

#### 1. Define depth-indexed obligation signatures

Introduce:

```text
ObSig_k(X) := the public structural-obligation signature containing all generated structural obligations of arity <= k, together with their required boundary dependencies.
```

Make explicit whether `k = ∞` is allowed.

Suggested formalization:

```text
ObSig_k(X) = Σ_{τ generated by X} Include_k(arity(τ)) × Field(τ)
```

where:

```text
Include_k(n) := n <= k
```

and `Field(τ)` is the type of evidence required by obligation `τ`.

#### 2. Define the realization object

Use one of these forms, depending on the paper’s semantics:

```text
Real_k(X) := ⟦ ObSig_k(X) ⟧
```

or more explicitly:

```text
Real_k(X) := Π (τ : GeneratedObl(X)), arity(τ) <= k -> Evidence(τ)
```

For a record-style signature:

```text
Real_k(X) := Record_{τ ∈ GenObl(X), arity(τ) <= k} Evidence(τ)
```

Then say how this is interpreted cubically: as a type, dependent record, fibrant object, or semantic object.

#### 3. Name the maps

For `2 <= k <= l`, define restriction:

```text
res_{k,l} : Real_l(X) -> Real_k(X)
```

and for the theorem define extension/completion:

```text
ext_{2,k} : Real_2(X) -> Real_k(X)
```

where `ext_{2,k}` is built by structural recursion over higher obligations.

State the equivalence data:

```text
res_{2,k} ∘ ext_{2,k} = id
ext_{2,k} ∘ res_{2,k} ~ id
```

or the appropriate cubical path/equivalence.

#### 4. State the main theorem with construction named

Replace a high-level theorem statement with something like:

```text
Theorem (depth-two realization stabilization for C_ext).
For every C_ext-candidate X and every k >= 2, the restriction map

    res_{2,k} : Real_k(X) -> Real_2(X)

is an equivalence. Its inverse ext_{2,k} is constructed by induction on the generated structural obligations of arity > 2. In the higher structural case, the induction step decodes the obligation into an open-box total-extension object and uses its canonical center to supply the missing evidence.
```

This statement makes the theorem non-tautological because it names the inverse and proof method.

#### 5. Separate exact realized factors from primitive public fields

Define two layers:

```text
Exact realization layer: Real_k(X) includes higher factors as contractible components.
Public signature layer: μ-minimal normalized signatures omit higher structural fields because replacement witnesses exist.
```

Do not collapse these in prose. A higher exact factor may exist semantically even though it is not primitive public data.

### Suggested Lemma Sequence

Add a subsection “The depth-two collapse is not definitional” with lemmas:

```text
Lemma 1. Real_k is defined before primitive/derived normalization.
Lemma 2. For every generated higher structural obligation τ, Evidence(τ) is equivalent to OpenExt(decode τ).
Lemma 3. OpenExt(decode τ) is contractible.
Lemma 4. Adding a contractible higher structural factor does not change Real_2 up to equivalence.
Theorem. res_{2,k} is an equivalence for k >= 2.
```

### Artifact Alignment Tasks

- Add or update theorem-map entries for:
  - `Real_k` definition;
  - restriction maps;
  - extension maps;
  - equivalence proof;
  - contractible-factor elimination.
- Avoid artifact names that imply a result is “exact depth” if it only proves a wrapper theorem under an abstract interface. Use the status vocabulary consistently.

### Acceptance Criteria

- `Real_k(X)` is defined before the main theorem.
- The theorem is stated as equivalence of a named restriction map.
- The inverse/completion map is named and described constructively.
- Higher obligations are not excluded from `Real_k`; they are included and shown contractible/derivable.
- The proof does not rely on a primitive-cost function or derived-status tag as its sole justification.

---

## Critical Issue 3 — Open-Box Contractibility Needs a Sharper Statement

### Reviewer Risk

A cubical type theory referee will object if the paper appears to claim that arbitrary fixed-boundary filler spaces are contractible. That is false in general. The defensible theorem is about the **total extension object**: a compatible missing face/lid together with a filler/path.

### Revision Goal

State the open-box theorem as contractibility of a total extension package, not uniqueness of fillers for arbitrary fixed lids.

### Concrete Paper Edits

#### 1. Introduce an explicit open-box record

Add a definition similar to:

```text
record StructuralOpenBox where
  A      : I -> Type
  φ      : Cof
  u      : (i : I) -> Partial φ (A i)
  u0     : A i0 [ φ |-> u i0 ]
  Lid    : Type
  lidOk  : Lid -> Type
  Filler : (l : Lid) -> lidOk l -> Type
```

Then define:

```text
OpenExt(B) := Σ (l : Lid B), Σ (q : lidOk_B l), Filler_B(l,q)
```

or, if using endpoint subtypes:

```text
OpenExt(B) := Σ (l : A i1 [ φ |-> u i1 ]), PathP (λ i -> A i [ φ |-> u i ]) u0 l
```

The latter is the clearest shape for a path-singleton argument.

#### 2. State the contractibility theorem carefully

Use wording like:

```text
Theorem (total open-extension contractibility).
For every structural open box B generated by the sealing calculus, the total extension object OpenExt(B) is contractible.
```

Then add an explicit warning:

```text
This does not assert that for an externally fixed lid l, the type Filler_B(l) is contractible. The lid is part of the total object. Fixed-lid filler spaces may be empty or non-contractible outside the generated compatible case.
```

#### 3. Explain the path-singleton proof

Give the proof idea in a form a referee can inspect:

```text
OpenExt(B) is equivalent to a dependent path singleton. Its center is the canonical compatible lid obtained by cubical composition/hcomp at the remote face, together with the canonical filler/hfill. Any other total package consists of an endpoint and a path from the same base in the boundary-compatible family, hence contracts to the canonical package by the path-singleton principle.
```

Do not overstate uniqueness of all fillers.

#### 4. Connect to cubical operations

Clarify exactly where `hcomp` and `hfill` are used:

- `hcomp` supplies the canonical missing face/lid;
- `hfill` supplies the path/filler from the base to that lid;
- path-singleton contractibility shows total extension uniqueness.

If the artifact abstracts over these operations, say so.

### Suggested Ready-to-Paste Text

```text
The open-box theorem used below is a total-space statement. Given a generated structural open box B, the object OpenExt(B) packages both a compatible remote face and a filler from the base face to that remote face through the boundary-compatible family. We prove that OpenExt(B) is contractible. We do not claim that, for an arbitrary externally chosen remote face, the corresponding filler type is contractible. This distinction is essential: the sealing calculus uses the total package to replace higher structural trace fields, and the canonical package is computed by cubical composition and filling.
```

### Artifact Alignment Tasks

- Ensure the Agda module names and theorem names reflect “total extension” rather than “arbitrary filler uniqueness.”
- If `OpenExt` is currently modeled as a thin path-singleton abstraction, either:
  - strengthen it with explicit boundary geometry; or
  - state in the paper that the artifact checks the theorem-facing total-space abstraction and that explicit horn geometry is handled by the horn-decoding theorem/interface.
- Add a theorem-map note distinguishing total-extension contractibility from fixed-lid filler uniqueness.

### Acceptance Criteria

- The contractibility theorem quantifies over `OpenExt(B)`, not over arbitrary fixed-lid fillers.
- The lid/remote face is visibly part of the total type.
- The paper contains an explicit non-claim about arbitrary fixed-boundary filler uniqueness.
- The main theorem uses contractibility only after decoding higher obligations into total open-extension objects.

---

## Critical Issue 4 — Lower Bound Must Connect Precisely to `Real_1` vs `Real_2`

### Reviewer Risk

The lower-bound example may be mathematically compelling but fail to prove the exact theorem if the paper does not state which depth-indexed object it separates. The paper must show not merely that a swap example exists, but that it witnesses failure of unary trace to imply binary trace.

### Revision Goal

Turn the two-point/swap obstruction into a formal separation theorem between the unary fragment and the binary fragment.

### Concrete Paper Edits

#### 1. Define unary candidates separately

Introduce a term such as:

```text
UnaryCandidate(X) := objectwise action data satisfying all arity-1 obligations.
BinaryCoherent(X) := UnaryCandidate(X) plus arity-2 naturality/comparison trace.
```

or:

```text
PreAdmissible_1(X) := Real_1(X) is inhabited.
Admissible_2(X) := Real_2(X) is inhabited.
```

Do not call the bad example “admissible” if admissibility includes binary trace.

#### 2. State a formal lower-bound theorem

Use one of these forms.

Strong form:

```text
Theorem (binary lower bound).
There exists a sealed candidate X such that Real_1(X) is inhabited but Real_2(X) is empty. Therefore Real_1 does not determine Real_2, and structural integration depth is at least two.
```

If emptiness of all `Real_2` is too strong, use:

```text
Theorem (unary trace is not sufficient).
There exists unary/objectwise action data accepted by the arity-1 fragment whose binary naturality obligation along the univalent swap path is uninhabited. Hence no theorem Real_1(X) -> Real_2(X) is valid for C_ext.
```

Then explicitly conclude:

```text
Corollary. d_obl(C_ext) >= 2.
```

#### 3. Spell out the two-point calculation

Use a concise calculation:

```text
Let 2 be the two-point type with swap equivalence s : 2 ≃ 2, and let p := ua(s). For the family End(A) := A -> A, transport along p acts by conjugation:

    transport_End(p)(f) = s ∘ f ∘ s^{-1}.

The identity endomap is fixed. The constant-left endomap is transported to the constant-right endomap. Since constant-left and constant-right are distinct, the naturality square required by binary trace is uninhabited for the constant-left unary assignment.
```

If the proof uses booleans, name the two points and the contradiction:

```text
Assuming constant-left = constant-right, apply both sides to left; the equality would imply left = right, contradiction by boolean discreteness.
```

#### 4. Connect the obstruction to public paths

State why univalence matters:

```text
Without univalence, the swap equivalence need not be a public path in the old interface. In C_ext, univalence makes equivalences such as swap visible as path/comparison data, and binary trace must respect them.
```

#### 5. Avoid ambiguous wording

Replace phrases like:

```text
an admissible sealed extension fails binary trace
```

with:

```text
a unary-accepted candidate fails the binary sealing condition
```

or:

```text
an inhabitant of the unary fragment does not extend to an inhabitant of the binary fragment
```

### Artifact Alignment Tasks

- Ensure the lower-bound artifact theorem has a paper-map entry that describes whether it proves:
  - a concrete `Real_1` inhabited / `Real_2` empty theorem;
  - a unary-to-binary non-extension theorem;
  - a toy model witness only.
- If the artifact proves a toy counterexample rather than the exact paper theorem, classify it as “mechanized witness” or “mechanized for an abstract interface,” not as a full proof of every lower-bound formulation.

### Acceptance Criteria

- The lower bound explicitly separates arity-1 and arity-2 obligations.
- The theorem conclusion includes `d_obl >= 2` or an equivalent statement.
- The bad example is called unary-accepted/pre-admissible, not fully admissible.
- The calculation of transport along the univalent swap path is shown.
- The proof identifies the exact uninhabited binary naturality equation.

---

## Critical Issue 5 — Mechanization Claims Should Be Narrowed

### Reviewer Risk

The artifact may be read as proving more than it actually proves: for example, full semantic transfer to arbitrary Cubical Agda, arbitrary cubical foundations, or arbitrary HoTT developments. This creates a trust problem even if the fixed-calculus theorem is sound.

### Revision Goal

Add a precise mechanization boundary to the paper, matching the repository status vocabulary and theorem map.

### Concrete Paper Edits

#### 1. Add a mechanization-status table

Add a table in the main text or appendix:

| Claim | Paper theorem | Artifact status | Notes |
|---|---|---|---|
| Fixed raw grammar and structural obligations | Def./Thm. N | Fully mechanized / paper definition | Exact grammar or theorem-facing representation |
| `Real_k` stabilization for fixed calculus | Thm. N | Fully mechanized or interface-mechanized | Specify exact module/theorem |
| Open-box total-extension contractibility | Thm. N | Fully mechanized / abstract-interface | State whether explicit boundary geometry is present |
| Binary lower bound | Thm. N | Mechanized witness | State whether exact `Real_1`/`Real_2` separation is checked |
| Raw adequacy for SMod fragment | Thm. N | Concrete instance | Fragment-specific |
| Transfer to arbitrary Cubical Agda | — | Not formalized | Conditional/non-goal |
| Transfer to arbitrary cubical foundations | — | Conditional on adequacy | Not an unconditional theorem |
| Recurrence/accounting | Thm. N | Mechanized arithmetic / conditional hypotheses | Not ordinary library growth |

#### 2. Use a fixed status vocabulary

Use exactly these statuses everywhere:

```text
fully mechanized
mechanized for an abstract interface
conditional on adequacy
paper-only
not claimed
```

Do not use vague labels such as “checked,” “supported,” or “formalized” without a status.

#### 3. Add a trust-boundary paragraph near the contribution list

Suggested wording:

```text
The Agda development checks the theorem-facing fixed-calculus layer and several abstract semantic interfaces used by the paper. It does not provide a parser or elaborator theorem for arbitrary Cubical Agda source, nor a transfer theorem for all cubical calculi or arbitrary HoTT developments. Broader transfer statements are conditional on the displayed adequacy package. The theorem-to-artifact table records, for each paper theorem, whether the exact theorem is fully mechanized, mechanized for an abstract interface, conditional on adequacy, or paper-only.
```

#### 4. Ensure broad claims are conditional

Search the paper for phrases like:

```text
Cubical Agda proves...
all cubical foundations...
arbitrary HoTT developments...
the artifact proves the main theorem...
```

Replace with scoped statements:

```text
The artifact proves the theorem-facing fixed-calculus statement / proves the corresponding abstract-interface theorem / checks a concrete SMod adequacy instance.
```

#### 5. Clarify postulate/audit language

If the repository uses an audit that reports no local postulates in theorem-facing modules, state exactly:

```text
The audit checks the theorem-facing import closure named in paper-map.yaml. It is not a proof that every file in the broader development repository is postulate-free, nor that every external library theorem is free of trusted assumptions.
```

### Artifact Alignment Tasks

- Update `paper-map.yaml` so every theorem has one of the fixed status values.
- Update `docs/theorem_index.md` and trust-boundary docs to match the paper wording.
- Ensure the Zenodo artifact contains the theorem map, trust-boundary document, and exact check commands.
- If GitHub has no release yet, create a tagged release before Zenodo upload and deposit that release snapshot.

### Acceptance Criteria

- Every mechanization claim in the abstract, introduction, theorem table, and conclusion is status-qualified.
- No paragraph implies unconditional transfer to arbitrary Cubical Agda or arbitrary cubical foundations.
- The artifact table states which claims depend on `RawAdequacyPackage` or another interface.
- The paper and repository use the same status vocabulary.
- The theorem map is machine-checkable or at least systematically auditable.

---

## Critical Issue 6 — Recurrence Theorem Should Be Demoted or Heavily Qualified

### Reviewer Risk

The recurrence/accounting section can distract from the main theorem or look like an overbroad empirical/foundational claim. A referee may object that the Fibonacci-style recurrence depends on strong accounting conventions rather than on the core depth-two theorem alone.

### Revision Goal

Present recurrence as an optional conditional accounting corollary, not as the main contribution and not as a general law of library growth.

### Concrete Paper Edits

#### 1. Rename the section

Change a title like:

```text
Affine Recurrence
```

or

```text
Scaling Law
```

to something more explicitly conditional:

```text
Conditional Counting Consequences
```

or:

```text
Primitive Trace Accounting Under Full Coupling
```

#### 2. State all assumptions in the theorem name

Suggested theorem title:

```text
Theorem (primitive trace cost under factorization-complete export, full coupling, bundled per-site counting, and uniform payload).
```

This is verbose, but it prevents overclaim.

#### 3. Move most recurrence material out of the main proof path

Keep only:

- one definition of the accounting model;
- one theorem statement;
- one proof sketch or short proof;
- one paragraph explaining non-goals.

Move to appendix or artifact docs:

- multiple examples;
- sparse footprint variants;
- robustness discussions;
- detailed Fibonacci arithmetic;
- empirical-sounding interpretations.

#### 4. Add an explicit non-goal paragraph

Suggested wording:

```text
The recurrence is not a claim about ordinary transparent library growth, nor about all possible sealed extensions. It is an accounting corollary under the full-coupling and factorization-complete-export hypotheses stated above. Sparse footprints and user-supplied payload may fall outside this envelope or add independent costs.
```

#### 5. Check indexing and payload conventions

Audit all recurrence equations for:

- whether the recurrence is for `μ_n`, `μ_{n+1}`, or `Δμ_n`;
- whether the bootstrap terms include empty history;
- whether constant payload is counted per layer, per site, or per exported primitive;
- whether the “two-step” recurrence uses the same depth convention as the main theorem.

Create a small notation table:

| Symbol | Meaning | Counted? | Depends on |
|---|---|---|---|
| `μ_n` | Primitive public trace cost after layer `n` | yes | normalized signature |
| `p_n` | Payload size at layer `n` | yes/no depending on theorem | external data |
| `t_n` | Structural trace contribution | yes | previous active basis |
| `A_n` | Active basis size | yes | export policy |

#### 6. Separate recurrence from exact-depth theorem

In the main theorem section, avoid saying that the recurrence “follows from depth two” without assumptions. Use:

```text
Depth two bounds the primitive structural trace arity. A separate accounting model, under full-coupling and factorization-complete export, turns this arity bound into a two-step recurrence.
```

### Artifact Alignment Tasks

- Mark recurrence theorem-map entries as conditional on accounting hypotheses, even if arithmetic is mechanized.
- Name modules/theorems so they do not imply ordinary library growth.
- Add fixture names that distinguish sparse cases from full-coupling cases.

### Acceptance Criteria

- The recurrence is visibly downstream and optional.
- The theorem statement repeats the strong assumptions.
- The conclusion does not imply that ordinary transparent libraries grow Fibonacci-style.
- Indexing is consistent across statement, proof, examples, and artifact fixtures.
- The main theorem remains the depth-two coherence theorem, not the recurrence.

---

## Critical Issue 7 — Presentation Is Too Theorem-Dense Relative to Formal Detail

### Reviewer Risk

Many propositions and corollaries can make the paper look formal while still leaving the load-bearing definitions under-specified. Referees may feel they are being asked to trust theorem labels rather than follow the proof.

### Revision Goal

Reduce theorem-label density for definitional or rhetorical claims, and expand the few load-bearing theorems that actually prove the depth-two result.

### Concrete Paper Edits

#### 1. Classify every theorem-like statement

Create a temporary audit table during revision:

| Current label | Type | Keep as theorem? | Action |
|---|---|---:|---|
| Definition/projection | definitional | no | convert to definition/remark |
| “By construction” property | immediate lemma | maybe | combine with definition |
| Scope/non-goal statement | prose | no | convert to paragraph |
| Horn-to-open-box adequacy | load-bearing | yes | expand proof |
| OpenExt contractibility | load-bearing | yes | sharpen statement |
| DerivedTrace replacement | load-bearing | yes | expand proof |
| Binary lower bound | load-bearing | yes | expand proof |
| Depth-two theorem | main | yes | expand dependencies |
| Recurrence | conditional corollary | maybe | demote/shorten |

#### 2. Keep only high-value theorem labels

Target a smaller set of named results:

```text
Definition: C_ext
Definition: generated structural obligations
Definition: ObSig_k and Real_k
Theorem: binary lower bound
Theorem: horn-to-open-box adequacy
Theorem: total open-extension contractibility
Theorem: derived-trace replacement
Theorem: depth-two stabilization
Corollary: μ-minimal signatures have no primitive structural trace above arity 2
Conditional corollary: recurrence under full-coupling assumptions
```

Other results can be unnamed lemmas or proof paragraphs.

#### 3. Add one running example

Use a single example throughout the paper:

```text
old public interface with two-point type, swap path, and a small comparison family;
sealed operation X with objectwise action;
unary trace accepted;
binary trace obstruction for constant-left;
higher structural horn decoded into an open-box total extension;
higher field replaced by derived term.
```

This example should appear in:

- introduction;
- lower-bound section;
- horn/open-box explanation;
- final summary.

Do not introduce multiple partial examples unless they serve different theorems.

#### 4. Replace prose audits with diagrams and tables

Add a proof dependency diagram:

```text
Generated structural obligations
       |
       v
Structural horn grammar for arity >= 3
       |
       v
Horn-to-open-box decoding
       |
       v
OpenExt total contractibility
       |
       v
DerivedTrace witness construction
       |
       v
Replacement/normalization
       |
       v
Real_k ≃ Real_2 and μ-minimal arity bound
```

Add a theorem-to-artifact table rather than long prose claims.

#### 5. Strengthen proof sketches for load-bearing results

For each load-bearing theorem, require the proof to include:

- exact input data;
- exact constructed output;
- induction principle used, if any;
- where cubical operations enter;
- why dependencies are lower-arity only;
- artifact status;
- what would fail without the theorem.

#### 6. Cut or compress low-yield material

Candidates to compress:

- repeated scope disclaimers;
- multiple variants of the same “fixed calculus” warning;
- rhetorical terminology not used in theorem statements;
- detailed recurrence examples;
- long artifact instructions better kept in README/Zenodo docs;
- theorem labels for direct unpacking of definitions.

### Acceptance Criteria

- The main proof path is linear and visible.
- Every named theorem is either load-bearing or clearly useful.
- The paper contains fewer “by definition” propositions.
- The central definitions appear before the central theorem.
- The theorem-to-artifact map replaces broad mechanization prose.
- A reader can reconstruct the depth-two proof without opening the repository.

---

## Cross-Issue Implementation Plan

### Phase 1 — Claim Calibration and Formal Core

**Goal:** Make the object of study precise before changing deeper proofs.

Tasks:

1. Add the fixed-calculus contract paragraph.
2. Define `C_ext`, public signatures, structural trace, generated obligations, `ObSig_k`, and `Real_k`.
3. Split admissibility into unary/binary/full or depth-indexed variants.
4. Add the non-goals paragraph once, early.
5. Update the abstract and introduction to match the fixed-calculus scope.

Exit criteria:

- The main theorem can be stated using only previously defined symbols.
- The scope is clear by page 2.

### Phase 2 — Lower Bound and Upper Bound Core

**Goal:** Make exact depth two mathematically checkable.

Tasks:

1. Rewrite the lower-bound theorem as a `Real_1`/`Real_2` or unary/binary separation.
2. Add structural horn grammar and induction principle.
3. State horn-to-open-box adequacy with explicit open-box data.
4. State total open-extension contractibility with lid included in the total object.
5. Prove or outline `Real_k ≃ Real_2` using named `res` and `ext` maps.

Exit criteria:

- The upper bound does not rely on derivedness-by-tag.
- The lower bound directly implies depth at least two.

### Phase 3 — Derivedness and Normalization

**Goal:** Prove higher structural fields are removable from minimal public signatures.

Tasks:

1. Define raw trace fields before primitive/derived status.
2. Define `DerivedTrace(field)` as a witness object.
3. Prove derived witnesses for every generated higher structural field.
4. Define primitive cost `μ` only after replacement is available.
5. Prove μ-minimal signatures contain no primitive structural trace field above arity two.

Exit criteria:

- `μ` does not smuggle in the theorem conclusion.
- Higher fields are removed by replacement theorem, not by convention.

### Phase 4 — Mechanization Boundary and Artifact Map

**Goal:** Make artifact support trustworthy and precisely scoped.

Tasks:

1. Add theorem-to-artifact table.
2. Align paper statuses with `paper-map.yaml`.
3. State the trust boundary in the paper and README/Zenodo docs.
4. Identify all claims conditional on adequacy.
5. Ensure the Zenodo artifact points to a tagged release and exact check commands.

Exit criteria:

- Every major theorem has a status.
- No artifact claim overstates the formalization.

### Phase 5 — Presentation Simplification

**Goal:** Make the paper easier to referee.

Tasks:

1. Remove theorem labels from definitional statements.
2. Add dependency diagram.
3. Add one running example.
4. Demote recurrence to conditional corollary.
5. Cut repeated scope/prose and move artifact instructions to repository docs.

Exit criteria:

- The central theorem path is visible in one diagram/table.
- The paper reads as a focused LMCS submission rather than a broad research program.

---

## Suggested New Section Outline

```text
1. Introduction
   1.1 Motivation: payload vs public structural trace
   1.2 Main result for the fixed calculus
   1.3 Scope, non-goals, and mechanization boundary
   1.4 Related work

2. The Fixed Sealed-Extension Calculus C_ext
   2.1 Cubical core assumptions
   2.2 Raw sealed declarations and public signatures
   2.3 Generated structural obligations
   2.4 Depth-indexed signatures ObSig_k
   2.5 Realization objects Real_k and restriction maps

3. Binary Trace Is Necessary
   3.1 Unary candidates and binary coherence
   3.2 The two-point swap obstruction
   3.3 Corollary: depth at least two

4. Higher Structural Obligations as Open Boxes
   4.1 Structural horn grammar
   4.2 Horn-to-open-box decoding
   4.3 Total open-extension contractibility

5. Replacement and Depth-Two Stabilization
   5.1 DerivedTrace witnesses
   5.2 Replacement and normalization
   5.3 Equivalence Real_k(X) ≃ Real_2(X)
   5.4 μ-minimal signatures and primitive arity bound

6. Conditional Counting Consequences
   6.1 Full-coupling accounting assumptions
   6.2 Two-step recurrence under those assumptions
   6.3 Non-goals and sparse cases

7. Mechanization and Artifact Boundary
   7.1 Theorem-to-artifact table
   7.2 Adequacy interface and transfer limitations
   7.3 Zenodo artifact and reproducibility

8. Conclusion
```

If page budget is tight, Sections 6 and 7 can be shortened substantially, with detailed recurrence and artifact instructions moved to supplementary/Zenodo documentation.

---

## Ready-to-Paste Theorem/Definition Templates

### Definition: Generated Structural Obligations

```text
Definition (generated structural obligations).
For a normalized public signature Σ and sealed candidate X, the generated structural obligations are the least arity-indexed family

    Γ ; Σ ⊢ τ ∈ SObl_n(X)

closed under the constructors in Figure N and stable under substitution, weakening, and presentation equivalence of Σ. The arity n records the highest-dimensional public boundary data inspected by τ. Payload fields are not structural obligations unless explicitly exported as structural integration trace.
```

### Definition: Realization Objects

```text
Definition (depth-indexed realization).
Let ObSig_k(X) be the sub-signature of generated structural obligations of X whose arity is at most k. Its realization is

    Real_k(X) := ⟦ ObSig_k(X) ⟧.

For k <= l there is a restriction map res_{k,l} : Real_l(X) -> Real_k(X) obtained by forgetting evidence for obligations of arity greater than k.
```

### Theorem: Binary Lower Bound

```text
Theorem (binary lower bound).
There exists a unary-accepted sealed candidate X over the univalent two-point interface whose binary comparison obligation along the public swap path is uninhabited. Equivalently, the arity-one fragment does not determine the arity-two fragment. Hence the structural integration depth of C_ext is at least two.
```

### Theorem: Horn-to-Open-Box Adequacy

```text
Theorem (horn-to-open-box adequacy).
For every generated structural obligation τ ∈ SObl_n(X) with n >= 3, there is a structural open box B_τ, computed from the lower-arity public boundary data of τ, and an equivalence

    Evidence(τ) ≃ OpenExt(B_τ).

The construction is stable under substitution and public-signature presentation equivalence.
```

### Theorem: Total Open-Extension Contractibility

```text
Theorem (total open-extension contractibility).
For every generated structural open box B, the total extension object

    OpenExt(B) := Σ (compatible remote face), filler from the base face to that remote face

is contractible. This theorem does not assert contractibility of fillers for arbitrary externally fixed remote faces.
```

### Theorem: DerivedTrace Construction

```text
Theorem (higher structural fields are derived).
For every generated structural field τ of arity n >= 3, horn-to-open-box adequacy and total open-extension contractibility construct a DerivedTrace(τ) witness. The witness consists of lower boundary data, a replacement term, a typing proof, a semantic equality/equivalence proof, and a proof that only allowed lower-arity data are used.
```

### Main Theorem: Depth-Two Stabilization

```text
Theorem (exact structural depth two for C_ext).
For every sealed candidate X of C_ext and every k >= 2, the restriction map

    res_{2,k} : Real_k(X) -> Real_2(X)

is an equivalence. Its inverse is constructed by supplying, for every generated structural obligation of arity greater than two, the canonical total open-extension witness computed from its lower-arity boundary. Moreover, after replacement normalization, every μ-minimal public signature contains no primitive structural trace field of arity greater than two. The binary lower-bound theorem shows that the bound is exact.
```

---

## Theorem-to-Artifact Table Template

Add or adapt this table in the paper and keep it synchronized with `paper-map.yaml`.

| Paper claim | Label | Artifact module/theorem | Status | Trusted input / condition |
|---|---|---|---|---|
| Fixed raw sealed-extension grammar | Def. 2.x | `Metatheory.RawStructuralSyntax`, etc. | fully mechanized / paper definition | Cubical library |
| Structural obligation typing | Def./Lem. 2.x | `Metatheory.RawStructuralTyping` | fully mechanized / interface | fixed grammar |
| `Real_k` and restriction maps | Def. 2.x | `Semantics.DepthUpperBound`, etc. | mechanized for abstract interface | realization interface |
| Binary lower bound | Thm. 3.x | `Semantics.DepthLowerBound` / `Metatheory.AdjunctionBarrier` | mechanized witness | univalence/swap interface |
| Horn-to-open-box adequacy | Thm. 4.x | `Metatheory.HornOpenBox`, `StructuralHornDecoding` | fully mechanized or interface-mechanized | explicit status required |
| Total open-extension contractibility | Thm. 4.x | `CubicalOpenBox.Contractible` | fully mechanized / abstraction | total-space formulation |
| DerivedTrace replacement | Thm. 5.x | `Semantics.TraceNormalForm`, etc. | mechanized for abstract interface | replacement interface |
| Depth-two stabilization | Thm. 5.x | `Semantics.ExactDepth` | conditional/fully mechanized depending on exact theorem | adequacy package if used |
| Recurrence | Cor. 6.x | `Semantics.ScalingRecurrence`, etc. | conditional on accounting assumptions | full coupling, factorization-complete export |
| Transfer to arbitrary Cubical Agda | — | — | not claimed | requires future parser/elaborator theorem |

---

## Final Pre-Submission Readiness Questions for Issues 1–7

Before LMCS submission, the answer to each question should be “yes.”

1. **Fixed calculus:** Can a referee locate the complete definition of `C_ext` and the generated obligation judgment?
2. **Non-tautological depth theorem:** Is `Real_k(X)` defined independently of the theorem `Real_k(X) ≃ Real_2(X)`?
3. **Restriction equivalence:** Is the map `res_{2,k}` named, typed, and proved to be an equivalence with a constructed inverse?
4. **Open-box theorem:** Does the paper state contractibility only for the total extension object, with the lid included?
5. **Fixed-lid warning:** Does the paper explicitly avoid claiming uniqueness/contractibility of arbitrary fixed-lid filler spaces?
6. **Lower bound:** Does the swap example formally separate unary/objectwise trace from binary comparison trace?
7. **Admissibility wording:** Does the lower-bound example avoid calling a binary-failing object fully admissible?
8. **Mechanization boundary:** Does every artifact claim have one of the fixed statuses?
9. **Adequacy:** Are all broad transfer claims conditional on the stated adequacy package?
10. **Recurrence:** Is the recurrence visibly a conditional accounting corollary, not the main theorem?
11. **Theorem density:** Have definitional/rhetorical propositions been converted into definitions, remarks, or proof paragraphs?
12. **Main proof path:** Can the upper-bound proof be followed from grammar to horn decoding to total contractibility to replacement to depth-two equivalence?

---

## Minimal Revision Checklist

Use this as the working checklist for the next revision branch.

```text
[ ] Add fixed-calculus contract paragraph.
[ ] Define generated structural-obligation judgment.
[ ] Define ObSig_k(X), Real_k(X), and res_{k,l}.
[ ] Split unary/binary/full admissibility terminology.
[ ] Rewrite lower-bound theorem as Real_1 vs Real_2 or unary vs binary separation.
[ ] Add explicit structural open-box total-extension definition.
[ ] State total contractibility theorem with lid included.
[ ] Add fixed-lid non-contractibility/non-claim sentence.
[ ] Define DerivedTrace as a witness object.
[ ] Prove/describe replacement theorem before defining μ-minimal primitive status.
[ ] Restate main theorem as equivalence of res_{2,k} with constructed inverse.
[ ] Add theorem dependency diagram.
[ ] Add theorem-to-artifact status table.
[ ] Downgrade/qualify broad mechanization claims.
[ ] Demote recurrence to conditional accounting corollary.
[ ] Remove theorem labels from definitional or rhetorical statements.
[ ] Synchronize paper statuses with paper-map.yaml.
[ ] Freeze a tagged artifact release before Zenodo upload.
```

---

## Suggested Order of Edits

1. **Edit abstract/introduction last, but draft the new theorem statement first.** The theorem statement will determine the right abstract.
2. **Write the formal definitions of `C_ext`, generated obligations, `ObSig_k`, and `Real_k`.** This is the highest-leverage change.
3. **Rewrite the lower-bound section.** It is comparatively self-contained and will clarify depth terminology.
4. **Rewrite the open-box section.** Make the total-extension object explicit.
5. **Rewrite the replacement/depth-two proof.** Use the named maps `res` and `ext`.
6. **Update the mechanization table and artifact map.** Ensure every theorem has a status.
7. **Demote recurrence and compress presentation.** Do this after the core proof is stable.
8. **Return to the abstract/introduction/conclusion.** Make them exactly match the final scoped theorem.

---

## Expected Outcome

After these changes, the LMCS submission should present a tighter and more defensible contribution:

- a fixed, inspectable cubical sealed-extension calculus;
- a formal depth-indexed realization hierarchy;
- a genuine unary-vs-binary lower bound;
- a non-tautological upper bound via horn decoding and open-box total-extension contractibility;
- constructed derived-trace replacement rather than derivedness-by-declaration;
- honest artifact status and adequacy boundaries;
- recurrence material framed as conditional and downstream.

This revision should make the paper significantly easier to referee and reduce the chance that the main theorem is dismissed as a definitional artifact of the chosen calculus.
