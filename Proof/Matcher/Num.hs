module Proof.Matcher.Num where

import Proof.Matcher.Core

toRoundTo :: Matcher Float Int
toRoundTo = ("Expected <@actual@> to round to <@expected@>", (\actual expected -> round actual == expected))