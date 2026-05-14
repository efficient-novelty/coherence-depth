{-# OPTIONS --cubical --safe --guardedness #-}

module Test.FibonacciScalingSmoke where

open import Agda.Primitive using (Level)
open import Cubical.Foundations.Prelude

open import Core.Nat renaming (ℕ to Nat)
open import Semantics.CubicalFoundation
open import Semantics.RawAdequacy
open import Semantics.SealedExtension
open import Semantics.FullCoupling
open import Semantics.FibonacciScaling

_ : shiftedTrace 1 0 ≡ 2
_ = refl

_ : shiftedTrace 1 1 ≡ 3
_ = refl

_ : shiftedTrace 1 2 ≡ 5
_ = refl

_ : shiftedTrace 1 3 ≡ 8
_ = refl

constant-payload-fibonacci-scaling-smoke :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  (S : SemanticSealedSequence F) ->
  FullCoupling S ->
  {c : Nat} ->
  ConstantPayload S c ->
  Bootstrap S c ->
  (n : Nat) ->
  shiftedTrace c (suc (suc n))
    ≡ shiftedTrace c (suc n) + shiftedTrace c n
constant-payload-fibonacci-scaling-smoke =
  constant-payload-fibonacci-scaling

constant-payload-fibonacci-scaling-relative-smoke :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  RawAdequacyPackage F ->
  (S : SemanticSealedSequence F) ->
  FullCoupling S ->
  {c : Nat} ->
  ConstantPayload S c ->
  Bootstrap S c ->
  (n : Nat) ->
  shiftedTrace c (suc (suc n))
    ≡ shiftedTrace c (suc n) + shiftedTrace c n
constant-payload-fibonacci-scaling-relative-smoke =
  constant-payload-fibonacci-scaling-relative-to-adequacy
