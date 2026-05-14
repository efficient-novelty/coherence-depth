{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.ExactDepth where

open import Agda.Primitive using (Level)
open import Cubical.Foundations.Prelude

open import Metatheory.Obligations
  using ( HasCoherenceDepth
        ; HasPrimitiveDepth
        )
open import Metatheory.KanSubsumption using (structural-horn-language)
open import Metatheory.TwoDFoundations
  using ( cubical-depth-two-law-for-2d-foundations
        ; cubical-primitive-depth-two-law-for-2d-foundations
        )
open import Semantics.CubicalFoundation
open import Semantics.RawAdequacy
import Semantics.DepthUpperBound
import Semantics.DepthLowerBound

cubical-foundations-primitive-coherence-depth-exactly-two :
  {ℓF ℓ : Level}
  {F : SemanticCubicalFoundation ℓF} ->
  RawAdequacyPackage F ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  HasCoherenceDepth (structural-horn-language u u0) 2
cubical-foundations-primitive-coherence-depth-exactly-two adequacy u u0 =
  cubical-depth-two-law-for-2d-foundations u u0

sealed-structural-trace-depth-exactly-two :
  {ℓF ℓ : Level}
  {F : SemanticCubicalFoundation ℓF} ->
  RawAdequacyPackage F ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  HasCoherenceDepth (structural-horn-language u u0) 2
sealed-structural-trace-depth-exactly-two =
  cubical-foundations-primitive-coherence-depth-exactly-two

primitive-depth-two-component :
  {ℓF ℓ : Level}
  {F : SemanticCubicalFoundation ℓF} ->
  RawAdequacyPackage F ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  HasPrimitiveDepth (structural-horn-language u u0) 2
primitive-depth-two-component adequacy u u0 =
  cubical-primitive-depth-two-law-for-2d-foundations u u0
