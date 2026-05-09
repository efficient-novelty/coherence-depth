{-# OPTIONS --cubical --safe --guardedness #-}

module Surface.Modal.Adequacy where

open import Agda.Primitive using (lzero)
open import Cubical.Foundations.Prelude

open import CaseStudies.Common using (one; two)
open import Metatheory.RawStructuralSyntax
open import Surface.Modal.Syntax
open import Surface.Modal.Elaboration
open import Surface.Modal.Normalization

modal-elaboration-sound :
  (E : ModalDecl) → RawExtension lzero
modal-elaboration-sound =
  elabModal

modal-payload-preserved :
  (E : ModalDecl) →
  modalPayloadCount E ≡ two
modal-payload-preserved E = refl

modal-primitive-trace-preserved :
  (E : ModalDecl) →
  modalPrimitiveTraceCount E ≡ four
modal-primitive-trace-preserved E = refl

modal-derived-horn-preserved :
  (E : ModalDecl) →
  modalDerivedHornCount E ≡ one
modal-derived-horn-preserved E = refl

modal-support-preserved :
  (E : ModalDecl) →
  primitiveTraceClauseCount E ≡ modalPrimitiveTraceCount E
modal-support-preserved E = refl

modal-mu-preserved :
  (E : ModalDecl) →
  muModal E ≡ primitiveTraceClauseCount E
modal-mu-preserved E = refl

explicit-horn-presentation-invariant :
  (Emin Eexplicit : ModalDecl) →
  hornPresentation Emin ≡ synthesized →
  hornPresentation Eexplicit ≡ explicit →
  muModal Emin ≡ muModal Eexplicit
explicit-horn-presentation-invariant =
  explicitHornDoesNotChangeMu
