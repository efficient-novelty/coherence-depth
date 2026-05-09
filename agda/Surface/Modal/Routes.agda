{-# OPTIONS --cubical --safe --guardedness #-}

module Surface.Modal.Routes where

open import Cubical.Foundations.Prelude

open import Surface.Modal.Syntax

leftRoute :
  (L : OldU) →
  (P : ModPayload) →
  (T : ModTrace L P) →
  (A B : OldU.U L) →
  OldU.El L (ModTrace.FlatU T (OldU.Arr L A B))
    ≡ (ModPayload.Flat P (OldU.El L A) → ModPayload.Flat P (OldU.El L B))
leftRoute L P T A B =
  ModTrace.flat-El T (OldU.Arr L A B)
  ∙ cong (ModPayload.Flat P) (OldU.ElArr L A B)
  ∙ ModTrace.flat-Arr T A B

rightRoute :
  (L : OldU) →
  (P : ModPayload) →
  (T : ModTrace L P) →
  (A B : OldU.U L) →
  OldU.El L (ModTrace.FlatU T (OldU.Arr L A B))
    ≡ (ModPayload.Flat P (OldU.El L A) → ModPayload.Flat P (OldU.El L B))
rightRoute L P T A B =
  cong (OldU.El L) (ModTrace.flat-code-Arr T A B)
  ∙ OldU.ElArr L (ModTrace.FlatU T A) (ModTrace.FlatU T B)
  ∙ cong₂ (λ X Y → X → Y)
      (ModTrace.flat-El T A)
      (ModTrace.flat-El T B)

ArrHornType :
  (L : OldU) →
  (P : ModPayload) →
  (T : ModTrace L P) →
  (A B : OldU.U L) →
  Type₁
ArrHornType L P T A B =
  leftRoute L P T A B ≡ rightRoute L P T A B

ExplicitHornField :
  (L : OldU) →
  (P : ModPayload) →
  ModTrace L P →
  Type₁
ExplicitHornField L P T =
  (A B : OldU.U L) → ArrHornType L P T A B
