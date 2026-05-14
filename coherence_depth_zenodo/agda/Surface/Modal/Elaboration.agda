{-# OPTIONS --cubical --safe --guardedness #-}

module Surface.Modal.Elaboration where

open import Agda.Primitive using (lzero)
open import Cubical.Foundations.Prelude

open import Core.Nat renaming (ℕ to Nat)
open import Core.Sequence using ([])
open import Metatheory.Obligations using (Fin; fzero; fsuc; mkSupport)
open import Metatheory.RawStructuralSyntax
open import CaseStudies.Common using (Unit; one; two; three)
open import Surface.Modal.Syntax

four : Nat
four = suc three

five : Nat
five = suc four

modalPayloadAt : Fin two → PayloadField lzero
modalPayloadAt fzero =
  mkPayloadField zero Unit
modalPayloadAt (fsuc fzero) =
  mkPayloadField one Unit

payloadTelescope : RawTelescope (PayloadField lzero)
payloadTelescope =
  mkRawTelescope two modalPayloadAt

modalPayloadRef : NewPayloadRef
modalPayloadRef =
  mkNewPayloadRef zero

siteU : BasisSite
siteU =
  mkBasisSite (mkLayerRef zero) zero

siteEl : BasisSite
siteEl =
  mkBasisSite (mkLayerRef zero) one

siteArr : BasisSite
siteArr =
  mkBasisSite (mkLayerRef one) zero

modalDerivedBoundary : RawBoundary lzero
modalDerivedBoundary =
  mkRawBoundary three (mkSupport zero []) Unit Unit

modalStructuralAt : Fin five → RawStructuralClause lzero
modalStructuralAt fzero =
  act modalPayloadRef siteU
modalStructuralAt (fsuc fzero) =
  act modalPayloadRef siteEl
modalStructuralAt (fsuc (fsuc fzero)) =
  cmp modalPayloadRef siteU siteArr
modalStructuralAt (fsuc (fsuc (fsuc fzero))) =
  cmp modalPayloadRef siteEl siteArr
modalStructuralAt (fsuc (fsuc (fsuc (fsuc fzero)))) =
  horn modalDerivedBoundary

structuralTelescope : RawTelescope (RawStructuralClause lzero)
structuralTelescope =
  mkRawTelescope five modalStructuralAt

emptyAlgebraicTelescope : RawTelescope (AlgebraicPayloadField lzero)
emptyAlgebraicTelescope =
  mkRawTelescope zero (λ ())

modalExportPolicy : ExportPolicy
modalExportPolicy =
  mkExportPolicy exported exported hidden

elabModal : ModalDecl → RawExtension lzero
elabModal E =
  mkRawExtension
    payloadTelescope
    structuralTelescope
    emptyAlgebraicTelescope
    modalExportPolicy

payloadClauseCount : ModalDecl → Nat
payloadClauseCount E =
  RawTelescope.fieldCount (raw-extension-payload-fields (elabModal E))

primitiveTraceClauseCount : ModalDecl → Nat
primitiveTraceClauseCount E = four

derivedHornClauseCount : ModalDecl → Nat
derivedHornClauseCount E = one
