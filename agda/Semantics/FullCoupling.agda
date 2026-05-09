{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.FullCoupling where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism using (Iso)
open import Cubical.Data.Sum.Base using (_⊎_)

open import Core.Nat renaming (ℕ to Nat)
open import Semantics.CubicalFoundation
open import Semantics.SealedExtension

stage-interface :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  SemanticSealedSequence F ->
  Nat ->
  Type ℓ
stage-interface S n =
  semantic-public-interface (layerAt S n)

stage-payload-size :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  SemanticSealedSequence F ->
  Nat ->
  Nat
stage-payload-size S n =
  payloadSize (layerAt S n)

stage-trace-size :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  SemanticSealedSequence F ->
  Nat ->
  Nat
stage-trace-size S n =
  traceSize (layerAt S n)

record FullCoupling {ℓ : Level}
  {F : SemanticCubicalFoundation ℓ}
  (S : SemanticSealedSequence F) : Type (lsuc ℓ) where
  field
    fullCouplingIso :
      (n : Nat) ->
      Iso
        (ResolvedTrace (layerAt S (suc (suc n))))
        (stage-interface S (suc n) ⊎ stage-interface S n)

    fullCouplingCardinality :
      (n : Nat) ->
      stage-trace-size S (suc (suc n))
        ≡
        stage-trace-size S (suc n)
        + stage-trace-size S n
        + stage-payload-size S (suc n)
        + stage-payload-size S n

open FullCoupling public

full-coupling-window-iso :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ}
  {S : SemanticSealedSequence F} ->
  FullCoupling S ->
  (n : Nat) ->
  Iso
    (ResolvedTrace (layerAt S (suc (suc n))))
    (stage-interface S (suc n) ⊎ stage-interface S n)
full-coupling-window-iso coupling =
  fullCouplingIso coupling

record SparseCoupling {ℓ : Level}
  {F : SemanticCubicalFoundation ℓ}
  (S : SemanticSealedSequence F) : Type (lsuc ℓ) where
  field
    dependencyFootprint : Nat
    footprintContainedInWindow : Type ℓ

open SparseCoupling public
