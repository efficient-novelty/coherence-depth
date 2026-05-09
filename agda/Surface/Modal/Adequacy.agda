{-# OPTIONS --cubical --safe --guardedness #-}

module Surface.Modal.Adequacy where

open import Agda.Primitive using (lzero)
open import Cubical.Foundations.Prelude

open import CaseStudies.Common using (Unit; tt; one; two)
open import Metatheory.Obligations using (Fin; fzero; fsuc)
open import CubicalOpenBox.Base
open import Metatheory.StructuralBoundary
open import Metatheory.HornOpenBox
open import Metatheory.HornElaboration
open import Metatheory.DerivedTrace
open import Metatheory.NormalizationDerived
open import Metatheory.RawStructuralSyntax
open import Surface.Modal.Syntax
open import Surface.Modal.Elaboration
open import Surface.Modal.Normalization

modalLowerStructuralAt : Fin four → RawStructuralClause lzero
modalLowerStructuralAt fzero =
  act modalPayloadRef siteU
modalLowerStructuralAt (fsuc fzero) =
  act modalPayloadRef siteEl
modalLowerStructuralAt (fsuc (fsuc fzero)) =
  cmp modalPayloadRef siteU siteArr
modalLowerStructuralAt (fsuc (fsuc (fsuc fzero))) =
  cmp modalPayloadRef siteEl siteArr

modalLowerTraceTelescope : RawTelescope (RawStructuralClause lzero)
modalLowerTraceTelescope =
  mkRawTelescope four modalLowerStructuralAt

modalHornClause : RawStructuralClause lzero
modalHornClause =
  horn modalDerivedBoundary

modalHornBoundary : StructuralBoundary modalLowerTraceTelescope modalHornClause
modalHornBoundary =
  mkStructuralBoundary refl Unit Unit Unit Unit

modalHornSide : I → Partial i1 Unit
modalHornSide i =
  λ _ → tt

modalHornBase : Unit [ i1 ↦ modalHornSide i0 ]
modalHornBase =
  inS tt

modalHornOpenBox : StructuralOpenBox lzero
modalHornOpenBox =
  mkStructuralOpenBox Unit i1 modalHornSide modalHornBase

modalHornPackage : HornOpenBoxPackage modalLowerTraceTelescope modalHornClause
modalHornPackage =
  identityHornPackageOpenExt modalHornBoundary modalHornOpenBox

modalHornElaborationInput :
  HornElaborationInput modalLowerTraceTelescope modalHornClause
modalHornElaborationInput =
  mkHornElaborationInput
    modalHornPackage
    Unit
    tt
    Unit
    tt
    Unit
    tt
    tt
    refl

modalHornSemanticDerivation :
  HornSemanticDerivation modalLowerTraceTelescope modalHornClause
modalHornSemanticDerivation =
  structuralHornElaboration modalHornElaborationInput

modalNormalizationDerivedWitness :
  NormalizationDerivedWitness modalLowerTraceTelescope modalHornClause
modalNormalizationDerivedWitness =
  normalizationDerivedWitness modalHornSemanticDerivation

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

modal-explicit-horn-elaborates-through-HornElaboration :
  (E : ModalDecl) →
  hornPresentation E ≡ explicit →
  HornSemanticDerivation modalLowerTraceTelescope modalHornClause
modal-explicit-horn-elaborates-through-HornElaboration E explicitProof =
  modalHornSemanticDerivation

modal-omitted-horn-inserts-derived-term :
  (E : ModalDecl) →
  hornPresentation E ≡ synthesized →
  HornSemanticDerivation modalLowerTraceTelescope modalHornClause
modal-omitted-horn-inserts-derived-term E synthesizedProof =
  modalHornSemanticDerivation

modal-explicit-and-omitted-horn-same-derived-term :
  (Emin Eexplicit : ModalDecl) →
  (synthesizedProof : hornPresentation Emin ≡ synthesized) →
  (explicitProof : hornPresentation Eexplicit ≡ explicit) →
  replacementTerm
    (hornDerivedTrace
      (modal-omitted-horn-inserts-derived-term Emin synthesizedProof))
  ≡
  replacementTerm
    (hornDerivedTrace
      (modal-explicit-horn-elaborates-through-HornElaboration Eexplicit explicitProof))
modal-explicit-and-omitted-horn-same-derived-term
  Emin Eexplicit synthesizedProof explicitProof =
  refl
