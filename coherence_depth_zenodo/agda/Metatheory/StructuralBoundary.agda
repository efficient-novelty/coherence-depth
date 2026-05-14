{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.StructuralBoundary where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

open import Metatheory.RawStructuralSyntax

private
  variable
    ℓ : Level

-- Boundary availability is separated from raw syntax. A raw horn clause can
-- be elaborated only after the fixed bridge supplies lower public boundary
-- data and proves that the boundary uses lower trace rather than the field
-- being derived.
record StructuralBoundary
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ) : Type (lsuc ℓ) where
  constructor mkStructuralBoundary
  field
    boundaryIsHornClause :
      rawStructuralClauseKind f ≡ horn-kind
    lowerPublicBoundary : Type ℓ
    boundaryUsesOnlyLower : Type ℓ
    sideOverlapEquations : Type ℓ
    substitutionStableBoundary : Type ℓ

open StructuralBoundary public
