module Proof.Message.Format (
	format
)
where

type Find = String
type Replace = String
type Substitution = (Find, Replace)

startsWith :: String -> String -> Bool
text `startsWith` find = take (length find) text == find

substitute :: String -> Substitution -> String
substitute ""    _ = ""
substitute text substitution@(find, replace)
	| text `startsWith` find = replace ++ substitute (drop (length find) text) substitution
	| otherwise              = (head text) : substitute (tail text) substitution

format :: String -> [Substitution] -> String
format ""    _ = ""
format text [] = text
format text (substitution:substitutions) = format (substitute text substitution) substitutions

		