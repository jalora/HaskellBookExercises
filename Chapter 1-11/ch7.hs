-- Chapter 7: functions

module Learn where

-- Exercise: Grab Bag
-- Rewrite inline functions using lambda syntax
addOneIfOdd :: Integral a => a -> a
addOneIfOdd n = case odd n of
 True -> f n
 False -> n
 where f = \a -> a + 1

addFive :: (Ord a, Num a) => a -> a -> a
addFive =
 (\x -> \y -> (if x > y then y else x) + 5)
 :: (Ord a, Num a) => a -> a -> a

mflip :: (a -> b -> c) -> b -> a -> c
mflip f = \x -> \y -> f y x

mflip' :: (a -> b -> c) -> b -> a -> c
mflip' f x y = f y x
-- Use this as input to mflip and mflip'
--g :: Fractional a => a -> a -> a
--g x y = x / y

-- Exercise: Case Practice

-- Rewrite functionC x y = (if x > y then y else x)
functionC :: Ord a => a -> a -> a
functionC x y =
 case (x > y) of
  True -> y
  False -> x

-- Rewrite: ifEvenAdd2 n = if even n then
--              n + 2 else n
ifEvenAdd2 :: Integral a => a -> a
ifEvenAdd2 n =
 case even n of
  True -> n + 2
  False -> n

nums :: (Num a, Ord a) => a -> Integer
nums x =
 case compare x 0 of
  LT -> -1
  GT -> 1
  _ -> 0

-- End of Chapter Exercises
-- 1)
divMod' = uncurry divMod
--tensDigit :: Integral a => a -> a
tensDigit x = d
 where d = y `mod` 10
     --y = fst (divMod x 10)
       y = (fst . divMod') (x, 10)
       --Requires Integer -> Integer
     --y = (fst . uncurry divMod) (x, 10)

hunsD x = d2
 where d2 = y `mod` 10
       y  = fst (divMod x 100)

-- 2)
-- Guard
foldBool :: a -> a -> Bool -> a
foldBool x y cond
  | cond == False = x
  | otherwise = y

-- case
foldBool' :: a -> a -> Bool -> a
foldBool' x y cond =
 case cond of
  False -> x
  _     -> y

-- 3)
g :: (a -> b) -> (a, c) -> (b, c)
g f (x, y) = (f x, y)

-- 4), 5), 6)
roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)
roundTrip' :: (Show a, Read a) => a -> a
roundTrip' = read . show
roundTrip'' :: (Show a, Read b) => a -> b
roundTrip'' = read . show

main = do
 -- 4)
 print (roundTrip 4)
 -- 5)
 print (roundTrip' 4)
 -- 6) If "a" doesn't have instance of read, we must
 -- specify type of read so it knows to convert
 -- back to stated type, after show converts to string
 print (roundTrip'' 4 :: Int)
