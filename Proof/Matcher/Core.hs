module Proof.Matcher.Core where

type FailMessage = String
type Evaluator actual expected = actual -> expected -> Bool
type Matcher actual expected = (FailMessage, Evaluator actual expected)

toBe :: Eq a => Matcher a a
toBe = ("Expected <@actual@> to be <@expected@>", (==))

toNotBe :: Eq a => Matcher a a
toNotBe = ("Expected <@actual@> to not be <@expected@>", (/=))