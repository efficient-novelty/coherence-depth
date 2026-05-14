{-# OPTIONS --cubical --safe --guardedness #-}

module Test.SparseRecurrenceSmoke where

open import Metatheory.SparseDependencyRecurrence
open import Metatheory.FullCouplingEnvelope

coupling-footprint-surface = CouplingFootprint
sparse-footprint-surface = SparseFootprint
full-footprint-surface = FullFootprint
footprint-window-bound-theorem = footprint-window-bound
sparse-windowed-context-surface = SparseWindowedContext
sparse-windowed-recurrence-surface = SparseWindowedRecurrence
sparse-windowed-recurrence-theorem = sparse-windowed-recurrence
transparent-zero-footprint-surface = TransparentZeroFootprint
transparent-growth-zero-footprint-theorem =
  transparent-growth-zero-footprint
orthogonal-zero-or-sparse-surface = ZeroOrSparseFootprint
orthogonal-extension-zero-or-sparse-theorem =
  orthogonal-extension-zero-or-sparse
orthogonal-extension-below-full-envelope-theorem =
  orthogonal-extension-below-full-envelope
full-coupling-envelope-surface = FullCouplingEnvelope
full-coupling-envelope-theorem = full-coupling-envelope
full-coupling-envelope-is-full-footprint-theorem =
  full-coupling-envelope-is-full-footprint
full-coupling-specializes-sparse-recurrence-theorem =
  full-coupling-specializes-sparse-recurrence
full-coupling-depth-two-affine-law-theorem =
  full-coupling-depth-two-affine-law
semantic-full-coupling-window-iso-theorem =
  semantic-full-coupling-window-iso
semantic-full-coupling-cardinality-envelope-theorem =
  semantic-full-coupling-cardinality-envelope
