{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.TraceNormalForm where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

open import Core.Nat renaming (ℕ to Nat)
open import Metatheory.RawStructuralSyntax
open import Metatheory.RawStructuralTyping
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
