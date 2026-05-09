{-# OPTIONS --cubical --safe --guardedness #-}

module Test.SemanticDepthSmoke where

open import Agda.Primitive using (Level)
open import Cubical.Foundations.Prelude

open import Metatheory.Obligations
  using ( HasCoherenceDepth
        ; HasPrimitiveDepth
        ; ChronologicalWindowAt
        )
open import Metatheory.KanSubsumption using (structural-horn-language)
open import Semantics.CubicalFoundation
open import Semantics.RawAdequacy
open import Semantics.DepthUpperBound
open import Semantics.DepthLowerBound
open import Semantics.ExactDepth
open import Semantics.ChronologicalWindow
open import Semantics.PrimitiveTrace

semantic-upper-bound-smoke :
  {ℓF ℓ : Level}
  {F : SemanticCubicalFoundation ℓF} ->
  RawAdequacyPackage F ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  HasPrimitiveDepth (structural-horn-language u u0) 2
semantic-upper-bound-smoke =
  primitive-trace-depth-at-most-two

semantic-exact-depth-smoke :
  {ℓF ℓ : Level}
  {F : SemanticCubicalFoundation ℓF} ->
  RawAdequacyPackage F ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  HasCoherenceDepth (structural-horn-language u u0) 2
semantic-exact-depth-smoke =
  cubical-foundations-primitive-coherence-depth-exactly-two

semantic-window-smoke :
  {ℓF ℓ : Level}
  {F : SemanticCubicalFoundation ℓF} ->
  RawAdequacyPackage F ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  ChronologicalWindowAt (structural-horn-language u u0) 2
semantic-window-smoke =
  stage-trace-supported-by-last-two-interfaces

higher-payload-smoke :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  (A : Type ℓ) ->
  PayloadTrace (higher-hit-constructor-as-payload {F = F} A 3)
higher-payload-smoke {F = F} A =
  higher-hit-payload-not-structural-trace {F = F} A 3
