{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.StructuralHornToOpenBox where

open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism using (Iso)

open import CubicalOpenBox.Base
open import CubicalOpenBox.Extension
open import CubicalOpenBox.Contractible
open import CubicalOpenBox.Substitution
open import Metatheory.StructuralHornShape

private
  variable
    ℓ : Level
    A : Type ℓ
    φ : I

structuralHornToOpenBox :
  {A : Type ℓ} {φ : I}
  {u : I → Partial φ A}
  {u0 : A [ φ ↦ u i0 ]} →
  StructuralHornShape u u0 →
  OpenBox u u0
structuralHornToOpenBox = structuralHornOpenBox

structuralHornPackageIsoOpenExt :
  {A : Type ℓ} {φ : I}
  {u : I → Partial φ A}
  {u0 : A [ φ ↦ u i0 ]} →
  (H : StructuralHornShape u u0) →
  Iso (OpenExt u u0 (structuralHornToOpenBox H)) (OpenExt u u0 (openBox H))
structuralHornPackageIsoOpenExt H = record
  { fun = λ e → e
  ; inv = λ e → e
  ; rightInv = λ e → refl
  ; leftInv = λ e → refl
  }

structuralHornExtensionIsContr :
  {A : Type ℓ} {φ : I}
  {u : I → Partial φ A}
  {u0 : A [ φ ↦ u i0 ]} →
  (H : StructuralHornShape u u0) →
  isContr (OpenExt u u0 (structuralHornToOpenBox H))
structuralHornExtensionIsContr H =
  openExtIsContr _ _ (structuralHornToOpenBox H)

structuralHornExtensionNaturality :
  {A : Type ℓ} {B : Type ℓ} {φ ψ : I}
  {u : I → Partial φ A}
  {u0 : A [ φ ↦ u i0 ]}
  {v : I → Partial ψ B}
  {v0 : B [ ψ ↦ v i0 ]}
  {source : StructuralHornShape u u0} {target : StructuralHornShape v v0} →
  OpenBoxReindexing (openBox source) (openBox target) →
  OpenBoxReindexing (openBox source) (openBox target)
structuralHornExtensionNaturality ρ = ρ
