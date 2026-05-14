{-# OPTIONS --cubical --safe --guardedness #-}

module Test.CubicalOpenBox.NaturalitySmoke where

open import Cubical.Foundations.Prelude

open import CaseStudies.Common using (Unit; tt)
open import CubicalOpenBox.Base
open import CubicalOpenBox.Extension
open import CubicalOpenBox.Contractible
open import CubicalOpenBox.Substitution

unitBoundary : I → Partial i1 Unit
unitBoundary i = λ _ → tt

unitBase : Unit [ i1 ↦ unitBoundary i0 ]
unitBase = inS tt

unitOpenBox : OpenBox unitBoundary unitBase
unitOpenBox = mkOpenBox

identityReindexing : OpenBoxReindexing unitOpenBox unitOpenBox
identityReindexing =
  mkOpenBoxReindexing
    (λ lid → lid)
    (λ e → e)
    refl
    (λ e → canonicalOpenExtContracts unitBoundary unitBase unitOpenBox e)

identityCenterNatural :
  reindexOpenExt identityReindexing
    (canonicalOpenExt unitBoundary unitBase unitOpenBox)
  ≡ canonicalOpenExt unitBoundary unitBase unitOpenBox
identityCenterNatural =
  center-natural-under-reindexing identityReindexing
