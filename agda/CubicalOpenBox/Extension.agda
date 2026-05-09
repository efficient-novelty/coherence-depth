{-# OPTIONS --cubical --safe --guardedness #-}

module CubicalOpenBox.Extension where

open import Cubical.Foundations.Prelude
open import Cubical.Data.Sigma.Base using (Σ; _,_)

open import CubicalOpenBox.Base

private
  variable
    ℓ : Level
    A : Type ℓ
    φ : I

-- The checked homogeneous filler is the path produced by hfill. The visible
-- Partial boundary and Sub base are explicit parameters; the endpoint laws
-- below make the agreement obligations inspectable.
Filler :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  (B : OpenBox side base) →
  Lid side base B →
  Type ℓ
Filler side base B lid = outS base ≡ lid

record FillerEndpointLaws
  {A : Type ℓ} {φ : I}
  (side : I → Partial φ A)
  (base : A [ φ ↦ side i0 ])
  (fill : I → A)
  (lid : A) : Type ℓ where
  constructor mkFillerEndpointLaws
  field
    startsAtBase : fill i0 ≡ outS base
    endsAtLid : fill i1 ≡ lid

open FillerEndpointLaws public

OpenExt :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  OpenBox side base →
  Type ℓ
OpenExt side base B = Σ (Lid side base B) (Filler side base B)

canonicalLid :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  (B : OpenBox side base) →
  Lid side base B
canonicalLid side base B = hcomp side (outS base)

canonicalFillSub :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  (B : OpenBox side base) →
  (i : I) →
  CompatibleBoundaryFamily side base B i
canonicalFillSub side base B i =
  inS (hfill side base i)

canonicalFill :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  (B : OpenBox side base) →
  Filler side base B (canonicalLid side base B)
canonicalFill side base B i = hfill side base i

canonicalEndpointLaws :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  (B : OpenBox side base) →
  FillerEndpointLaws side base
    (hfill side base)
    (canonicalLid side base B)
canonicalEndpointLaws side base B =
  mkFillerEndpointLaws refl refl

canonicalOpenExt :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  (B : OpenBox side base) →
  OpenExt side base B
canonicalOpenExt side base B = canonicalLid side base B , canonicalFill side base B

openExtFillAt :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  (B : OpenBox side base) →
  (e : OpenExt side base B) →
  I → A
openExtFillAt side base B e i = e .snd i
