{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.ReplaceDerivedField where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism using (Iso)

open import Metatheory.RawStructuralSyntax
open import Metatheory.DerivedTrace

private
  variable
    ℓ : Level

record DerivedFieldReplacement
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ)
  (d : DerivedTrace Γlower f) : Type (lsuc ℓ) where
  constructor mkDerivedFieldReplacement
  field
    primitivePresentation : Type ℓ
    derivedPresentation : Type ℓ
    forgetPrimitiveField :
      primitivePresentation → derivedPresentation
    insertReplacementTerm :
      derivedPresentation → primitivePresentation
    roundTripForward :
      (x : primitivePresentation) →
      insertReplacementTerm (forgetPrimitiveField x) ≡ x
    roundTripBackward :
      (y : derivedPresentation) →
      forgetPrimitiveField (insertReplacementTerm y) ≡ y
    presentationEquiv :
      Iso primitivePresentation derivedPresentation

open DerivedFieldReplacement public

replaceDerivedField :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  (d : DerivedTrace Γlower f) →
  DerivedFieldReplacement Γlower f d
replaceDerivedField d =
  mkDerivedFieldReplacement
    (fieldTy d)
    (fieldTy d)
    (λ x → x)
    (λ y → y)
    (λ x → refl)
    (λ y → refl)
    record
      { fun = λ x → x
      ; inv = λ y → y
      ; rightInv = λ y → refl
      ; leftInv = λ x → refl
      }
