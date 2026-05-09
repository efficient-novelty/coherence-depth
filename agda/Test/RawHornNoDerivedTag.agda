{-# OPTIONS --cubical --safe --guardedness #-}

module Test.RawHornNoDerivedTag where

open import Agda.Primitive using (lzero)
open import Cubical.Foundations.Prelude

open import Metatheory.RawStructuralSyntax
open import Metatheory.RawStructuralTyping

raw-horn-records-shape-not-derivedness :
  (b : RawBoundary lzero) →
  rawStructuralClauseKind (horn b) ≡ horn-kind
raw-horn-records-shape-not-derivedness b = refl

typed-horn-records-shape-not-derivedness :
  (b : RawBoundary lzero) →
  (package : PackagedHornBoundary b) →
  typed-role-clause-kind (horn-boundary-role b package) ≡ horn-kind
typed-horn-records-shape-not-derivedness b package = refl
