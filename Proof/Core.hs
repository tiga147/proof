module Proof.Core (
	expect,
	runSuite,
	runSuites,
	module Proof.Matchers
) where

import Data.List (partition)

import Proof.Matchers
import Proof.Message.Format

type Passed = [String]
type Failed = [String]
type Suite = [String]

expect :: (Show actual, Show expected) =>  actual -> Matcher actual expected -> expected -> String
expect actual (failMessage, evaluator) expected
	| evaluator actual expected = "Passed"
	| otherwise                 = "Failed: " ++
		(format
			failMessage
			[("@expected@", show expected), ("@actual@", show actual)]
		)

printResults :: (Passed, Failed) -> IO()
printResults (passed, failed) =
	let
		numPassed = length passed
		numFailed = length failed
	in
		(putStrLn . unlines) [
			if (length failed == 0) then "All tests passed.\n" else "There were test failures:\n\n" ++ unlines failed,
			"Passed:\t\t" ++ (show numPassed),
			"Failed:\t\t" ++ (show numFailed),
			"Tests Run:\t" ++ (show (numPassed + numFailed))
		]

runSuite :: Suite -> IO()
runSuite suite = (printResults . partition (=="Passed")) suite

runSuites :: [Suite] -> IO()
runSuites suites = (printResults.merge) $ map (partition (=="Passed")) suites
	where merge xs = foldl1 (\(p, f) (p', f') -> (p++p', f++f')) xs