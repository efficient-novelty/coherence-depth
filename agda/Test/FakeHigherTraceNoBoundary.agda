{-# OPTIONS --cubical --safe --guardedness #-}

module Test.FakeHigherTraceNoBoundary where

open import Agda.Primitive using (lzero)
open import Cubical.Foundations.Prelude

open import Core.Nat renaming (ℕ to Nat)
open import Core.Sequence using ([]; _∷_)
open import Metatheory.Obligations
  using (HistoricalSupport; mkSupport; fzero; fsuc)
open import Metatheory.RawStructuralSyntax
open import CaseStudies.Common using (Unit)

one two three : Nat
one = suc zero
two = suc one
three = suc two

fakeHighArityTraceSupport : HistoricalSupport three
fakeHighArityTraceSupport =
  mkSupport three
    (fzero ∷ fsuc fzero ∷ fsuc (fsuc fzero) ∷ [])

-- This is deliberately only a raw trace-shaped field. It is not a
-- RawStructuralClause, so it is outside the domain of StructuralBoundary and
-- cannot be promoted to a derived horn by a raw tag.
fakeHighArityTraceField : RawTraceField lzero
fakeHighArityTraceField =
  mkRawTraceField
    horn-role
    three
    fakeHighArityTraceSupport
    Unit
    Unit

fake-high-arity-trace-records-role-only :
  rawTraceRole fakeHighArityTraceField ≡ horn-role
fake-high-arity-trace-records-role-only = refl

fake-high-arity-trace-has-no-structural-clause-kind :
  rawTraceArity fakeHighArityTraceField ≡ three
fake-high-arity-trace-has-no-structural-clause-kind = refl
