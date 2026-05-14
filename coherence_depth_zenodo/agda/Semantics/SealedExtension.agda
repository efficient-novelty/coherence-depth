{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.SealedExtension where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude
open import Cubical.Data.Sum.Base using (_⊎_)

open import Core.Nat renaming (ℕ to Nat)
open import Semantics.CubicalFoundation

record SemanticLibraryState {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ) : Type (lsuc ℓ) where
  field
    ActiveInterface : Type ℓ

open SemanticLibraryState public

record SemanticSealedLayer {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ)
  (B : SemanticLibraryState F) : Type (lsuc ℓ) where
  field
    Payload : Type ℓ
    ResolvedTrace : Type ℓ
    interpretation : Payload ⊎ ResolvedTrace -> ActiveInterface B
    payloadSize : Nat
    traceSize : Nat

open SemanticSealedLayer public

semantic-public-interface :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ}
  {B : SemanticLibraryState F} ->
  SemanticSealedLayer F B ->
  Type ℓ
semantic-public-interface E =
  Payload E ⊎ ResolvedTrace E

semantic-public-interface-size :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ}
  {B : SemanticLibraryState F} ->
  SemanticSealedLayer F B ->
  Nat
semantic-public-interface-size E =
  payloadSize E + traceSize E

K_n :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ}
  {B : SemanticLibraryState F} ->
  SemanticSealedLayer F B ->
  Type ℓ
K_n = Payload

T_n :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ}
  {B : SemanticLibraryState F} ->
  SemanticSealedLayer F B ->
  Type ℓ
T_n = ResolvedTrace

I_n :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ}
  {B : SemanticLibraryState F} ->
  SemanticSealedLayer F B ->
  Type ℓ
I_n = semantic-public-interface

κ :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ}
  {B : SemanticLibraryState F} ->
  SemanticSealedLayer F B ->
  Nat
κ = payloadSize

μ :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ}
  {B : SemanticLibraryState F} ->
  SemanticSealedLayer F B ->
  Nat
μ = traceSize

record TransparentDevelopment {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ)
  (B : SemanticLibraryState F) : Type (lsuc ℓ) where
  field
    resultState : SemanticLibraryState F
    definitionalContent : Type ℓ

open TransparentDevelopment public

transparent-latency :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ}
  {B : SemanticLibraryState F} ->
  TransparentDevelopment F B ->
  Nat
transparent-latency _ = zero

semantic-transparent-zero-latency :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ}
  {B : SemanticLibraryState F} ->
  (U : TransparentDevelopment F B) ->
  transparent-latency U ≡ zero
semantic-transparent-zero-latency U = refl

record SemanticSealedSequence {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ) : Type (lsuc ℓ) where
  field
    stateAt : Nat -> SemanticLibraryState F
    layerAt : (n : Nat) -> SemanticSealedLayer F (stateAt n)

open SemanticSealedSequence public
