{-# OPTIONS --cubical --safe --guardedness #-}

module CubicalOpenBox.Center where

open import Cubical.Foundations.Prelude

open import CubicalOpenBox.Base
open import CubicalOpenBox.Extension

private
  variable
    ℓ : Level
    A : Type ℓ
    φ : I

openExtCenter :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  (B : OpenBox side base) →
  OpenExt side base B
openExtCenter = canonicalOpenExt

openExtCenterEndpointLaws :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  (B : OpenBox side base) →
  FillerEndpointLaws side base (hfill side base) (canonicalLid side base B)
openExtCenterEndpointLaws = canonicalEndpointLaws
