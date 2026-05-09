{-# OPTIONS --cubical --safe --guardedness #-}

module CubicalOpenBox.Base where

open import Cubical.Foundations.Prelude

private
  variable
    ℓ : Level
    A : Type ℓ
    φ : I

-- The theorem-facing open box used by the paper. The visible faces are
-- represented by the actual Cubical Agda Partial interface, and the base face
-- is a Sub element. Cubical Agda keeps Partial/Sub in the strict SSet universe,
-- so the side and base data live as indices rather than record fields.
record OpenBox {ℓ : Level} {A : Type ℓ} {φ : I}
  (side : I → Partial φ A)
  (base : A [ φ ↦ side i0 ]) : Type ℓ where
  constructor mkOpenBox

open OpenBox public

StructuralOpenBox :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  Type ℓ
StructuralOpenBox = OpenBox

openBoxSide :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  OpenBox side base →
  I → Partial φ A
openBoxSide side base B = side

openBoxBase :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  OpenBox side base →
  A [ φ ↦ side i0 ]
openBoxBase side base B = base

OpenBoxFamily :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  OpenBox side base →
  I → Type ℓ
OpenBoxFamily {A = A} side base B i = A

Lid :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  OpenBox side base →
  Type ℓ
Lid side base B = OpenBoxFamily side base B i1

BaseFace :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  OpenBox side base →
  Type ℓ
BaseFace side base B = OpenBoxFamily side base B i0
