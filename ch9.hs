-- Chapter 9: Lists Exercises
module Learn where
import Data.Char
--Exercise: EnumFromTo

eftBool :: Bool -> Bool -> [Bool]
eftBool b b' = [b, b']

-- Orders Int, Char, and Ordering
eftIntChar :: (Enum a, Eq a) => a -> a -> [a]
eftIntChar x x' = enumFromTo' x x' []
 where enumFromTo' frst lst enum
           | frst == lst  = lst : enum
           | otherwise = enumFromTo' frst (pred lst) enum'
            where enum' = lst : enum

--Exercises: Thy Fearful Symmetry
-- (Handles all three questions)

-- Had to implement a new "tail" function to handle
-- the special case of empty list which returns
-- an exception for the predefined "tail" func
tail' :: [a] -> [a]
tail' (_:xs) = xs
tail' _ = []

-- Another recursive solution. Only way I could think
-- of detecting arbitrary amounts of ' ' or '\n' without
-- using a predefined function. "reverse" func is required
-- since elements are added to the left when using
-- "construct" operator (i.e. a : [a]).
splitSentence :: String -> Char -> [String]
splitSentence str sep = listify str sep []
 where listify s sep' lst
           | s == []   = reverse lst
           | otherwise = listify s' sep' lst'
            where s'   = tail' (dropWhile (/= sep') s)
                  -- appends from left
                  lst' = takeWhile (/= sep') s : lst

-- Filtering Exercise
-- Remove articles in sentence
myFilter :: String -> [String]
myFilter listSent = filter (\s -> (s /= "the") &&
                (s /= "a") && (s /= "an")) listSent'
                 where listSent' = splitSentence listSent ' '
                 -- splitSentence can also be replaced
                 -- by the predefined func "word"

---- Zipping Exercise
-- Implement own version of zip
myZip :: [a] -> [b] -> [(a, b)]
myZip [] _ = []
myZip _ [] = []
myZip (x:xs) (y:ys) = (x, y) : myZip xs ys

-- Implement zipWith without using myZip
-- Uncurry in order to take tuple as argument
myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ [] _ = []
myZipWith _ _ [] = []
myZipWith f (x:xs) (y:ys) = uncurry f (x, y) : myZipWith f xs ys

-- Implement zip using myZipWidth
-- Must curry so that "id" only detects
-- one argument.
myZip' :: [a] -> [b] -> [(a, b)]
myZip' [] _ = []
myZip' _ [] = []
myZip' xs ys = myZipWith (curry id) xs ys

---- End of Chapter Exercises ----
-- Uppercase first letter
upperFst :: String -> String
upperFst (x:xs) = toUpper x : xs

-- Uppercase all letters of word
upperAll :: String -> String
upperAll (x : []) = toUpper x : []
upperAll (x:xs) = toUpper x : upperAll xs

-- Get first letter and uppercase
returnUpFst :: String -> Char
returnUpFst xs = toUpper (head xs)
-- pointfree version
returnUpFst' :: String -> Char
returnUpFst' = toUpper . head

-- Standard Functions
--1) myOr: returns True if any Bool in the list is True
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) =
 case x of
  True -> True
  False -> myOr xs

--2) myAny: returns True is a -> Bool applied any of the values
-- in the list returns True

-- non-recursive
myAny :: (a -> Bool) -> [a] -> Bool
myAny f xs = myOr (map f xs)

-- recursive
myAny' :: (a -> Bool) -> [a] -> Bool
myAny' _ [] = False
myAny' f (x:xs) =
 case f x of
  True -> True
  False -> myAny' f xs

-- 3) Write recursive myElem, which implements 'elem' and
-- returns whether an element is part of string
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem c (x:xs) =
 case x == c of
  True -> True
  False -> myElem c xs

-- 4) Implement myReverse
myReverse :: [a] -> [a]
myReverse [] = []
myReverse xs = last xs : myReverse xs'
 where xs' = init xs

-- 5) 'squish' flattens a list of lists into a list
-- aka implement 'concat'
squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

-- 6) 'squishMap' maps a function over a list and concats
-- the results aka implement 'concatMap'
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

-- 7) 'squishAgain' implements 'squish' but using
-- 'squishMap' defined above
squishAgain :: [[a]] -> [a]
squishAgain [] = []
squishAgain xs = squishMap id xs

-- 8) implement 'myMaximumBy', which returns the number which
-- returned the LAST 'GT' from a comparison function
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ (x:[]) = x
myMaximumBy f (x:xs) = myMaximumBy f
                          (if f x (head xs) == GT then x : tail xs else xs)

-- 9) implement 'myMininmumBy', which is the opposite of the
-- above function (returns LAST number returning 'LT')
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ (x:[]) = x
myMinimumBy f (x:xs) = myMinimumBy f
                          (if f x (head xs) == LT then x : tail xs else xs)
