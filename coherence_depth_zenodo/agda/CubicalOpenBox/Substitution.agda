{-# OPTIONS --cubical --safe --guardedness #-}

module CubicalOpenBox.Substitution where

open import Cubical.Foundations.Prelude

open import CubicalOpenBox.Base
open import CubicalOpenBox.Extension
open import CubicalOpenBox.Contractible

private
  variable
    ℓ ℓ' : Level
    A : Type ℓ
    B₁ : Type ℓ'
    φ ψ : I

-- Cubical Agda does not expose raw CwF substitutions as first-class syntax.
-- The mechanized API therefore records the parametric reindexing data used by
-- structural horn shapes and checks that centers and contractions commute with
-- that reindexing.
record OpenBoxReindexing
  {A : Type ℓ} {B₁ : Type ℓ'} {φ ψ : I}
  {u : I → Partial φ A}
  {u0 : A [ φ ↦ u i0 ]}
  {v : I → Partial ψ B₁}
  {v0 : B₁ [ ψ ↦ v i0 ]}
  (source : OpenBox u u0)
  (target : OpenBox v v0) : Type (ℓ-max ℓ ℓ') where
  constructor mkOpenBoxReindexing
  field
    reindexLid     : Lid u u0 source → Lid v v0 target
    reindexOpenExt : OpenExt u u0 source → OpenExt v v0 target
    reindexCenter  :
      reindexOpenExt (canonicalOpenExt u u0 source) ≡
      canonicalOpenExt v v0 target
    reindexContraction :
      (e : OpenExt u u0 source) →
      reindexOpenExt (canonicalOpenExt u u0 source) ≡ reindexOpenExt e

open OpenBoxReindexing public

center-natural-under-reindexing :
  {A : Type ℓ} {B₁ : Type ℓ'} {φ ψ : I}
  {u : I → Partial φ A}
  {u0 : A [ φ ↦ u i0 ]}
  {v : I → Partial ψ B₁}
  {v0 : B₁ [ ψ ↦ v i0 ]}
  {source : OpenBox u u0} {target : OpenBox v v0} →
  (ρ : OpenBoxReindexing source target) →
  reindexOpenExt ρ (canonicalOpenExt u u0 source) ≡
  canonicalOpenExt v v0 target
center-natural-under-reindexing ρ = reindexCenter ρ
