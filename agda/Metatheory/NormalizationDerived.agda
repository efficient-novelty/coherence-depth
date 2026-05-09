{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.NormalizationDerived where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

open import Metatheory.RawStructuralSyntax
open import Metatheory.DerivedTrace
open import Metatheory.ReplaceDerivedField

private
  variable
    ℓ : Level

record HigherStructuralDerivedStep
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ) : SSet (lsuc ℓ) where
  constructor mkHigherStructuralDerivedStep
  field
    hornDerivation : HornSemanticDerivation Γlower f
    replacement : DerivedFieldReplacement Γlower f
      (hornDerivedTrace hornDerivation)

open HigherStructuralDerivedStep public

higherStructuralTraceDerivedByTheorem :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  HornSemanticDerivation Γlower f →
  HigherStructuralDerivedStep Γlower f
higherStructuralTraceDerivedByTheorem derivation =
  mkHigherStructuralDerivedStep
    derivation
    (replaceDerivedField (hornDerivedTrace derivation))
