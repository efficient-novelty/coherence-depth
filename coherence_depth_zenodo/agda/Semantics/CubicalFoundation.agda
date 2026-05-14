{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.CubicalFoundation where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

record KanStructure (ℓ : Level) : Type (lsuc ℓ) where
  field
    Interval : Type ℓ
    endpoint0 endpoint1 : Interval

    Cofibration : Type ℓ
    PartialElement : Cofibration -> Type ℓ -> Type ℓ

    PathLike : Type ℓ -> Type ℓ -> Type ℓ
    transportLike : {A B : Type ℓ} -> PathLike A B -> A -> B

    hcompLike :
      {A : Type ℓ} ->
      (φ : Cofibration) ->
      PartialElement φ A ->
      A ->
      A

    hfillLike :
      {A : Type ℓ} ->
      (φ : Cofibration) ->
      PartialElement φ A ->
      A ->
      Interval ->
      A

    hcomp-boundary-law :
      {A : Type ℓ} ->
      (φ : Cofibration) ->
      PartialElement φ A ->
      A ->
      Type ℓ

    hfill-boundary-law :
      {A : Type ℓ} ->
      (φ : Cofibration) ->
      PartialElement φ A ->
      A ->
      Type ℓ

    substitution-stability :
      {A B : Type ℓ} ->
      (A -> B) ->
      Type ℓ

open KanStructure public

record SemanticCubicalFoundation (ℓ : Level) : Type (lsuc ℓ) where
  field
    kan : KanStructure ℓ

open SemanticCubicalFoundation public

record UnivalenceStructure {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ) : Type (lsuc ℓ) where
  field
    EquivLike : Type ℓ -> Type ℓ -> Type ℓ
    uaLike :
      {A B : Type ℓ} ->
      EquivLike A B ->
      KanStructure.PathLike (SemanticCubicalFoundation.kan F) A B

open UnivalenceStructure public

record SemanticCubicalFoundationWithUnivalence
  (ℓ : Level) : Type (lsuc ℓ) where
  field
    foundation : SemanticCubicalFoundation ℓ
    univalence : UnivalenceStructure foundation

open SemanticCubicalFoundationWithUnivalence public
