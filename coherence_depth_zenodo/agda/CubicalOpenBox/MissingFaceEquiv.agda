{-# OPTIONS --cubical --safe --guardedness #-}

module CubicalOpenBox.MissingFaceEquiv where

open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism using (Iso)

open import CubicalOpenBox.Base
open import CubicalOpenBox.Extension

private
  variable
    ℓ : Level
    A : Type ℓ
    φ : I

-- The structural grammar supplies the real missing-face package. At the
-- theorem-facing open-box layer, this module records the identity instance
-- used by structural horn modules after they have compiled their package into
-- the OpenExt representation.
missingFacePackageOpenExtIso :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  (B : OpenBox side base) →
  Iso (OpenExt side base B) (OpenExt side base B)
missingFacePackageOpenExtIso side base B = record
  { fun = λ e → e
  ; inv = λ e → e
  ; rightInv = λ e → refl
  ; leftInv = λ e → refl
  }
