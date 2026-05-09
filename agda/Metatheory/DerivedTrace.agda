{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.DerivedTrace where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism using (Iso)

open import CubicalOpenBox.Base
open import CubicalOpenBox.Extension
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

record IrreducibleTrace
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ) : Type (lsuc ℓ) where
  constructor mkIrreducibleTrace
  field
    irreducibleCarrier : Type ℓ
    irreducibilityProof : Type ℓ

open IrreducibleTrace public

data PublicStatus
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ) : Type (lsuc ℓ) where
  primitiveStatus :
    IrreducibleTrace Γlower f →
    PublicStatus Γlower f
  derivedStatus :
    DerivedTrace Γlower f →
    PublicStatus Γlower f

record NormalizedPublicField
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ) : Type (lsuc ℓ) where
  constructor mkNormalizedPublicField
  field
    checkedPublicStatus : PublicStatus Γlower f

open NormalizedPublicField public

record HornSemanticDerivation
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ) : SSet (lsuc ℓ) where
  constructor mkHornSemanticDerivation
  field
    isHornClause : rawStructuralClauseKind f ≡ horn-kind
    boundaryAvailable : Type ℓ
    semanticOpenBox : StructuralOpenBox ℓ
    packageOpenExtEquiv :
      Iso
        (OpenExt
          (structuralSide semanticOpenBox)
          (structuralBase semanticOpenBox)
          (structuralOpenBoxAsOpenBox semanticOpenBox))
        (OpenExt
          (structuralSide semanticOpenBox)
          (structuralBase semanticOpenBox)
          (structuralOpenBoxAsOpenBox semanticOpenBox))
    derivedTrace : DerivedTrace Γlower f
    openBoxCenter :
      OpenExt
        (structuralSide semanticOpenBox)
        (structuralBase semanticOpenBox)
        (structuralOpenBoxAsOpenBox semanticOpenBox)
    decodedCenter : fieldTy derivedTrace
    replacementFromCenter :
      replacementTerm derivedTrace ≡ decodedCenter
    usesLowerBoundaryAndKan :
      usesOnlyLower derivedTrace
    replacementSoundFromOpenBox :
      replacementSound derivedTrace

open HornSemanticDerivation public

hornDerivedTrace :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  HornSemanticDerivation Γlower f →
  DerivedTrace Γlower f
hornDerivedTrace = derivedTrace
