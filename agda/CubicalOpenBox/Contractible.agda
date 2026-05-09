{-# OPTIONS --cubical --safe --guardedness #-}

module CubicalOpenBox.Contractible where

open import Cubical.Foundations.Prelude

open import CubicalOpenBox.Base
open import CubicalOpenBox.Extension

private
  variable
    ℓ : Level
    A : Type ℓ
    φ : I

openExtIsContr :
  {A : Type ℓ} {φ : I} →
  (u : I → Partial φ A) →
  (u0 : A [ φ ↦ u i0 ]) →
  (B : OpenBox u u0) →
  isContr (OpenExt u u0 B)
openExtIsContr u u0 B =
  canonicalOpenExt u u0 B ,
  λ e →
    sym (isContrSingl (outS u0) .snd (canonicalOpenExt u u0 B))
    ∙ isContrSingl (outS u0) .snd e

canonicalOpenExtContracts :
  {A : Type ℓ} {φ : I} →
  (u : I → Partial φ A) →
  (u0 : A [ φ ↦ u i0 ]) →
  (B : OpenBox u u0) →
  (e : OpenExt u u0 B) →
  canonicalOpenExt u u0 B ≡ e
canonicalOpenExtContracts u u0 B e =
  openExtIsContr u u0 B .snd e
