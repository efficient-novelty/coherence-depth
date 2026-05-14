{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.FullCouplingEnvelope where

open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism using (Iso)
open import Cubical.Data.Sum.Base using (_⊎_)

open import Core.Nat renaming (ℕ to Nat)
open import Metatheory.Obligations using (Fin)
open import Metatheory.SparseDependencyRecurrence
  using ( CouplingFootprint
        ; FullFootprint
        ; SparseWindowedContext
        ; SparseWindowedRecurrence
        ; mkCouplingFootprint
        ; mkFullFootprint
        ; mkSparseWindowedContext
        ; dependencyCount
        ; sparse-windowed-recurrence
        ; ≤-refl
        )
open import Metatheory.TwoDFoundations
  using ( ConstantPayloadDepthTwoLaw
        ; constant-payload-depth-two-law
        )
open import Semantics.CubicalFoundation
  using (SemanticCubicalFoundation)
open import Semantics.SealedExtension
  using ( SemanticSealedSequence
        ; layerAt
        ; ResolvedTrace
        )
open import Semantics.FullCoupling
  using ( FullCoupling
        ; fullCouplingIso
        ; fullCouplingCardinality
        ; stage-interface
        ; stage-payload-size
        ; stage-trace-size
        )

record FullCouplingEnvelope (n : Nat) : Type where
  constructor mkFullCouplingEnvelope
  field
    envelopeFootprint :
      CouplingFootprint n
    coversPreviousWindow :
      dependencyCount envelopeFootprint ≡ n

open FullCouplingEnvelope public

full-coupling-envelope : (n : Nat) → FullCouplingEnvelope n
full-coupling-envelope n = record
  { envelopeFootprint =
      mkCouplingFootprint n (λ i → i) (≤-refl n)
  ; coversPreviousWindow = refl
  }

full-coupling-envelope-is-full-footprint :
  (n : Nat) →
  FullFootprint n (envelopeFootprint (full-coupling-envelope n))
full-coupling-envelope-is-full-footprint n =
  mkFullFootprint (coversPreviousWindow (full-coupling-envelope n))

full-coupling-sparse-context :
  (n : Nat) →
  (Fin n → Nat) →
  Nat →
  SparseWindowedContext
full-coupling-sparse-context n layerCost payload =
  mkSparseWindowedContext
    n
    (envelopeFootprint (full-coupling-envelope n))
    layerCost
    payload

full-coupling-specializes-sparse-recurrence :
  (n : Nat) →
  (layerCost : Fin n → Nat) →
  (payload : Nat) →
  SparseWindowedRecurrence
    (full-coupling-sparse-context n layerCost payload)
full-coupling-specializes-sparse-recurrence n layerCost payload =
  sparse-windowed-recurrence
    (full-coupling-sparse-context n layerCost payload)

full-coupling-depth-two-affine-law :
  (c : Nat) → ConstantPayloadDepthTwoLaw c
full-coupling-depth-two-affine-law =
  constant-payload-depth-two-law

semantic-full-coupling-window-iso :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ}
  {S : SemanticSealedSequence F} →
  FullCoupling S →
  (n : Nat) →
  Iso
    (ResolvedTrace (layerAt S (suc (suc n))))
    (stage-interface S (suc n) ⊎ stage-interface S n)
semantic-full-coupling-window-iso coupling =
  fullCouplingIso coupling

semantic-full-coupling-cardinality-envelope :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ}
  {S : SemanticSealedSequence F} →
  FullCoupling S →
  (n : Nat) →
  stage-trace-size S (suc (suc n))
    ≡
    stage-trace-size S (suc n)
    + stage-trace-size S n
    + stage-payload-size S (suc n)
    + stage-payload-size S n
semantic-full-coupling-cardinality-envelope coupling =
  fullCouplingCardinality coupling
