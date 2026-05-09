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

data HornElaborationMode : Type where
  remote-comparison-horn degenerate-horn transported-horn :
    HornElaborationMode

-- The bridge from a raw structural horn to a cubical open box is explicit
-- data, not a tag on the raw syntax.  Each case records the family, visible
-- cofibration, side system, overlap evidence, compatible base, canonical
-- center, decoding target, and the substitution-stability proof obligation.
record StructuralHornCubicalData
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ}
  (package : HornOpenBoxPackage Γlower f) : SSet (lsuc ℓ) where
  constructor mkStructuralHornCubicalData
  field
    elaborationMode : HornElaborationMode
    cubicalFamily : Type ℓ
    visibleFace : I
    sideBoundary : I → Partial visibleFace cubicalFamily
    lowerUnaryAndBinaryFaces : Type ℓ
    lowerUnaryAndBinaryFacesAvailable : lowerUnaryAndBinaryFaces
    sideOverlapLaws : Type ℓ
    sideOverlapsFromLowerTrace : sideOverlapLaws
    degenerateFaces : Type ℓ
    degenerateFacesAvailable : degenerateFaces
    transportedFaces : Type ℓ
    transportedFacesAvailable : transportedFaces
    compatibleBaseFace :
      cubicalFamily [ visibleFace ↦ sideBoundary i0 ]
    formedOpenBox : StructuralOpenBox ℓ
    formedOpenBoxMatchesPackage : Type ℓ
    formedOpenBoxMatchesPackageProof :
      formedOpenBoxMatchesPackage
    computedCanonicalCenter :
      OpenExt
        (structuralSide formedOpenBox)
        (structuralBase formedOpenBox)
        (structuralOpenBoxAsOpenBox formedOpenBox)
    decodedCenterType : Type ℓ
    decodedCenterTerm : decodedCenterType
    sideEndpointTransportEquations : Type ℓ
    sideEndpointTransportEquationsHold :
      sideEndpointTransportEquations
    substitutionStableDerivedness : Type ℓ
    substitutionStableDerivednessProof :
      substitutionStableDerivedness

open StructuralHornCubicalData public

record HornElaborationInput
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ) : SSet (lsuc ℓ) where
  constructor mkHornElaborationInput
  field
    hornPackage : HornOpenBoxPackage Γlower f
    hornCubicalData :
      StructuralHornCubicalData hornPackage
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

remoteComparisonHornElaboration :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  (input : HornElaborationInput Γlower f) →
  elaborationMode (hornCubicalData input) ≡ remote-comparison-horn →
  HornSemanticDerivation Γlower f
remoteComparisonHornElaboration input modeProof =
  structuralHornElaboration input

degenerateHornElaboration :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  (input : HornElaborationInput Γlower f) →
  elaborationMode (hornCubicalData input) ≡ degenerate-horn →
  HornSemanticDerivation Γlower f
degenerateHornElaboration input modeProof =
  structuralHornElaboration input

transportedHornElaboration :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  (input : HornElaborationInput Γlower f) →
  elaborationMode (hornCubicalData input) ≡ transported-horn →
  HornSemanticDerivation Γlower f
transportedHornElaboration input modeProof =
  structuralHornElaboration input

hornElaborationSubstitutionStable :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  (input : HornElaborationInput Γlower f) →
  substitutionStableDerivedness (hornCubicalData input)
hornElaborationSubstitutionStable input =
  substitutionStableDerivednessProof (hornCubicalData input)
