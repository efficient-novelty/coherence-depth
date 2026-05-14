{-# OPTIONS --cubical --safe --guardedness #-}

module Test.StructuralHornDecodingSmoke where

open import Agda.Primitive using (lzero)
open import Cubical.Foundations.Prelude

open import CaseStudies.Common using (Unit; tt; three)
open import Core.Nat using (zero)
open import Core.Sequence using ([]; _∷_)
open import Metatheory.Obligations
  using (Fin; fzero; fsuc; HistoricalSupport; mkSupport)
open import Metatheory.RawStructuralSyntax
open import Metatheory.RawStructuralTyping
open import CubicalOpenBox.Base
open import CubicalOpenBox.Extension
open import CubicalOpenBox.Contractible
open import Metatheory.HornOpenBox
open import Metatheory.HornElaboration
open import Metatheory.StructuralHornDecoding

emptyLowerTrace : RawTelescope (RawStructuralClause lzero)
emptyLowerTrace =
  mkRawTelescope zero (λ ())

site0 : Fin three
site0 = fzero

site1 : Fin three
site1 = fsuc fzero

site2 : Fin three
site2 = fsuc (fsuc fzero)

threeLayerSupport : HistoricalSupport three
threeLayerSupport =
  mkSupport three (site0 ∷ site1 ∷ site2 ∷ [])

smokeBoundary : RawBoundary lzero
smokeBoundary =
  mkRawBoundary three threeLayerSupport Unit Unit

smokePackage : PackagedHornBoundary smokeBoundary
smokePackage =
  mkPackagedHornBoundary refl

smokeSide : I → Partial i1 Unit
smokeSide i =
  λ _ → tt

smokeBase : Unit [ i1 ↦ smokeSide i0 ]
smokeBase =
  inS tt

smokeOpenBoxData : HigherHornOpenBoxData lzero
smokeOpenBoxData =
  mkHigherHornOpenBoxData
    Unit
    i1
    smokeSide
    smokeBase
    Unit
    (λ _ → tt)
    Unit
    tt
    Unit
    tt
    Unit
    tt
    Unit
    tt
    Unit
    tt
    Unit
    tt
    Unit
    tt
    Unit
    tt
    Unit
    tt

remoteGeneratedHorn :
  SealingGeneratedHigherHorn emptyLowerTrace smokeBoundary
remoteGeneratedHorn =
  remoteComparisonGenerated smokePackage smokeOpenBoxData

degenerateGeneratedHorn :
  SealingGeneratedHigherHorn emptyLowerTrace smokeBoundary
degenerateGeneratedHorn =
  degenerateGenerated smokePackage smokeOpenBoxData

transportedGeneratedHorn :
  SealingGeneratedHigherHorn emptyLowerTrace smokeBoundary
transportedGeneratedHorn =
  transportedGenerated smokePackage smokeOpenBoxData

remote-mode-smoke :
  generatedHigherHornMode remoteGeneratedHorn ≡ remote-comparison-horn
remote-mode-smoke = refl

degenerate-mode-smoke :
  generatedHigherHornMode degenerateGeneratedHorn ≡ degenerate-horn
degenerate-mode-smoke = refl

transported-mode-smoke :
  generatedHigherHornMode transportedGeneratedHorn ≡ transported-horn
transported-mode-smoke = refl

remote-open-box-smoke : StructuralOpenBox lzero
remote-open-box-smoke =
  decodeGeneratedHigherHornOpenBox remoteGeneratedHorn

degenerate-open-box-smoke : StructuralOpenBox lzero
degenerate-open-box-smoke =
  decodeGeneratedHigherHornOpenBox degenerateGeneratedHorn

transported-open-box-smoke : StructuralOpenBox lzero
transported-open-box-smoke =
  decodeGeneratedHigherHornOpenBox transportedGeneratedHorn

remote-package-smoke :
  HornOpenBoxPackage emptyLowerTrace (horn smokeBoundary)
remote-package-smoke =
  decodeGeneratedHigherHornPackage remoteGeneratedHorn

degenerate-cubical-data-smoke :
  StructuralHornCubicalData
    (decodeGeneratedHigherHornPackage degenerateGeneratedHorn)
degenerate-cubical-data-smoke =
  decodeGeneratedHigherHornCubicalData degenerateGeneratedHorn

transported-contractibility-smoke :
  isContr
    (StructuralOpenExt
      (decodeGeneratedHigherHornOpenBox transportedGeneratedHorn))
transported-contractibility-smoke =
  decodeGeneratedHigherHornContractible transportedGeneratedHorn
