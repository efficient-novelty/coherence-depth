{-# OPTIONS --cubical --safe --guardedness #-}

module Test.Surface.ModalAdequacySmoke where

open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism using (Iso; isoToPath)

open import CaseStudies.Common using (Unit; tt; unit-is-prop)
open import Surface.Modal.Syntax
open import Surface.Modal.Adequacy
open import Surface.Modal.Normalization
open import Surface.Modal.Elaboration using (four)
open import Metatheory.DerivedTrace
open import Metatheory.HornElaboration
  using ( elaborationMode
        ; hornCubicalData
        ; remote-comparison-horn
        ; substitutionStableDerivedness
        ; hornElaborationSubstitutionStable
        )
open import Metatheory.NormalizationDerived
  using ( finiteDependencyOrderTerminates
        ; muCountsOnlyPayloadAndIrreducibleUnaryBinary
        ; normalizationTerminatesBecauseReplacementsUseLowerData
        ; normalizationMuCountsOnlyPayloadAndIrreducibleUnaryBinary
        )

unit-function-iso : Iso Unit (Unit → Unit)
unit-function-iso = record
  { fun = λ _ _ → tt
  ; inv = λ _ → tt
  ; rightInv = λ f → funExt (λ { tt → unit-is-prop tt (f tt) })
  ; leftInv = λ { tt → refl }
  }

unit-function-path : Unit ≡ (Unit → Unit)
unit-function-path =
  isoToPath unit-function-iso

modal-oldU : OldU
modal-oldU =
  mkOldU Unit (λ _ → Unit) (λ _ _ → tt) (λ _ _ → unit-function-path)

modal-payload : ModPayload
modal-payload =
  mkModPayload (λ A → A) (λ A x → x)

modal-trace : ModTrace modal-oldU modal-payload
modal-trace =
  mkModTrace
    (λ _ → tt)
    (λ _ → refl)
    (λ _ _ → refl)
    (λ _ _ → refl)

minimal-modal : ModalDecl
minimal-modal =
  minimalModalDecl modal-oldU modal-payload modal-trace

explicit-modal : ModalDecl
explicit-modal =
  explicitHornModalDecl modal-oldU modal-payload modal-trace

minimal-modal-primitive-count :
  modalPrimitiveTraceCount minimal-modal ≡ four
minimal-modal-primitive-count =
  modal-primitive-trace-preserved minimal-modal

explicit-horn-does-not-change-mu-smoke :
  muModal minimal-modal ≡ muModal explicit-modal
explicit-horn-does-not-change-mu-smoke =
  explicit-horn-presentation-invariant
    minimal-modal
    explicit-modal
    refl
    refl

explicit-horn-elaborates-through-HornElaboration-smoke :
  HornSemanticDerivation modalLowerTraceTelescope modalHornClause
explicit-horn-elaborates-through-HornElaboration-smoke =
  modal-explicit-horn-elaborates-through-HornElaboration explicit-modal refl

modal-horn-elaboration-mode-smoke :
  elaborationMode (hornCubicalData modalHornElaborationInput)
  ≡ remote-comparison-horn
modal-horn-elaboration-mode-smoke = refl

modal-horn-substitution-stable-smoke :
  substitutionStableDerivedness (hornCubicalData modalHornElaborationInput)
modal-horn-substitution-stable-smoke =
  hornElaborationSubstitutionStable modalHornElaborationInput

modal-normalization-terminates-smoke :
  finiteDependencyOrderTerminates modalDependencyOrderedNormalization
modal-normalization-terminates-smoke =
  normalizationTerminatesBecauseReplacementsUseLowerData
    modalDependencyOrderedNormalization

modal-normalization-mu-boundary-smoke :
  muCountsOnlyPayloadAndIrreducibleUnaryBinary
    modalDependencyOrderedNormalization
modal-normalization-mu-boundary-smoke =
  normalizationMuCountsOnlyPayloadAndIrreducibleUnaryBinary
    modalDependencyOrderedNormalization

omitted-horn-inserts-same-derived-term-smoke :
  replacementTerm
    (hornDerivedTrace
      (modal-omitted-horn-inserts-derived-term minimal-modal refl))
  ≡
  replacementTerm
    (hornDerivedTrace
      (modal-explicit-horn-elaborates-through-HornElaboration explicit-modal refl))
omitted-horn-inserts-same-derived-term-smoke =
  modal-explicit-and-omitted-horn-same-derived-term
    minimal-modal
    explicit-modal
    refl
    refl

rebundled-trace-preserves-mu-smoke :
  muModal minimal-modal ≡ muModal (minimalModalDecl modal-oldU modal-payload modal-trace)
rebundled-trace-preserves-mu-smoke = refl
