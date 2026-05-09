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

-- A filler is the underlying path from the base face to a freely chosen lid.
-- The visible partial boundary and Sub base are explicit parameters; Cubical
-- Agda's hcomp/hfill typing checks that the canonical inhabitant respects
-- those boundary data.
Filler :
  {A : Type ℓ} {φ : I} →
  (u : I → Partial φ A) →
  (u0 : A [ φ ↦ u i0 ]) →
  (B : OpenBox u u0) →
  Lid u u0 B →
  Type ℓ
Filler u u0 B lid = outS u0 ≡ lid

OpenExt :
  {A : Type ℓ} {φ : I} →
  (u : I → Partial φ A) →
  (u0 : A [ φ ↦ u i0 ]) →
  OpenBox u u0 →
  Type ℓ
OpenExt u u0 B = Σ (Lid u u0 B) (Filler u u0 B)

canonicalLid :
  {A : Type ℓ} {φ : I} →
  (u : I → Partial φ A) →
  (u0 : A [ φ ↦ u i0 ]) →
  (B : OpenBox u u0) →
  Lid u u0 B
canonicalLid u u0 B = hcomp u (outS u0)

canonicalFill :
  {A : Type ℓ} {φ : I} →
  (u : I → Partial φ A) →
  (u0 : A [ φ ↦ u i0 ]) →
  (B : OpenBox u u0) →
  Filler u u0 B (canonicalLid u u0 B)
canonicalFill u u0 B i = hfill u u0 i

canonicalOpenExt :
  {A : Type ℓ} {φ : I} →
  (u : I → Partial φ A) →
  (u0 : A [ φ ↦ u i0 ]) →
  (B : OpenBox u u0) →
  OpenExt u u0 B
canonicalOpenExt u u0 B = canonicalLid u u0 B , canonicalFill u u0 B

openExtFillAt :
  {A : Type ℓ} {φ : I} →
  (u : I → Partial φ A) →
  (u0 : A [ φ ↦ u i0 ]) →
  (B : OpenBox u u0) →
  (e : OpenExt u u0 B) →
  I → A
openExtFillAt u u0 B e i = e .snd i
