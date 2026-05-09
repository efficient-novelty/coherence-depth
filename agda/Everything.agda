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
import Test.PresentationInvariance.Smoke
import Test.PresentationInvariance.RebundleRecord
import Test.PresentationInvariance.SplitShell
import Test.PresentationInvariance.CurryUncurry
import Test.PresentationInvariance.TransparentAlias
import Test.PresentationInvariance.DuplicateTrace
import Test.Fibonacci
