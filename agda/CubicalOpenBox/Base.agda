{-# OPTIONS --cubical --safe --guardedness #-}

module CubicalOpenBox.Base where

open import Cubical.Foundations.Prelude

private
  variable
    ℓ : Level
    A : Type ℓ
    φ : I

-- The theorem-facing open box used by the paper.  The visible faces are
-- represented by the actual Cubical Agda partial element interface, and the
-- base face is a Sub element.  The cubical data live as indices because
-- `Partial` and `Sub` inhabit Agda's strict `SSet` universe.
record OpenBox {ℓ : Level} {A : Type ℓ} {φ : I}
  (u : I → Partial φ A)
  (u0 : A [ φ ↦ u i0 ]) : Type ℓ where
  constructor mkOpenBox

open OpenBox public

OpenBoxFamily :
  {A : Type ℓ} {φ : I} →
  (u : I → Partial φ A) →
  (u0 : A [ φ ↦ u i0 ]) →
  OpenBox u u0 →
  I → Type ℓ
OpenBoxFamily {A = A} u u0 B i = A

Lid :
  {A : Type ℓ} {φ : I} →
  (u : I → Partial φ A) →
  (u0 : A [ φ ↦ u i0 ]) →
  OpenBox u u0 →
  Type ℓ
Lid u u0 B = OpenBoxFamily u u0 B i1

BaseFace :
  {A : Type ℓ} {φ : I} →
  (u : I → Partial φ A) →
  (u0 : A [ φ ↦ u i0 ]) →
  OpenBox u u0 →
  Type ℓ
BaseFace u u0 B = OpenBoxFamily u u0 B i0
