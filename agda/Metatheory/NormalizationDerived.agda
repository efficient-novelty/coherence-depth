{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.NormalizationDerived where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

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
