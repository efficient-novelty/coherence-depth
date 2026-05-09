{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.RawAdequacy where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

open import Metatheory.RawStructuralSyntax using (RawExtension)
open import Semantics.CubicalFoundation
open import Semantics.SealedExtension

record RawAdequacyPackage {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ) : Type (lsuc ℓ) where
  field
    raw-syntax-sound-for-semantic-extensions :
      {B : SemanticLibraryState F} ->
      SemanticSealedLayer F B ->
      Type ℓ

    semantic-extension-elaborates-to-raw :
      {B : SemanticLibraryState F} ->
      SemanticSealedLayer F B ->
      RawExtension ℓ

    raw-normalization-preserves-semantics :
      {B : SemanticLibraryState F} ->
      (E : SemanticSealedLayer F B) ->
      Type ℓ

    raw-normalization-preserves-support :
      {B : SemanticLibraryState F} ->
      (E : SemanticSealedLayer F B) ->
      Type ℓ

    raw-normalization-preserves-primitive-status :
      {B : SemanticLibraryState F} ->
      (E : SemanticSealedLayer F B) ->
      Type ℓ

    raw-normalization-preserves-cardinality :
      {B : SemanticLibraryState F} ->
      (E : SemanticSealedLayer F B) ->
      Type ℓ

    raw-normalization-preserves-exported-interface-cardinality :
      {B : SemanticLibraryState F} ->
      (E : SemanticSealedLayer F B) ->
      Type ℓ

    raw-normalization-preserves-historical-support :
      {B : SemanticLibraryState F} ->
      (E : SemanticSealedLayer F B) ->
      Type ℓ

    raw-normalization-preserves-primitive-vs-derived :
      {B : SemanticLibraryState F} ->
      (E : SemanticSealedLayer F B) ->
      Type ℓ

    raw-normalization-preserves-semantic-interpretation :
      {B : SemanticLibraryState F} ->
      (E : SemanticSealedLayer F B) ->
      Type ℓ

open RawAdequacyPackage public

raw-adequacy-package :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  RawAdequacyPackage F ->
  RawAdequacyPackage F
raw-adequacy-package A = A
