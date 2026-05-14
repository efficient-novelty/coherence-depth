{-# OPTIONS --cubical --safe --guardedness #-}

module CubicalOpenBox.FaceSystem where

open import Cubical.Foundations.Prelude

open import Core.Nat renaming (ℕ to Nat)
open import Metatheory.Obligations using (Fin)
open import CubicalOpenBox.Base

private
  variable
    ℓ : Level
    A : Type ℓ
    φ : I

record CompiledFaceSystem (A : Type ℓ) : SSet (ℓ-suc ℓ) where
  constructor mkCompiledFaceSystem
  field
    compiledPhi  : I
    compiledSide : I → Partial compiledPhi A

open CompiledFaceSystem public

-- A finite side-system records the visible faces and their overlap
-- obligations, together with the compiled Partial boundary used by the
-- checked open-box API. The disjunction/overlap compilation is part of the
-- structural-boundary adequacy package, not an untracked prose convention.
record FaceSystem (m : Nat) (A : Type ℓ) : SSet (ℓ-suc ℓ) where
  constructor mkFaceSystem
  field
    face : Fin m → I
    body : (s : Fin m) → I → Partial (face s) A
    overlapLaws : Type ℓ
    compiledBoundary : CompiledFaceSystem A
    compiledAgreesWithFaces : Type ℓ

open FaceSystem public

compileFaceSystem :
  {m : Nat} →
  FaceSystem m A →
  CompiledFaceSystem A
compileFaceSystem = compiledBoundary

compiledFaceSystemOpenBox :
  {m : Nat} →
  (fs : FaceSystem m A) →
  (base :
    A [ compiledPhi (compileFaceSystem fs)
      ↦ compiledSide (compileFaceSystem fs) i0 ]) →
  OpenBox (compiledSide (compileFaceSystem fs)) base
compiledFaceSystemOpenBox fs base = mkOpenBox
