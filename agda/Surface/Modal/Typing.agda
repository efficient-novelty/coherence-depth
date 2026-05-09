{-# OPTIONS --cubical --safe --guardedness #-}

module Surface.Modal.Typing where

open import Cubical.Foundations.Prelude

open import Surface.Modal.Syntax
open import Surface.Modal.Routes

record PayloadWellTyped (P : ModPayload) : Type₁ where
  constructor mkPayloadWellTyped
  field
    flatField : Type → Type
    etaField  : (A : Type) → A → flatField A

payload-well-typed : (P : ModPayload) → PayloadWellTyped P
payload-well-typed P =
  mkPayloadWellTyped (ModPayload.Flat P) (ModPayload.eta P)

record TraceWellTyped (L : OldU) (P : ModPayload) (T : ModTrace L P) : Type₁ where
  constructor mkTraceWellTyped
  field
    flatU-field         : OldU.U L → OldU.U L
    flat-El-field       : (A : OldU.U L) →
      OldU.El L (flatU-field A) ≡ ModPayload.Flat P (OldU.El L A)
    flat-code-Arr-field : (A B : OldU.U L) →
      flatU-field (OldU.Arr L A B) ≡ OldU.Arr L (flatU-field A) (flatU-field B)
    flat-Arr-field      : (A B : OldU.U L) →
      ModPayload.Flat P (OldU.El L A → OldU.El L B)
        ≡ (ModPayload.Flat P (OldU.El L A) → ModPayload.Flat P (OldU.El L B))

trace-well-typed :
  (L : OldU) →
  (P : ModPayload) →
  (T : ModTrace L P) →
  TraceWellTyped L P T
trace-well-typed L P T =
  mkTraceWellTyped
    (ModTrace.FlatU T)
    (ModTrace.flat-El T)
    (ModTrace.flat-code-Arr T)
    (ModTrace.flat-Arr T)

DerivedHornWellTyped :
  (L : OldU) →
  (P : ModPayload) →
  ModTrace L P →
  Type₁
DerivedHornWellTyped = ExplicitHornField

record ModalDeclWellTyped (E : ModalDecl) : Type₁ where
  constructor mkModalDeclWellTyped
  field
    payloadTyped : PayloadWellTyped (payload E)
    traceTyped   : TraceWellTyped (oldInterface E) (payload E) (trace E)

modal-decl-well-typed : (E : ModalDecl) → ModalDeclWellTyped E
modal-decl-well-typed E =
  mkModalDeclWellTyped
    (payload-well-typed (payload E))
    (trace-well-typed (oldInterface E) (payload E) (trace E))
