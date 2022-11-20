Proof
=====

Really simple unit testing in Haskell

Example Usage:

```haskell
module Main where

import Proof.Core

main :: IO ()
main = runSuites
	[
		[
			expect 2.3 toRoundTo 2,
			expect "a" toBe "a",
			expect True toNotBe False
		],
		[
			expect (head [1..10]) toBe 1,
			expect (tail [1..10]) toBe [2..10],
			expect [1, 2, 3] toStartWith [1],
			expect "The rain in Spain" toEndWith "Spain"
		],
		[
			expect 1.0 toBeLessThan 0x12,
			expect 3 toBeLessThanOrEqualTo 3.0,
			expect 'a' toBeLessThanOrEqualTo 'b',
			expect 4 toBeGreaterThan 3,
			expect 'D' toBeGreaterThanOrEqualTo 'C',
			expect "D" toBeGreaterThanOrEqualTo "D"
		]
	]
```
