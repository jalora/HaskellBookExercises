
module AsPatterns where
import Data.Char

--1) Return True iff all values in the first list appear
-- in the second list, preserving the order of the first list
isSubseqOf :: (Eq a)
           => [a]
           -> [a]
           -> Bool
isSubseqOf seq word = doSubseqOf seq word == seq
 where doSubseqOf [] _ = []
       doSubseqOf _ [] = []
       doSubseqOf qs@(x:xs) (y:ys)
        | x == y    = y : doSubseqOf xs ys
        | otherwise = doSubseqOf qs ys

--2) Split a sentence into words, then tuple each word
-- with capitalized form of each.
-- ** Refactor using "words" function (listify a string)
capitalizeWords []  = []
capitalizeWords str = (strHead, ucStrHead) : capitalizeWords strTail
 where notSpace = (/= ' ')
       strHead   = takeWhile notSpace str
       ucStrHead = (toUpper . head $ strHead) : tail strHead
       strTail   = if elem ' ' str then
                    tail (dropWhile notSpace str)
                   else dropWhile notSpace str
