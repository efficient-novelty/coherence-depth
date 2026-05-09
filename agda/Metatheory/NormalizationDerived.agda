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
