-- Chapter 8 Exercises
module Learn where
import Data.List (intersperse)

-- Recursion Exercises
--1)
dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = intDiv num denom 0
 where intDiv n d i
        | (n < d)   = (i, n)
        | otherwise =
           intDiv (n - d) d (i + 1)

--2)
sumAll :: (Eq a, Num a) => a -> a
sumAll n = doSum n [1] 1
 where doSum x lst i
         | i == x    = foldr (+) 0 lst
         | otherwise =
            doSum x (i + 1 : lst) (i + 1)

--3)
nSquared :: (Integral a) => a -> a
nSquared n = doSquare n 0 0
 where doSquare x y i
         | i == x    = y
         | otherwise =
             doSquare x (x + y) (i + 1)

-- Fixing dividedBy Exercise (handle negatives and 0s)
xnor :: Bool -> Bool -> Bool
xnor True True = True
xnor True False = False
xnor False True = False
xnor False False = True

data DividedResult =
     Result (Integer, Integer)
   | DividedByZero
   deriving (Show, Eq)
-- Can't use first type sig since data type of "Result" requires
-- "a" be a concrete type
--dividedByFixed :: Integral a => a -> a -> DividedResult
dividedByFixed :: Integer -> Integer -> DividedResult
dividedByFixed _ 0 = DividedByZero
dividedByFixed num denom = intDiv (abs num - abs denom) num denom 0
 where intDiv diff n d i
        | (diff < 0) && (isPos)     = Result (i, diff + abs d)
        | (diff < 0) && (not isPos) = Result (-i, -(diff + abs d))
        | otherwise =
           intDiv (diff - abs d) n d (i + 1)
         where isPos = xnor (n < 0) (d < 0)

-- McCarthy 91 Function
mc91 :: Integral a => a -> a
mc91 n
        | n > 100  = n - 10
        | otherwise = mc91 . mc91 $ (n + 11)

-- Final Exercise: Integers to Words
digitsToWords :: Int -> String
digitsToWords n =
 case n of
  1 -> "one"
  2 -> "two"
  3 -> "three"
  4 -> "four"
  5 -> "five"
  6 -> "six"
  7 -> "seven"
  8 -> "eight"
  9 -> "nine"
  _ -> "zero"

digits :: Int -> [Int]
digits n = listify n []
 where listify d l
        | d < 10    = d : l
        | otherwise = listify d' l'
         where d' = d `div` 10
               l' = (d `mod` 10) : l

numToWords :: Int -> String
numToWords ds = concat $
        intersperse "-" $ map digitsToWords (digits ds)
