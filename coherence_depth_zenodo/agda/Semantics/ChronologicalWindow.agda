{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.ChronologicalWindow where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism using (Iso)
open import Cubical.Data.Sum.Base using (_⊎_)

open import Core.Nat renaming (ℕ to Nat)
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
open import Semantics.SealedExtension
open import Semantics.RawAdequacy
open import Semantics.FullCoupling

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

record TraceSupportInLastTwoInterfaces {ℓ : Level}
  {F : SemanticCubicalFoundation ℓ}
  (S : SemanticSealedSequence F)
  (n : Nat) : Type (lsuc ℓ) where
  constructor mkTraceSupportInLastTwoInterfaces
  field
    supportInclusion :
      ResolvedTrace (layerAt S (suc (suc n))) ->
      semantic-public-interface (layerAt S (suc n))
        ⊎ semantic-public-interface (layerAt S n)

open TraceSupportInLastTwoInterfaces public

full-coupling-trace-support-in-last-two-interfaces :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ}
  {S : SemanticSealedSequence F} ->
  FullCoupling S ->
  (n : Nat) ->
  TraceSupportInLastTwoInterfaces S n
full-coupling-trace-support-in-last-two-interfaces coupling n =
  mkTraceSupportInLastTwoInterfaces
    (Iso.fun (fullCouplingIso coupling n))
