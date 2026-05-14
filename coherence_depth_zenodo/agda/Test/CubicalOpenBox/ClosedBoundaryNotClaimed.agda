{-# OPTIONS --cubical --safe --guardedness #-}

module Test.CubicalOpenBox.ClosedBoundaryNotClaimed where

open import Cubical.Foundations.Prelude

open import CaseStudies.Common using (Unit; tt)
open import CubicalOpenBox.Base
open import CubicalOpenBox.Contractible

record ClosedBoundaryFiller (A : Type) : Type₁ where
  constructor mkClosedBoundaryFiller
  field
    boundary : I → I → A
    filler   : I → I → A

open ClosedBoundaryFiller public

unitClosedBoundary : ClosedBoundaryFiller Unit
unitClosedBoundary =
  mkClosedBoundaryFiller (λ _ _ → tt) (λ _ _ → tt)

-- There is intentionally no map from ClosedBoundaryFiller to openExtIsContr.
-- Closed-boundary filler spaces are outside the theorem-facing API.
closed-boundary-not-routed-through-openExt :
  ClosedBoundaryFiller Unit → ClosedBoundaryFiller Unit
closed-boundary-not-routed-through-openExt C = C
