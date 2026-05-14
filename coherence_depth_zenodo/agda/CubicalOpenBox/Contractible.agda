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

isContrPathPSingleton :
  (B : I → Type ℓ) →
  (b0 : B i0) →
  isContr (Σ[ b1 ∈ B i1 ] PathP B b0 b1)
isContrPathPSingleton = isContrSinglP

openExtIsContr :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  (B : OpenBox side base) →
  isContr (OpenExt side base B)
openExtIsContr side base B =
  canonicalOpenExt side base B ,
  λ e →
    sym (isContrSingl (outS base) .snd (canonicalOpenExt side base B))
    ∙ isContrSingl (outS base) .snd e

structuralOpenExtIsContr :
  (ob : StructuralOpenBox ℓ) →
  isContr (StructuralOpenExt ob)
structuralOpenExtIsContr ob =
  isContrPathPSingleton
    (λ _ → structuralA ob)
    (outS (structuralBase ob))

canonicalStructuralOpenExt :
  (ob : StructuralOpenBox ℓ) →
  StructuralOpenExt ob
canonicalStructuralOpenExt ob =
  structuralOpenExtIsContr ob .fst

canonicalStructuralOpenExtContracts :
  (ob : StructuralOpenBox ℓ) →
  (e : StructuralOpenExt ob) →
  canonicalStructuralOpenExt ob ≡ e
canonicalStructuralOpenExtContracts ob e =
  structuralOpenExtIsContr ob .snd e

canonicalOpenExtContracts :
  {A : Type ℓ} {φ : I} →
  (side : I → Partial φ A) →
  (base : A [ φ ↦ side i0 ]) →
  (B : OpenBox side base) →
  (e : OpenExt side base B) →
  canonicalOpenExt side base B ≡ e
canonicalOpenExtContracts side base B e =
  openExtIsContr side base B .snd e
