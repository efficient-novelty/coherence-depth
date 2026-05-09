{-# OPTIONS --cubical --safe --guardedness #-}

module Test.CubicalOpenBox.FlatArrHorn where

open import Cubical.Foundations.Prelude

open import CaseStudies.Common using (Unit; tt)
open import CubicalOpenBox.Base
open import CubicalOpenBox.Extension
open import CubicalOpenBox.Contractible

flatArrBoundary : I → Partial i1 Unit
flatArrBoundary i = λ _ → tt

flatArrBase : Unit [ i1 ↦ flatArrBoundary i0 ]
flatArrBase = inS tt

flatArrOpenBox : OpenBox flatArrBoundary flatArrBase
flatArrOpenBox = mkOpenBox

flatArrCanonicalExtension : OpenExt flatArrBoundary flatArrBase flatArrOpenBox
flatArrCanonicalExtension =
  canonicalOpenExt flatArrBoundary flatArrBase flatArrOpenBox

flatArrOpenExtContractible : isContr (OpenExt flatArrBoundary flatArrBase flatArrOpenBox)
flatArrOpenExtContractible =
  openExtIsContr flatArrBoundary flatArrBase flatArrOpenBox
