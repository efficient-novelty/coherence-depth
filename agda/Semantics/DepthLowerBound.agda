{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.DepthLowerBound where

open import Agda.Primitive using (Level)
open import Cubical.Foundations.Prelude

open import Metatheory.Obligations
  using ( Not
        ; PrimitiveEliminatesAbove
        )
open import Metatheory.KanSubsumption using (structural-horn-language)
open import Metatheory.TwoDFoundations
  using ( cubical-primitive-window-2d-foundation
        ; no-primitive-depth-one
        )
open import Metatheory.AdjunctionBarrier
  using ( ExplicitBinarySealingObstruction
        ; explicit-binary-sealing-obstruction
        )
open import Semantics.CubicalFoundation
open import Semantics.RawAdequacy

swap-path-forces-binary-trace : ExplicitBinarySealingObstruction
swap-path-forces-binary-trace =
  explicit-binary-sealing-obstruction

semantic-depth-one-impossible :
  {ℓF ℓ : Level}
  {F : SemanticCubicalFoundation ℓF} ->
  RawAdequacyPackage F ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  Not (PrimitiveEliminatesAbove (structural-horn-language u u0) 1)
semantic-depth-one-impossible adequacy u u0 =
  no-primitive-depth-one
    (cubical-primitive-window-2d-foundation u u0)

semantic-binary-trace-necessary :
  {ℓF ℓ : Level}
  {F : SemanticCubicalFoundation ℓF} ->
  RawAdequacyPackage F ->
  {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  Not (PrimitiveEliminatesAbove (structural-horn-language u u0) 1)
semantic-binary-trace-necessary =
  semantic-depth-one-impossible
