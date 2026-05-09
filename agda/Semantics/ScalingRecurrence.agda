{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.ScalingRecurrence where

open import Agda.Primitive using (Level)
open import Cubical.Foundations.Prelude

open import Core.Nat renaming (ℕ to Nat)
open import Semantics.CubicalFoundation
open import Semantics.RawAdequacy
open import Semantics.SealedExtension
open import Semantics.FullCoupling

kappa :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  SemanticSealedSequence F ->
  Nat ->
  Nat
kappa = stage-payload-size

mu :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  SemanticSealedSequence F ->
  Nat ->
  Nat
mu = stage-trace-size

semantic-interface-cardinality :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  (S : SemanticSealedSequence F) ->
  (n : Nat) ->
  semantic-public-interface-size (layerAt S n)
    ≡ kappa S n + mu S n
semantic-interface-cardinality S n = refl

full-coupling-affine-recurrence :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  (S : SemanticSealedSequence F) ->
  FullCoupling S ->
  (n : Nat) ->
  mu S (suc (suc n))
    ≡ mu S (suc n) + mu S n + kappa S (suc n) + kappa S n
full-coupling-affine-recurrence S coupling n =
  fullCouplingCardinality coupling n

full-coupling-affine-recurrence-relative-to-adequacy :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  RawAdequacyPackage F ->
  (S : SemanticSealedSequence F) ->
  FullCoupling S ->
  (n : Nat) ->
  mu S (suc (suc n))
    ≡ mu S (suc n) + mu S n + kappa S (suc n) + kappa S n
full-coupling-affine-recurrence-relative-to-adequacy adequacy S coupling n =
  full-coupling-affine-recurrence S coupling n
