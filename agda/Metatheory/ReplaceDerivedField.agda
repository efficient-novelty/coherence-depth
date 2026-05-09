{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.ReplaceDerivedField where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

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
    forgetPrimitiveField : Type ℓ
    insertReplacementTerm : Type ℓ
    roundTripForward : Type ℓ
    roundTripBackward : Type ℓ

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
    (replacementSound d)
    (usesOnlyLower d)
