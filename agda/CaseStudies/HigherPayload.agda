{-# OPTIONS --cubical --safe --guardedness #-}

module CaseStudies.HigherPayload where

open import Cubical.Foundations.Prelude
open import Agda.Primitive using (lzero)

open import Core.Nat renaming (ℕ to Nat)
open import Metatheory.RawStructuralSyntax
open import Metatheory.RawStructuralTyping
open import CaseStudies.Common

higher-hit-constructor : AlgebraicPayloadField lzero
higher-hit-constructor =
  mkAlgebraicPayloadField
    one
    Unit
    three
    higherUserOperation

higher-payload-classification :
  AlgebraicFieldClassification higher-hit-constructor
higher-payload-classification =
  algebraic-field-is-payload-not-structural-trace higher-hit-constructor

higher-payload-not-structural-trace :
  AlgebraicNotStructuralTrace higher-hit-constructor
higher-payload-not-structural-trace =
  notStructuralTrace higher-payload-classification

higher-payload-summary : CaseStudySummary
higher-payload-summary =
  mkCaseStudySummary
    one
    zero
    zero
    zero
    zero
    zero
    Unit
    zero
    no-recurrence-law

higher-payload-zero-trace :
  expectedMuContribution higher-payload-summary ≡ zero
higher-payload-zero-trace = refl
