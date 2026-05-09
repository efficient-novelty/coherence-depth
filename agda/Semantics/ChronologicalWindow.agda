{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.ChronologicalWindow where

open import Agda.Primitive using (Level)
open import Cubical.Foundations.Prelude

open import Metatheory.Obligations
  using ( HasCoherenceDepth
        ; HasChronologicalWindowSize
        ; ChronologicalWindowAt
        )
open import Metatheory.KanSubsumption using (structural-horn-language)
open import Metatheory.TwoDFoundations
  using ( cubical-chronological-window-size-two-for-2d-foundations
        )
open import Semantics.CubicalFoundation
open import Semantics.RawAdequacy

ChronologicalWindowSize :
  {ℓF ℓ : Level}
  (F : SemanticCubicalFoundation ℓF) ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  Type ℓ
ChronologicalWindowSize F u u0 =
  HasChronologicalWindowSize (structural-horn-language u u0) 2

exact-depth-two-implies-chronological-window-two :
  {ℓF ℓ : Level}
  {F : SemanticCubicalFoundation ℓF} ->
  RawAdequacyPackage F ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  HasCoherenceDepth (structural-horn-language u u0) 2 ->
  HasChronologicalWindowSize (structural-horn-language u u0) 2
exact-depth-two-implies-chronological-window-two adequacy u u0 exactDepth =
  cubical-chronological-window-size-two-for-2d-foundations u u0

stage-trace-supported-by-last-two-interfaces :
  {ℓF ℓ : Level}
  {F : SemanticCubicalFoundation ℓF} ->
  RawAdequacyPackage F ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  ChronologicalWindowAt (structural-horn-language u u0) 2
stage-trace-supported-by-last-two-interfaces adequacy u u0 =
  HasChronologicalWindowSize.windowAt
    (cubical-chronological-window-size-two-for-2d-foundations u u0)
