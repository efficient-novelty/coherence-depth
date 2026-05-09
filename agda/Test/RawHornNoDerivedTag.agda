{-# OPTIONS --cubical --safe --guardedness #-}

module Test.RawHornNoDerivedTag where

open import Agda.Primitive using (lzero)
open import Cubical.Foundations.Prelude

open import Core.Nat renaming (ℕ to Nat)
open import Metatheory.Obligations using (HistoricalSupport)
open import Metatheory.DerivedTrace
open import Metatheory.RawStructuralSyntax
open import Metatheory.RawStructuralTyping

raw-horn-records-shape-not-derivedness :
  (b : RawBoundary lzero) →
  rawStructuralClauseKind (horn b) ≡ horn-kind
raw-horn-records-shape-not-derivedness b = refl

typed-horn-records-shape-not-derivedness :
  (b : RawBoundary lzero) →
  (package : PackagedHornBoundary b) →
  typed-role-clause-kind (horn-boundary-role b package) ≡ horn-kind
typed-horn-records-shape-not-derivedness b package = refl

raw-trace-field-records-role-not-status :
  (n : Nat) →
  (support : HistoricalSupport n) →
  (carrier witness : Type) →
  rawTraceRole (mkRawTraceField horn-role n support carrier witness)
    ≡ horn-role
raw-trace-field-records-role-not-status n support carrier witness = refl

derived-public-status-requires-witness :
  {Γlower : RawTelescope (RawStructuralClause lzero)}
  {f : RawStructuralClause lzero} →
  DerivedTrace Γlower f →
  PublicStatus Γlower f
derived-public-status-requires-witness =
  derivedStatus

primitive-public-status-requires-irreducibility :
  {Γlower : RawTelescope (RawStructuralClause lzero)}
  {f : RawStructuralClause lzero} →
  IrreducibleTrace Γlower f →
  PublicStatus Γlower f
primitive-public-status-requires-irreducibility =
  primitiveStatus
