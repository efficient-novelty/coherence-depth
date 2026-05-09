{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.StructuralHornShape where

open import Cubical.Foundations.Prelude

open import Core.Nat renaming (ℕ to Nat)
open import CubicalOpenBox.Base

private
  variable
    ℓ : Level
    A : Type ℓ
    φ : I

record StructuralHornShape {A : Type ℓ} {φ : I}
  (u : I → Partial φ A)
  (u0 : A [ φ ↦ u i0 ]) : Type ℓ where
  constructor mkStructuralHornShape
  field
    hornDepth : Nat
    openBox   : OpenBox u u0

open StructuralHornShape public

structuralHornOpenBox :
  {A : Type ℓ} {φ : I}
  {u : I → Partial φ A}
  {u0 : A [ φ ↦ u i0 ]} →
  StructuralHornShape u u0 →
  OpenBox u u0
structuralHornOpenBox = openBox
