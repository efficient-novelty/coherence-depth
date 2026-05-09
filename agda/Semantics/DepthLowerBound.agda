{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.DepthLowerBound where

open import Agda.Primitive using (Level)
open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism using (Iso)

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
  using ( BinaryObligation
        ; Two
        ; swap-iso
        ; swap-path
        ; swap-path≠refl
        ; binary-coherence-nontrivial
        ; const-left
        ; const-right
        ; swap-endomap-path
        ; swap-endomap-transport
        ; const-right≠const-left
        ; ExplicitBinarySealingObstruction
        ; explicit-binary-sealing-obstruction
        )
open import Semantics.CubicalFoundation
open import Semantics.RawAdequacy

two-point-type-witness : Type
two-point-type-witness = Two

nontrivial-swap-equivalence : Iso Two Two
nontrivial-swap-equivalence = swap-iso

swap-path-from-univalence : Two ≡ Two
swap-path-from-univalence = swap-path

swap-path-not-refl :
  Not (swap-path ≡ refl)
swap-path-not-refl =
  swap-path≠refl

transport-unary-clause-along-swap-changes-action :
  transport swap-endomap-path const-left ≡ const-right
transport-unary-clause-along-swap-changes-action =
  swap-endomap-transport

constant-left-and-right-distinguishable :
  Not (const-right ≡ const-left)
constant-left-and-right-distinguishable =
  const-right≠const-left

binary-comparison-between-refl-and-swap-not-unary-derived :
  Not (isContr (BinaryObligation {A = Type} refl swap-path))
binary-comparison-between-refl-and-swap-not-unary-derived =
  binary-coherence-nontrivial

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
