{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.TraceNormalForm where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

open import Core.Nat renaming (ℕ to Nat)
open import Metatheory.CanonicalTelescope using (FieldIndex)
open import Metatheory.InterfaceCalculus using (LibraryState)
open import Metatheory.RawStructuralSyntax
open import Metatheory.RawStructuralTyping
open import Metatheory.SurfaceNormalizationBridge
  using ( admissible-structural-trace-field-normalizes
        ; normalizedTraceTelescope
        )
open import Semantics.CubicalFoundation
open import Semantics.SemanticHornReduction
open import Semantics.PrimitiveTrace

data SemanticTraceNormalForm {ℓ : Level} :
  RawStructuralClause ℓ -> Type (lsuc ℓ) where
  unary-action-normal-form :
    (p : NewPayloadRef) ->
    (s : BasisSite) ->
    SemanticTraceNormalForm (act p s)
  binary-comparison-normal-form :
    (p : NewPayloadRef) ->
    (left right : BasisSite) ->
    SemanticTraceNormalForm (cmp p left right)
  higher-horn-normal-form :
    (b : RawBoundary ℓ) ->
    PackagedHornBoundary b ->
    SemanticTraceNormalForm (horn b)

semantic-trace-normal-form :
  {ℓ : Level} {c : RawStructuralClause ℓ} ->
  TypedStructuralRole c ->
  SemanticTraceNormalForm c
semantic-trace-normal-form (unary-action-role p s) =
  unary-action-normal-form p s
semantic-trace-normal-form (binary-comparison-role p left right) =
  binary-comparison-normal-form p left right
semantic-trace-normal-form (horn-boundary-role b package) =
  higher-horn-normal-form b package

record HornSemanticDerivation {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ)
  (b : RawBoundary ℓ) : Type (lsuc ℓ) where
  constructor mkHornSemanticDerivation
  field
    semanticBoundary :
      SemanticHornBoundaryData F
    fillerCarrierMatches :
      Carrier semanticBoundary ≡ fillerCarrier b
    semanticDerivedTrace :
      SemanticDerivedHornTrace F semanticBoundary

open HornSemanticDerivation public

data SemanticTraceNormalFormWithDerivation {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ) :
  RawStructuralClause ℓ -> Type (lsuc ℓ) where
  unary-action-normal-form-with-derivation :
    (p : NewPayloadRef) ->
    (s : BasisSite) ->
    SemanticTraceNormalFormWithDerivation F (act p s)
  binary-comparison-normal-form-with-derivation :
    (p : NewPayloadRef) ->
    (left right : BasisSite) ->
    SemanticTraceNormalFormWithDerivation F (cmp p left right)
  higher-horn-normal-form-with-derivation :
    (b : RawBoundary ℓ) ->
    (package : PackagedHornBoundary b) ->
    HornSemanticDerivation F b ->
    SemanticTraceNormalFormWithDerivation F (horn b)

semantic-trace-normal-form-with-derivation :
  {ℓ : Level} ->
  (F : SemanticCubicalFoundation ℓ) ->
  {c : RawStructuralClause ℓ} ->
  TypedStructuralRole c ->
  ((b : RawBoundary ℓ) ->
   PackagedHornBoundary b ->
   HornSemanticDerivation F b) ->
  SemanticTraceNormalFormWithDerivation F c
semantic-trace-normal-form-with-derivation F (unary-action-role p s) hornDerivation =
  unary-action-normal-form-with-derivation p s
semantic-trace-normal-form-with-derivation F (binary-comparison-role p left right) hornDerivation =
  binary-comparison-normal-form-with-derivation p left right
semantic-trace-normal-form-with-derivation F (horn-boundary-role b package) hornDerivation =
  higher-horn-normal-form-with-derivation b package (hornDerivation b package)

horn-normal-form-semantic-derived-trace :
  {ℓ : Level} ->
  (F : SemanticCubicalFoundation ℓ) ->
  (b : RawBoundary ℓ) ->
  (package : PackagedHornBoundary b) ->
  (derivation : HornSemanticDerivation F b) ->
  SemanticDerivedHornTrace F (semanticBoundary derivation)
horn-normal-form-semantic-derived-trace F b package derivation =
  semanticDerivedTrace derivation

semantic-normal-form-for-admissible-structural-field :
  {ℓ : Level} ->
  (B : LibraryState ℓ) ->
  (e : RawExtension ℓ) ->
  (admissible : AdmissibleRawExtension B e) ->
  (i : FieldIndex (normalizedTraceTelescope e admissible)) ->
  SemanticTraceNormalForm
    (RawTelescope.fieldAt (raw-extension-structural-clauses e) i)
semantic-normal-form-for-admissible-structural-field B e admissible i =
  semantic-trace-normal-form
    (admissible-structural-trace-field-normalizes B e admissible i)

semantic-normal-form-for-admissible-structural-field-with-derivation :
  {ℓ : Level} ->
  (F : SemanticCubicalFoundation ℓ) ->
  (B : LibraryState ℓ) ->
  (e : RawExtension ℓ) ->
  (admissible : AdmissibleRawExtension B e) ->
  (i : FieldIndex (normalizedTraceTelescope e admissible)) ->
  ((b : RawBoundary ℓ) ->
   PackagedHornBoundary b ->
   HornSemanticDerivation F b) ->
  SemanticTraceNormalFormWithDerivation F
    (RawTelescope.fieldAt (raw-extension-structural-clauses e) i)
semantic-normal-form-for-admissible-structural-field-with-derivation
  F B e admissible i hornDerivation =
  semantic-trace-normal-form-with-derivation F
    (admissible-structural-trace-field-normalizes B e admissible i)
    hornDerivation

trace-normal-form-support-depth :
  {ℓ : Level} {c : RawStructuralClause ℓ} ->
  SemanticTraceNormalForm c ->
  Nat
trace-normal-form-support-depth (unary-action-normal-form p s) = 1
trace-normal-form-support-depth (binary-comparison-normal-form p left right) = 2
trace-normal-form-support-depth (higher-horn-normal-form b package) =
  RawBoundary.historyDepth b

trace-normal-form-primitive-status :
  {ℓ : Level} {c : RawStructuralClause ℓ} ->
  SemanticTraceNormalForm c ->
  TracePrimitiveStatus
trace-normal-form-primitive-status (unary-action-normal-form p s) =
  primitive-trace
trace-normal-form-primitive-status (binary-comparison-normal-form p left right) =
  primitive-trace
trace-normal-form-primitive-status (higher-horn-normal-form b package) =
  derived-trace

unary-action-trace-primitive-candidate :
  {ℓ : Level} ->
  (p : NewPayloadRef) ->
  (s : BasisSite) ->
  trace-normal-form-primitive-status
    (unary-action-normal-form {ℓ = ℓ} p s)
  ≡ primitive-trace
unary-action-trace-primitive-candidate p s = refl

binary-comparison-trace-primitive-candidate :
  {ℓ : Level} ->
  (p : NewPayloadRef) ->
  (left right : BasisSite) ->
  trace-normal-form-primitive-status
    (binary-comparison-normal-form {ℓ = ℓ} p left right)
  ≡ primitive-trace
binary-comparison-trace-primitive-candidate p left right = refl

higher-horn-trace-derived :
  {ℓ : Level} ->
  (b : RawBoundary ℓ) ->
  (package : PackagedHornBoundary b) ->
  trace-normal-form-primitive-status
    (higher-horn-normal-form b package)
  ≡ derived-trace
higher-horn-trace-derived b package = refl
