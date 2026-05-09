{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.FibonacciScaling where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

open import Core.Nat renaming (ℕ to Nat)
open import Core.AffineRecurrence
  using ( U-bootstrap
        ; U-bootstrap-is-fibonacci
        ; U-bootstrap-closed
        ; scale
        )
open import Semantics.CubicalFoundation
open import Semantics.SealedExtension
open import Semantics.FullCoupling
open import Semantics.ScalingRecurrence

record ConstantPayload {ℓ : Level}
  {F : SemanticCubicalFoundation ℓ}
  (S : SemanticSealedSequence F)
  (c : Nat) : Type where
  field
    constantPayload : (n : Nat) -> kappa S n ≡ c

open ConstantPayload public

record Bootstrap {ℓ : Level}
  {F : SemanticCubicalFoundation ℓ}
  (S : SemanticSealedSequence F)
  (c : Nat) : Type where
  field
    bootstrap0 : mu S 0 ≡ 0
    bootstrap1 : mu S 1 ≡ c

open Bootstrap public

shiftedTrace :
  Nat ->
  Nat ->
  Nat
shiftedTrace c n =
  U-bootstrap c n

constant-payload-fibonacci-scaling :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  (S : SemanticSealedSequence F) ->
  FullCoupling S ->
  {c : Nat} ->
  ConstantPayload S c ->
  Bootstrap S c ->
  (n : Nat) ->
  shiftedTrace c (suc (suc n))
    ≡ shiftedTrace c (suc n) + shiftedTrace c n
constant-payload-fibonacci-scaling S coupling constant bootstrap n =
  U-bootstrap-is-fibonacci _ n

constant-payload-fibonacci-closed :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  (S : SemanticSealedSequence F) ->
  FullCoupling S ->
  {c : Nat} ->
  ConstantPayload S c ->
  Bootstrap S c ->
  (n : Nat) ->
  shiftedTrace c n ≡ scale c (fib (suc (suc n)))
constant-payload-fibonacci-closed S coupling constant bootstrap n =
  U-bootstrap-closed _ n
