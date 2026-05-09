{-# OPTIONS --cubical --safe --guardedness #-}

module Test.SemanticFixtureSmoke where

open import Cubical.Foundations.Prelude using (_≡_; refl)

open import Core.Nat using (zero)
open import Metatheory.Obligations using (costOf)
open import Metatheory.InterfaceCalculus
  using ( transparent-integration-latency
        ; transparent-definitions-have-zero-integration-latency
        )
open import Metatheory.SparseDependencyRecurrence
  using ( dependencyCount
        ; footprintCost
        ; sparse-next-latency
        ; transparentFootprint
        ; windowDepth
        )

open import CaseStudies.Common
open import CaseStudies.UniverseExtension
open import CaseStudies.GlobalModality
open import CaseStudies.PromotedInterface
open import CaseStudies.SparseDatatype
open import CaseStudies.HigherPayload

universe-fixture-full-coupling-smoke :
  recurrenceClassification universe-extension-summary ≡ full-coupling
universe-fixture-full-coupling-smoke = refl

global-modality-fixture-full-coupling-smoke :
  recurrenceClassification global-modality-summary ≡ full-coupling
global-modality-fixture-full-coupling-smoke = refl

promoted-interface-fixture-active-basis-smoke :
  recurrenceClassification promoted-interface-summary ≡ promoted-active-basis
promoted-interface-fixture-active-basis-smoke = refl

transparent-lemma-fixture-classification-smoke :
  recurrenceClassification transparent-lemma-summary ≡ transparent-zero
transparent-lemma-fixture-classification-smoke = refl

transparent-lemma-zero-mu-smoke :
  expectedMuContribution transparent-lemma-summary ≡ zero
transparent-lemma-zero-mu-smoke = refl

transparent-lemma-zero-footprint-count-smoke :
  dependencyCount (transparentFootprint transparent-lemma-zero-footprint) ≡ zero
transparent-lemma-zero-footprint-count-smoke = refl

transparent-lemma-zero-latency-smoke :
  costOf (transparent-integration-latency transparent-lemma-extension) ≡ zero
transparent-lemma-zero-latency-smoke =
  transparent-definitions-have-zero-integration-latency
    transparent-lemma-extension

sparse-datatype-fixture-classification-smoke :
  recurrenceClassification sparse-datatype-summary ≡ sparse-local
sparse-datatype-fixture-classification-smoke = refl

sparse-datatype-footprint-count-smoke :
  dependencyCount sparse-datatype-footprint ≡ one
sparse-datatype-footprint-count-smoke = refl

sparse-datatype-window-depth-smoke :
  windowDepth sparse-datatype-context ≡ three
sparse-datatype-window-depth-smoke = refl

sparse-datatype-latency-smoke :
  sparse-next-latency sparse-datatype-context ≡ two
sparse-datatype-latency-smoke = refl

sparse-datatype-recurrence-cost-smoke :
  footprintCost sparse-datatype-recurrence ≡ two
sparse-datatype-recurrence-cost-smoke = refl

sparse-datatype-below-full-envelope-smoke =
  sparse-datatype-below-full-envelope

higher-payload-fixture-classification-smoke :
  recurrenceClassification higher-payload-summary ≡ no-recurrence-law
higher-payload-fixture-classification-smoke = refl

higher-payload-zero-trace-smoke :
  expectedMuContribution higher-payload-summary ≡ zero
higher-payload-zero-trace-smoke =
  higher-payload-zero-trace
