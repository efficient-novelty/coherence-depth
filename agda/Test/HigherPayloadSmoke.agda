{-# OPTIONS --cubical --safe --guardedness #-}

module Test.HigherPayloadSmoke where

open import CaseStudies.HigherPayload

higher-payload-classification-smoke =
  higher-payload-not-structural-trace

higher-payload-zero-trace-smoke =
  higher-payload-zero-trace
