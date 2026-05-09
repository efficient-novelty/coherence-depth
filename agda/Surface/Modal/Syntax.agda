{-# OPTIONS --cubical --safe --guardedness #-}

module Surface.Modal.Syntax where

open import Cubical.Foundations.Prelude

record OldU : Type₁ where
  constructor mkOldU
  field
    U     : Type
    El    : U → Type
    Arr   : U → U → U
    ElArr : (A B : U) → El (Arr A B) ≡ (El A → El B)

open OldU public

record ModPayload : Type₁ where
  constructor mkModPayload
  field
    Flat : Type → Type
    eta  : (A : Type) → A → Flat A

open ModPayload public

record ModTrace (L : OldU) (P : ModPayload) : Type₁ where
  constructor mkModTrace
  field
    FlatU         : OldU.U L → OldU.U L
    flat-El       : (A : OldU.U L) →
      OldU.El L (FlatU A) ≡ ModPayload.Flat P (OldU.El L A)
    flat-code-Arr : (A B : OldU.U L) →
      FlatU (OldU.Arr L A B) ≡ OldU.Arr L (FlatU A) (FlatU B)
    flat-Arr      : (A B : OldU.U L) →
      ModPayload.Flat P (OldU.El L A → OldU.El L B)
        ≡ (ModPayload.Flat P (OldU.El L A) → ModPayload.Flat P (OldU.El L B))

open ModTrace public

data HornPresentation : Type where
  synthesized explicit : HornPresentation

record ModalDecl : Type₁ where
  constructor mkModalDecl
  field
    oldInterface     : OldU
    payload          : ModPayload
    trace            : ModTrace oldInterface payload
    hornPresentation : HornPresentation

open ModalDecl public

minimalModalDecl :
  (L : OldU) →
  (P : ModPayload) →
  ModTrace L P →
  ModalDecl
minimalModalDecl L P T =
  mkModalDecl L P T synthesized

explicitHornModalDecl :
  (L : OldU) →
  (P : ModPayload) →
  ModTrace L P →
  ModalDecl
explicitHornModalDecl L P T =
  mkModalDecl L P T explicit
