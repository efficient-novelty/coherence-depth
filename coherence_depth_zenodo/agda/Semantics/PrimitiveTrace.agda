{-# OPTIONS --cubical --safe --guardedness #-}

module Semantics.PrimitiveTrace where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude

open import Core.Nat renaming (ℕ to Nat)
open import Core.Sequence using ([])
open import Metatheory.Obligations using (_≤_; HistoricalSupport; mkSupport)
open import Semantics.CubicalFoundation

data TracePayloadClass : Type where
  structural-trace payload-trace : TracePayloadClass

data TracePrimitiveStatus : Type where
  primitive-trace derived-trace : TracePrimitiveStatus

data TraceRole : Type where
  unary-action binary-comparison higher-horn higher-user-payload : TraceRole

record PrimitiveTrace {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ) : Type (lsuc ℓ) where
  constructor mkPrimitiveTrace
  field
    traceCarrier : Type ℓ
    traceSupportDepth : Nat
    traceHistoricalSupport : HistoricalSupport traceSupportDepth
    traceClass : TracePayloadClass
    traceStatus : TracePrimitiveStatus
    traceRole : TraceRole

open PrimitiveTrace public

StructuralTrace :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  PrimitiveTrace F ->
  Type
StructuralTrace t =
  traceClass t ≡ structural-trace

PayloadTrace :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  PrimitiveTrace F ->
  Type
PayloadTrace t =
  traceClass t ≡ payload-trace

PrimitiveTraceField :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  PrimitiveTrace F ->
  Type
PrimitiveTraceField t =
  traceStatus t ≡ primitive-trace

DerivedTraceField :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  PrimitiveTrace F ->
  Type
DerivedTraceField t =
  traceStatus t ≡ derived-trace

TraceHistoricalArity :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  PrimitiveTrace F ->
  Nat
TraceHistoricalArity t =
  HistoricalSupport.arity (traceHistoricalSupport t)

record PrimitiveTraceDepthAtMost {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ) (d : Nat) : Type (lsuc ℓ) where
  field
    every-primitive-structural-trace :
      (t : PrimitiveTrace F) ->
      StructuralTrace t ->
      PrimitiveTraceField t ->
      traceSupportDepth t ≤ d

open PrimitiveTraceDepthAtMost public

record BinaryTraceNecessary {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ) : Type (lsuc ℓ) where
  field
    binaryWitness : PrimitiveTrace F
    binaryWitnessStructural : StructuralTrace binaryWitness
    binaryWitnessPrimitive : PrimitiveTraceField binaryWitness
    binaryWitnessDepthTwo : traceSupportDepth binaryWitness ≡ 2

open BinaryTraceNecessary public

record PrimitiveTraceDepthExactly {ℓ : Level}
  (F : SemanticCubicalFoundation ℓ) (d : Nat) : Type (lsuc ℓ) where
  field
    atMost : PrimitiveTraceDepthAtMost F d
    lowerBound : BinaryTraceNecessary F

open PrimitiveTraceDepthExactly public

higher-hit-constructor-as-payload :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  Type ℓ ->
  Nat ->
  PrimitiveTrace F
higher-hit-constructor-as-payload Carrier arity =
  mkPrimitiveTrace
    Carrier
    arity
    (mkSupport zero [])
    payload-trace
    primitive-trace
    higher-user-payload

higher-hit-payload-not-structural-trace :
  {ℓ : Level} {F : SemanticCubicalFoundation ℓ} ->
  (Carrier : Type ℓ) ->
  (arity : Nat) ->
  PayloadTrace (higher-hit-constructor-as-payload {F = F} Carrier arity)
higher-hit-payload-not-structural-trace Carrier arity = refl
