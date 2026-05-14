{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.StructuralHornDecoding where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

open import CubicalOpenBox.Base
open import CubicalOpenBox.Extension
open import CubicalOpenBox.Contractible
open import Metatheory.RawStructuralSyntax
open import Metatheory.RawStructuralTyping
open import Metatheory.StructuralBoundary
open import Metatheory.HornOpenBox
open import Metatheory.HornElaboration

private
  variable
    ℓ : Level

-- First-class constructor data for the sealing-generated higher structural
-- horn cases.  The raw grammar has one higher structural clause shape,
-- `horn b`; the sealing grammar generates three semantic cases.  Each case
-- carries the cubical open-box data needed to decode that generated horn.
record HigherHornOpenBoxData (ℓ : Level) : SSet (lsuc ℓ) where
  constructor mkHigherHornOpenBoxData
  field
    hornCarrier : Type ℓ
    hornVisibleFace : I
    hornSideBoundary : I → Partial hornVisibleFace hornCarrier
    hornCompatibleBaseFace :
      hornCarrier [ hornVisibleFace ↦ hornSideBoundary i0 ]
    hornCompatibleLids : Type ℓ
    hornCompatibleLidPoint :
      hornCompatibleLids → hornCarrier
    hornCompatibleLidsBoundaryWitness : Type ℓ
    hornCompatibleLidsBoundaryWitnessProof :
      hornCompatibleLidsBoundaryWitness
    hornSideEquations : Type ℓ
    hornSideEquationsProof : hornSideEquations
    hornEndpointLaws : Type ℓ
    hornEndpointLawsProof : hornEndpointLaws
    hornSubstitutionStability : Type ℓ
    hornSubstitutionStabilityProof : hornSubstitutionStability
    hornLowerUnaryAndBinaryFaces : Type ℓ
    hornLowerUnaryAndBinaryFacesAvailable :
      hornLowerUnaryAndBinaryFaces
    hornDegenerateFaces : Type ℓ
    hornDegenerateFacesAvailable : hornDegenerateFaces
    hornTransportedFaces : Type ℓ
    hornTransportedFacesAvailable : hornTransportedFaces
    hornPackageMatch : Type ℓ
    hornPackageMatchProof : hornPackageMatch
    hornDecodedCenterType : Type ℓ
    hornDecodedCenterTerm : hornDecodedCenterType

open HigherHornOpenBoxData public

structuralOpenBoxFromHigherHornData :
  HigherHornOpenBoxData ℓ →
  StructuralOpenBox ℓ
structuralOpenBoxFromHigherHornData d =
  mkStructuralOpenBox
    (hornCarrier d)
    (hornVisibleFace d)
    (hornSideBoundary d)
    (hornCompatibleBaseFace d)
    (hornCompatibleLids d)
    (hornCompatibleLidPoint d)
    (hornCompatibleLidsBoundaryWitness d)
    (hornCompatibleLidsBoundaryWitnessProof d)
    (hornSideEquations d)
    (hornSideEquationsProof d)
    (hornEndpointLaws d)
    (hornEndpointLawsProof d)
    (hornSubstitutionStability d)
    (hornSubstitutionStabilityProof d)

data SealingGeneratedHigherHorn
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (b : RawBoundary ℓ) : SSet (lsuc ℓ) where
  remoteComparisonGenerated :
    PackagedHornBoundary b →
    HigherHornOpenBoxData ℓ →
    SealingGeneratedHigherHorn Γlower b
  degenerateGenerated :
    PackagedHornBoundary b →
    HigherHornOpenBoxData ℓ →
    SealingGeneratedHigherHorn Γlower b
  transportedGenerated :
    PackagedHornBoundary b →
    HigherHornOpenBoxData ℓ →
    SealingGeneratedHigherHorn Γlower b

generatedHigherHornMode :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {b : RawBoundary ℓ} →
  SealingGeneratedHigherHorn Γlower b →
  HornElaborationMode
generatedHigherHornMode (remoteComparisonGenerated package d) =
  remote-comparison-horn
generatedHigherHornMode (degenerateGenerated package d) =
  degenerate-horn
generatedHigherHornMode (transportedGenerated package d) =
  transported-horn

generatedHigherHornPackage :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {b : RawBoundary ℓ} →
  SealingGeneratedHigherHorn Γlower b →
  PackagedHornBoundary b
generatedHigherHornPackage (remoteComparisonGenerated package d) =
  package
generatedHigherHornPackage (degenerateGenerated package d) =
  package
generatedHigherHornPackage (transportedGenerated package d) =
  package

generatedHigherHornData :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {b : RawBoundary ℓ} →
  SealingGeneratedHigherHorn Γlower b →
  HigherHornOpenBoxData ℓ
generatedHigherHornData (remoteComparisonGenerated package d) =
  d
generatedHigherHornData (degenerateGenerated package d) =
  d
generatedHigherHornData (transportedGenerated package d) =
  d

decodeRemoteComparisonHornOpenBox :
  {b : RawBoundary ℓ} →
  PackagedHornBoundary b →
  HigherHornOpenBoxData ℓ →
  StructuralOpenBox ℓ
decodeRemoteComparisonHornOpenBox package d =
  structuralOpenBoxFromHigherHornData d

decodeDegenerateHornOpenBox :
  {b : RawBoundary ℓ} →
  PackagedHornBoundary b →
  HigherHornOpenBoxData ℓ →
  StructuralOpenBox ℓ
decodeDegenerateHornOpenBox package d =
  structuralOpenBoxFromHigherHornData d

decodeTransportedHornOpenBox :
  {b : RawBoundary ℓ} →
  PackagedHornBoundary b →
  HigherHornOpenBoxData ℓ →
  StructuralOpenBox ℓ
decodeTransportedHornOpenBox package d =
  structuralOpenBoxFromHigherHornData d

decodeGeneratedHigherHornOpenBox :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {b : RawBoundary ℓ} →
  SealingGeneratedHigherHorn Γlower b →
  StructuralOpenBox ℓ
decodeGeneratedHigherHornOpenBox
  (remoteComparisonGenerated package d) =
  decodeRemoteComparisonHornOpenBox package d
decodeGeneratedHigherHornOpenBox
  (degenerateGenerated package d) =
  decodeDegenerateHornOpenBox package d
decodeGeneratedHigherHornOpenBox
  (transportedGenerated package d) =
  decodeTransportedHornOpenBox package d

decodeGeneratedHigherHornBoundary :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {b : RawBoundary ℓ} →
  SealingGeneratedHigherHorn Γlower b →
  StructuralBoundary Γlower (horn b)
decodeGeneratedHigherHornBoundary H =
  let d = generatedHigherHornData H in
  mkStructuralBoundary
    refl
    (hornLowerUnaryAndBinaryFaces d)
    (hornLowerUnaryAndBinaryFaces d)
    (hornSideEquations d)
    (hornSubstitutionStability d)

decodeGeneratedHigherHornPackage :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {b : RawBoundary ℓ} →
  (H : SealingGeneratedHigherHorn Γlower b) →
  HornOpenBoxPackage Γlower (horn b)
decodeGeneratedHigherHornPackage H =
  identityHornPackageOpenExt
    (decodeGeneratedHigherHornBoundary H)
    (decodeGeneratedHigherHornOpenBox H)

decodeGeneratedHigherHornCubicalData :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {b : RawBoundary ℓ} →
  (H : SealingGeneratedHigherHorn Γlower b) →
  StructuralHornCubicalData (decodeGeneratedHigherHornPackage H)
decodeGeneratedHigherHornCubicalData H =
  let d = generatedHigherHornData H
      ob = decodeGeneratedHigherHornOpenBox H
  in
  mkStructuralHornCubicalData
    (generatedHigherHornMode H)
    (hornCarrier d)
    (hornVisibleFace d)
    (hornSideBoundary d)
    (hornLowerUnaryAndBinaryFaces d)
    (hornLowerUnaryAndBinaryFacesAvailable d)
    (hornSideEquations d)
    (hornSideEquationsProof d)
    (hornDegenerateFaces d)
    (hornDegenerateFacesAvailable d)
    (hornTransportedFaces d)
    (hornTransportedFacesAvailable d)
    (hornCompatibleBaseFace d)
    ob
    (hornPackageMatch d)
    (hornPackageMatchProof d)
    (canonicalOpenExt
      (structuralSide ob)
      (structuralBase ob)
      (structuralOpenBoxAsOpenBox ob))
    (canonicalStructuralOpenExt ob)
    (structuralOpenExtIsContr ob)
    (hornDecodedCenterType d)
    (hornDecodedCenterTerm d)
    (hornEndpointLaws d)
    (hornEndpointLawsProof d)
    (hornSubstitutionStability d)
    (hornSubstitutionStabilityProof d)

decodeGeneratedHigherHornContractible :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {b : RawBoundary ℓ} →
  (H : SealingGeneratedHigherHorn Γlower b) →
  isContr (StructuralOpenExt (decodeGeneratedHigherHornOpenBox H))
decodeGeneratedHigherHornContractible H =
  structuralOpenExtIsContr (decodeGeneratedHigherHornOpenBox H)
