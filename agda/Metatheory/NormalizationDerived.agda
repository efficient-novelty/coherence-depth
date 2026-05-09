{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.NormalizationDerived where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

open import Core.Nat renaming (ℕ to Nat)
open import Metatheory.Obligations using (Fin)
open import Metatheory.RawStructuralSyntax
open import Metatheory.DerivedTrace
open import Metatheory.ReplaceDerivedField

private
  variable
    ℓ : Level

data PrimitivePublicStatus
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} :
  PublicStatus Γlower f → Type (lsuc ℓ) where
  primitivePublicStatus :
    (irreducible : IrreducibleTrace Γlower f) →
    PrimitivePublicStatus (primitiveStatus irreducible)

record HigherStructuralDerivedStep
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ) : SSet (lsuc ℓ) where
  constructor mkHigherStructuralDerivedStep
  field
    hornDerivation : HornSemanticDerivation Γlower f
    replacement : DerivedFieldReplacement Γlower f
      (hornDerivedTrace hornDerivation)

open HigherStructuralDerivedStep public

higherStructuralTraceDerivedByTheorem :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  HornSemanticDerivation Γlower f →
  HigherStructuralDerivedStep Γlower f
higherStructuralTraceDerivedByTheorem derivation =
  mkHigherStructuralDerivedStep
    derivation
    (replaceDerivedField (hornDerivedTrace derivation))

higherStructuralTraceDerived :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  HornSemanticDerivation Γlower f →
  DerivedTrace Γlower f
higherStructuralTraceDerived derivation =
  hornDerivedTrace derivation

normalizationClassifiesHigherStructuralByDerivation :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  HornSemanticDerivation Γlower f →
  NormalizedPublicField Γlower f
normalizationClassifiesHigherStructuralByDerivation derivation =
  mkNormalizedPublicField
    (derivedStatus (higherStructuralTraceDerived derivation))

normalizeEliminatesHigherStructuralTrace :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  (derivation : HornSemanticDerivation Γlower f) →
  PrimitivePublicStatus
    (checkedPublicStatus
      (normalizationClassifiesHigherStructuralByDerivation derivation)) →
  PrimitivePublicStatus
    (derivedStatus (hornDerivedTrace derivation))
normalizeEliminatesHigherStructuralTrace derivation ()

normalizationAppliesDerivedFieldReplacement :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  (derivation : HornSemanticDerivation Γlower f) →
  DerivedFieldReplacement Γlower f (hornDerivedTrace derivation)
normalizationAppliesDerivedFieldReplacement derivation =
  replacement (higherStructuralTraceDerivedByTheorem derivation)

normalizationReplacementUsesOnlyLower :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  (derivation : HornSemanticDerivation Γlower f) →
  usesOnlyLower (hornDerivedTrace derivation)
normalizationReplacementUsesOnlyLower derivation =
  usesLowerBoundaryAndKan derivation

record NormalizationDerivedWitness
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ) : SSet (lsuc ℓ) where
  constructor mkNormalizationDerivedWitness
  field
    fieldIsStructuralHorn :
      rawStructuralClauseKind f ≡ horn-kind
    derivedByTheorem :
      HigherStructuralDerivedStep Γlower f
    publicStatusFromDerivation :
      NormalizedPublicField Γlower f
    deletesByPresentationEquivalence :
      DerivedFieldReplacement Γlower f
        (hornDerivedTrace (hornDerivation derivedByTheorem))

open NormalizationDerivedWitness public

normalizationDerivedWitness :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  HornSemanticDerivation Γlower f →
  NormalizationDerivedWitness Γlower f
normalizationDerivedWitness derivation =
  let step = higherStructuralTraceDerivedByTheorem derivation in
  mkNormalizationDerivedWitness
    (isHornClause derivation)
    step
    (normalizationClassifiesHigherStructuralByDerivation derivation)
    (replacement step)

record DependencyOrderedNormalization
  (Γ : RawTelescope (RawStructuralClause ℓ)) : Type (lsuc ℓ) where
  constructor mkDependencyOrderedNormalization
  field
    normalizedPrefix :
      (i : Fin (fieldCount Γ)) →
      RawTelescope (RawStructuralClause ℓ)
    normalizedField :
      (i : Fin (fieldCount Γ)) →
      NormalizedPublicField (normalizedPrefix i) (fieldAt Γ i)
    prefixContainsOnlyEarlierFields : Type ℓ
    prefixContainsOnlyEarlierFieldsProof :
      prefixContainsOnlyEarlierFields
    derivedReplacementsUseOnlyPrefix : Type ℓ
    derivedReplacementsUseOnlyPrefixProof :
      derivedReplacementsUseOnlyPrefix
    normalizationTerminationMeasure :
      Fin (fieldCount Γ) → Nat
    normalizationTerminationDecreases : Type ℓ
    normalizationTerminationDecreasesProof :
      normalizationTerminationDecreases
    finiteDependencyOrderTerminates : Type ℓ
    finiteDependencyOrderTerminatesProof :
      finiteDependencyOrderTerminates
    primitivePayloadOrUnaryBinaryTraceCount : Nat
    muCountsOnlyPayloadAndIrreducibleUnaryBinary : Type ℓ
    muCountsOnlyPayloadAndIrreducibleUnaryBinaryProof :
      muCountsOnlyPayloadAndIrreducibleUnaryBinary

open DependencyOrderedNormalization public

normalizeTraceTelescopeInDependencyOrder :
  {Γ : RawTelescope (RawStructuralClause ℓ)} →
  (Γnorm : DependencyOrderedNormalization Γ) →
  (i : Fin (fieldCount Γ)) →
  NormalizedPublicField
    (normalizedPrefix Γnorm i)
    (fieldAt Γ i)
normalizeTraceTelescopeInDependencyOrder Γnorm =
  normalizedField Γnorm

normalizationTerminatesBecauseReplacementsUseLowerData :
  {Γ : RawTelescope (RawStructuralClause ℓ)} →
  (Γnorm : DependencyOrderedNormalization Γ) →
  finiteDependencyOrderTerminates Γnorm
normalizationTerminatesBecauseReplacementsUseLowerData Γnorm =
  finiteDependencyOrderTerminatesProof Γnorm

normalizationReplacementDependencyDecreases :
  {Γ : RawTelescope (RawStructuralClause ℓ)} →
  (Γnorm : DependencyOrderedNormalization Γ) →
  normalizationTerminationDecreases Γnorm
normalizationReplacementDependencyDecreases Γnorm =
  normalizationTerminationDecreasesProof Γnorm

normalizationMuCountsOnlyPayloadAndIrreducibleUnaryBinary :
  {Γ : RawTelescope (RawStructuralClause ℓ)} →
  (Γnorm : DependencyOrderedNormalization Γ) →
  muCountsOnlyPayloadAndIrreducibleUnaryBinary Γnorm
normalizationMuCountsOnlyPayloadAndIrreducibleUnaryBinary Γnorm =
  muCountsOnlyPayloadAndIrreducibleUnaryBinaryProof Γnorm
