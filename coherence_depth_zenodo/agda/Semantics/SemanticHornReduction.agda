{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.SemanticHornReduction where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism using (Iso)

open import Core.Nat renaming (ℕ to Nat)
open import Metatheory.Obligations using (derived)
open import Metatheory.KanSubsumption
  using ( StructuralObligation
        ; TelescopicSubsumptionView
        ; HornReductionView
        ; structural-integration-horn-reduction
        ; telescopic-subsumption
        ; remote-layer-obligation-derived
        ; telescopic-remote-comparison-derived
        ; structural-primitive-cost
        )
open import Semantics.CubicalFoundation
open import Semantics.PrimitiveTrace

record SemanticHornBoundaryData {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ) : Type (lsuc ℓ) where
  field
    Carrier : Type ℓ
    face : KanStructure.Cofibration (kan F)
    partial : KanStructure.PartialElement (kan F) face Carrier
    base : Carrier

open SemanticHornBoundaryData public

record BinaryBoundaryTrace {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ)
  (boundary : SemanticHornBoundaryData F) : Type ℓ where
  constructor mkBinaryBoundaryTrace
  field
    leftBoundaryTrace : Carrier boundary
    rightBoundaryTrace : Carrier boundary

open BinaryBoundaryTrace public

record HigherStructuralObligationSupport {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ) : Type (lsuc ℓ) where
  constructor mkHigherStructuralObligationSupport
  field
    supportOffset : Nat
    supportBoundary : SemanticHornBoundaryData F
    binaryBoundaryData : BinaryBoundaryTrace F supportBoundary
    supportDepth : Nat
    supportDepthBeyondTwo : supportDepth ≡ 3 + supportOffset

open HigherStructuralObligationSupport public

record SemanticDerivedHornTrace {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ)
  (boundary : SemanticHornBoundaryData F) : Type ℓ where
  constructor mkSemanticDerivedHornTrace
  field
    hcompTrace : Carrier boundary
    hfillTrace : KanStructure.Interval (kan F) -> Carrier boundary
    derivedStatus : derived-trace ≡ derived-trace

open SemanticDerivedHornTrace public

semantic-derived-trace-from-hcomp :
  {ℓ : Level} ->
  (F : SemanticCubicalFoundation ℓ) ->
  (boundary : SemanticHornBoundaryData F) ->
  Carrier boundary
semantic-derived-trace-from-hcomp F boundary =
  KanStructure.hcompLike (kan F)
    (face boundary)
    (partial boundary)
    (base boundary)

semantic-derived-trace-from-hfill :
  {ℓ : Level} ->
  (F : SemanticCubicalFoundation ℓ) ->
  (boundary : SemanticHornBoundaryData F) ->
  KanStructure.Interval (kan F) -> Carrier boundary
semantic-derived-trace-from-hfill F boundary =
  KanStructure.hfillLike (kan F)
    (face boundary)
    (partial boundary)
    (base boundary)

semantic-horn-extension-derived :
  {ℓ : Level} ->
  (F : SemanticCubicalFoundation ℓ) ->
  (boundary : SemanticHornBoundaryData F) ->
  SemanticDerivedHornTrace F boundary
semantic-horn-extension-derived F boundary =
  mkSemanticDerivedHornTrace
    (semantic-derived-trace-from-hcomp F boundary)
    (semantic-derived-trace-from-hfill F boundary)
    refl

higher-structural-obligation-derived-by-hfill :
  {ℓ : Level} ->
  (F : SemanticCubicalFoundation ℓ) ->
  (boundary : SemanticHornBoundaryData F) ->
  derivedStatus (semantic-horn-extension-derived F boundary)
    ≡ refl
higher-structural-obligation-derived-by-hfill F boundary = refl

higher-horn-trace-derived-from-binary-boundary-data :
  {ℓ : Level} ->
  (F : SemanticCubicalFoundation ℓ) ->
  (support : HigherStructuralObligationSupport F) ->
  SemanticDerivedHornTrace F (supportBoundary support)
higher-horn-trace-derived-from-binary-boundary-data F support =
  semantic-horn-extension-derived F (supportBoundary support)

exported-horn-trace-computable-from-depth-two-data :
  {ℓ : Level} ->
  (F : SemanticCubicalFoundation ℓ) ->
  (support : HigherStructuralObligationSupport F) ->
  Carrier (supportBoundary support)
exported-horn-trace-computable-from-depth-two-data F support =
  hcompTrace
    (higher-horn-trace-derived-from-binary-boundary-data F support)

semantic-derived-trace-respects-substitution :
  {ℓ : Level} ->
  (F : SemanticCubicalFoundation ℓ) ->
  (boundary : SemanticHornBoundaryData F) ->
  {B : Type ℓ} ->
  (Carrier boundary -> B) ->
  Type ℓ
semantic-derived-trace-respects-substitution F boundary f =
  KanStructure.substitution-stability (kan F) f

semantic-telescopic-subsumption :
  {ℓ : Level} {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  (offset : Nat) ->
  StructuralObligation u u0 (2 + offset) ->
  TelescopicSubsumptionView u u0 offset
semantic-telescopic-subsumption =
  telescopic-subsumption

semantic-remote-comparison-derived :
  {ℓ : Level} {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  (offset : Nat) ->
  (o : StructuralObligation u u0 (3 + offset)) ->
  structural-primitive-cost o ≡ derived
semantic-remote-comparison-derived =
  telescopic-remote-comparison-derived

semantic-horn-reduction-view :
  {ℓ : Level} {A : Type ℓ} {φ : I} ->
  (u : I -> Partial φ A) ->
  (u0 : A [ φ ↦ u i0 ]) ->
  (offset : Nat) ->
  Iso
    (StructuralObligation u u0 (suc (suc (suc offset))))
    (HornReductionView u u0 offset)
semantic-horn-reduction-view =
  structural-integration-horn-reduction
