{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.DerivedTrace where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

open import Metatheory.RawStructuralSyntax

private
  variable
    ℓ : Level

-- A derived trace field is not a raw tag. It is a witness containing the
-- replacement object and the proof obligations saying that the replacement is
-- supported by lower public data and is sound for the field being replaced.
record DerivedTrace
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ) : Type (lsuc ℓ) where
  constructor mkDerivedTrace
  field
    fieldTy : Type ℓ
    lowerBoundary : Type ℓ
    replacementTerm : fieldTy
    usesOnlyLower : Type ℓ
    replacementSound : Type ℓ

open DerivedTrace public

record HornSemanticDerivation
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ) : Type (lsuc ℓ) where
  constructor mkHornSemanticDerivation
  field
    isHornClause : rawStructuralClauseKind f ≡ horn-kind
    boundaryAvailable : Type ℓ
    derivedTrace : DerivedTrace Γlower f

open HornSemanticDerivation public

hornDerivedTrace :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  HornSemanticDerivation Γlower f →
  DerivedTrace Γlower f
hornDerivedTrace = derivedTrace
