{-# OPTIONS --cubical --safe --guardedness #-}

module Everything where

import PEN

import Semantics.CubicalFoundation
import Semantics.SealedExtension
import Semantics.PrimitiveTrace
import Semantics.RawAdequacy
import Semantics.TraceNormalForm
import Semantics.SemanticHornReduction
import Semantics.DepthUpperBound
import Semantics.DepthLowerBound
import Semantics.ExactDepth
import Semantics.ChronologicalWindow
import Semantics.FullCoupling
import Semantics.ScalingRecurrence
import Semantics.FibonacciScaling

import CubicalOpenBox.Base
import CubicalOpenBox.Explicit
import CubicalOpenBox.FaceSystem
import CubicalOpenBox.Extension
import CubicalOpenBox.Center
import CubicalOpenBox.Contractible
import CubicalOpenBox.MissingFaceEquiv
import CubicalOpenBox.Substitution
import Metatheory.StructuralHornShape
import Metatheory.StructuralHornToOpenBox
import Metatheory.StructuralBoundary
import Metatheory.HornOpenBox
import Metatheory.HornElaboration
import Metatheory.DerivedTrace
import Metatheory.ReplaceDerivedField
import Metatheory.NormalizationDerived

import CaseStudies.Common
import CaseStudies.UniverseExtension
import CaseStudies.GlobalModality
import CaseStudies.PromotedInterface
import CaseStudies.SparseDatatype
import CaseStudies.HigherPayload

import Test.MetatheorySmoke
import Test.SurfaceBridgeSmoke
import Test.ActiveBasisExamples
import Test.SparseRecurrenceSmoke
import Test.SemanticFixtureSmoke
import Test.HigherPayloadSmoke
import Test.SemanticDepthSmoke
import Test.FibonacciScalingSmoke
import Test.CubicalOpenBox.FlatArrHorn
import Test.CubicalOpenBox.NaturalitySmoke
import Test.CubicalOpenBox.ClosedBoundaryNotClaimed
import Test.RawHornNoDerivedTag
import Surface.Modal.Syntax
import Surface.Modal.Typing
import Surface.Modal.Routes
import Surface.Modal.Elaboration
import Surface.Modal.Normalization
import Surface.Modal.Adequacy
import Test.Surface.ModalAdequacySmoke
import Test.PresentationInvariance.Smoke
import Test.PresentationInvariance.RebundleRecord
import Test.PresentationInvariance.SplitShell
import Test.PresentationInvariance.CurryUncurry
import Test.PresentationInvariance.TransparentAlias
import Test.PresentationInvariance.DuplicateTrace
import Test.Fibonacci
