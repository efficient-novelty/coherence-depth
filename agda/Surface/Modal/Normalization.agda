{-# OPTIONS --cubical --safe --guardedness #-}

module Surface.Modal.Normalization where

open import Cubical.Foundations.Prelude

open import Core.Nat renaming (ℕ to Nat)
open import CaseStudies.Common using (one; two)
open import Surface.Modal.Syntax
open import Surface.Modal.Elaboration using (four; payloadClauseCount; primitiveTraceClauseCount; derivedHornClauseCount)

modalPayloadCount : ModalDecl → Nat
modalPayloadCount E =
  payloadClauseCount E

modalPrimitiveTraceCount : ModalDecl → Nat
modalPrimitiveTraceCount E =
  primitiveTraceClauseCount E

modalDerivedHornCount : ModalDecl → Nat
modalDerivedHornCount E =
  derivedHornClauseCount E

muModal : ModalDecl → Nat
muModal E =
  modalPrimitiveTraceCount E

explicitHornDoesNotChangeMu :
  (Emin Eexplicit : ModalDecl) →
  hornPresentation Emin ≡ synthesized →
  hornPresentation Eexplicit ≡ explicit →
  muModal Emin ≡ muModal Eexplicit
explicitHornDoesNotChangeMu Emin Eexplicit minProof expProof = refl
