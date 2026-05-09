{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.HornElaboration where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

open import CubicalOpenBox.Base
open import CubicalOpenBox.Extension
open import Metatheory.RawStructuralSyntax
open import Metatheory.StructuralBoundary
open import Metatheory.HornOpenBox
open import Metatheory.DerivedTrace

private
  variable
    ℓ : Level

record HornElaborationInput
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ) : SSet (lsuc ℓ) where
  constructor mkHornElaborationInput
  field
    hornPackage : HornOpenBoxPackage Γlower f
    elaboratedFieldTy : Type ℓ
    elaboratedReplacementTerm : elaboratedFieldTy
    usesOnlyLowerAndKanTy : Type ℓ
    usesOnlyLowerAndKan : usesOnlyLowerAndKanTy
    elaboratedReplacementSoundTy : Type ℓ
    elaboratedReplacementSound : elaboratedReplacementSoundTy
    decodedCanonicalCenter : elaboratedFieldTy
    replacementComputedFromCenter :
      elaboratedReplacementTerm ≡ decodedCanonicalCenter

open HornElaborationInput public

structuralHornElaboration :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  HornElaborationInput Γlower f →
  HornSemanticDerivation Γlower f
structuralHornElaboration input =
  let package = hornPackage input
      boundary = hornBoundary package
      ob = hornOpenBox package
      d =
        mkDerivedTrace
          (elaboratedFieldTy input)
          (lowerPublicBoundary boundary)
          (elaboratedReplacementTerm input)
          (usesOnlyLowerAndKanTy input)
          (elaboratedReplacementSoundTy input)
  in
  mkHornSemanticDerivation
    (boundaryIsHornClause boundary)
    (lowerPublicBoundary boundary)
    ob
    (hornPackageOpenExt package)
    d
    (canonicalOpenExt
      (structuralSide ob)
      (structuralBase ob)
      (structuralOpenBoxAsOpenBox ob))
    (decodedCanonicalCenter input)
    (replacementComputedFromCenter input)
    (usesOnlyLowerAndKan input)
    (elaboratedReplacementSound input)
