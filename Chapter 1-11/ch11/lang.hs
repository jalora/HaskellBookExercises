module Language where
import Data.Char
import Data.List.Split
import Data.List

capitalizeWord :: String -> String
capitalizeWord ""      = ""
capitalizeWord (' ':xs) = ' ' : capitalizeWord xs
capitalizeWord (x:xs)   = toUpper x : xs

capitalizeParagraph :: String -> String
capitalizeParagraph str = intercalate "." ucWords
 where listify             = wordsBy (== '.') str
       ucWords             = map capitalizeWord listify
