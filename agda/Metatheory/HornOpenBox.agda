{-# OPTIONS --cubical --safe --guardedness #-}

module Metatheory.HornOpenBox where

open import Agda.Primitive using (Level; lsuc)
open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism using (Iso)

open import CubicalOpenBox.Base
open import CubicalOpenBox.Extension
open import CubicalOpenBox.MissingFaceEquiv
open import Metatheory.RawStructuralSyntax
open import Metatheory.StructuralBoundary

private
  variable
    ℓ : Level

record HornOpenBoxPackage
  (Γlower : RawTelescope (RawStructuralClause ℓ))
  (f : RawStructuralClause ℓ) : SSet (lsuc ℓ) where
  constructor mkHornOpenBoxPackage
  field
    hornBoundary : StructuralBoundary Γlower f
    hornOpenBox : StructuralOpenBox ℓ
    hornPackageOpenExt :
      Iso
        (OpenExt
          (structuralSide hornOpenBox)
          (structuralBase hornOpenBox)
          (structuralOpenBoxAsOpenBox hornOpenBox))
        (OpenExt
          (structuralSide hornOpenBox)
          (structuralBase hornOpenBox)
          (structuralOpenBoxAsOpenBox hornOpenBox))

open HornOpenBoxPackage public

identityHornPackageOpenExt :
  {Γlower : RawTelescope (RawStructuralClause ℓ)}
  {f : RawStructuralClause ℓ} →
  (boundary : StructuralBoundary Γlower f) →
  (ob : StructuralOpenBox ℓ) →
  HornOpenBoxPackage Γlower f
identityHornPackageOpenExt boundary ob =
  mkHornOpenBoxPackage
    boundary
    ob
    (missingFacePackageOpenExtIso
      (structuralSide ob)
      (structuralBase ob)
      (structuralOpenBoxAsOpenBox ob))
