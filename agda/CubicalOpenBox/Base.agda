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
-- is a Sub element.
record OpenBox {ℓ : Level} {A : Type ℓ} {φ : I}
  (side : I → Partial φ A)
  (base : A [ φ ↦ side i0 ]) : Type ℓ where
  constructor mkOpenBox

open OpenBox public

record StructuralOpenBox (ℓ : Level) : SSet (ℓ-suc ℓ) where
  constructor mkStructuralOpenBox
  field
    structuralA    : Type ℓ
    structuralPhi  : I
    structuralSide :
      I → Partial structuralPhi structuralA
    structuralBase :
      structuralA [ structuralPhi ↦ structuralSide i0 ]

open StructuralOpenBox public

structuralOpenBoxAsOpenBox :
  (ob : StructuralOpenBox ℓ) →
  OpenBox (structuralSide ob) (structuralBase ob)
structuralOpenBoxAsOpenBox ob = mkOpenBox

structuralBoundaryFamily :
  (ob : StructuralOpenBox ℓ) →
  I → SSet ℓ
structuralBoundaryFamily ob i =
  structuralA ob [ structuralPhi ob ↦ structuralSide ob i ]

structuralLid :
  (ob : StructuralOpenBox ℓ) →
  SSet ℓ
structuralLid ob = structuralBoundaryFamily ob i1

structuralBaseFace :
  (ob : StructuralOpenBox ℓ) →
  SSet ℓ
structuralBaseFace ob = structuralBoundaryFamily ob i0

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

BoundaryFamily :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  OpenBox side base →
  I → SSet ℓ
BoundaryFamily {A = A} {φ = φ} side base B i =
  A [ φ ↦ side i ]

CompatibleBoundaryFamily :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  OpenBox side base →
  I → SSet ℓ
CompatibleBoundaryFamily = BoundaryFamily

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

CompatibleLid :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  OpenBox side base →
  SSet ℓ
CompatibleLid side base B =
  CompatibleBoundaryFamily side base B i1

CompatibleBaseFace :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  OpenBox side base →
  SSet ℓ
CompatibleBaseFace side base B =
  CompatibleBoundaryFamily side base B i0
