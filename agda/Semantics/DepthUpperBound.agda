{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.DepthUpperBound where

open import Agda.Primitive using (Level)
open import Cubical.Foundations.Prelude

open import Metatheory.Obligations
  using ( HasPrimitiveDepth
        ; HasCoherenceDepth
        ; PrimitiveEliminatesAbove
        ; StabilizesAt
        )
open import Metatheory.KanSubsumption using (structural-horn-language)
open import Metatheory.TwoDFoundations
  using ( cubical-primitive-depth-two-law-for-2d-foundations
        ; cubical-depth-two-law-for-2d-foundations
        ; structural-primitive-eliminates-above-two
        )
open import Semantics.CubicalFoundation
open import Semantics.RawAdequacy
import Semantics.TraceNormalForm
import Semantics.SemanticHornReduction

primitive-trace-depth-at-most-two :
  {ℓF ℓ : Level}
  {F : SemanticCubicalFoundation ℓF} ->
  RawAdequacyPackage F ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  HasPrimitiveDepth (structural-horn-language u u0) 2
primitive-trace-depth-at-most-two adequacy u u0 =
  cubical-primitive-depth-two-law-for-2d-foundations u u0

primitive-trace-normal-forms-stabilize-at-depth-two :
  {ℓF ℓ : Level}
  {F : SemanticCubicalFoundation ℓF} ->
  RawAdequacyPackage F ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  StabilizesAt (structural-horn-language u u0) 2
primitive-trace-normal-forms-stabilize-at-depth-two adequacy u u0 =
  HasCoherenceDepth.stabilizesAt
    (cubical-depth-two-law-for-2d-foundations u u0)

primitive-trace-fields-above-two-reduce :
  {ℓF ℓ : Level}
  {F : SemanticCubicalFoundation ℓF} ->
  RawAdequacyPackage F ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  PrimitiveEliminatesAbove (structural-horn-language u u0) 2
primitive-trace-fields-above-two-reduce adequacy u u0 =
  structural-primitive-eliminates-above-two u u0
