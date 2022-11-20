module Proof.Matcher.Ord where

import Proof.Matcher.Core

toBeLessThan :: Ord a => Matcher a a
toBeLessThan = ("Expected @actual@ to be < @expected@", (<))

toBeLessThanOrEqualTo :: Ord a => Matcher a a
toBeLessThanOrEqualTo = ("Expected @actual@ to be <= @expected@", (<=))

toBeGreaterThanOrEqualTo :: Ord a => Matcher a a
toBeGreaterThanOrEqualTo = ("Expected @actual@ to be >= @expected@", (>=))

toBeGreaterThan :: Ord a => Matcher a a
toBeGreaterThan = ("Expected @actual@ to be > @expected@", (>))