module Proof.Matcher.Array where

import Proof.Matcher.Core

toStartWith :: Eq a => Matcher [a] [a]
toStartWith = (
		"Expected @actual@ to start with @expected@",
		(\actual expected -> take (length expected) actual == expected)
	)

toEndWith :: Eq a => Matcher [a] [a]
toEndWith = (
		"Expected @actual@ to end with @expected@",
		(\actual expected -> drop ((length actual) - (length expected)) actual == expected)
	)