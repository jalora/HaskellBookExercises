--Ch 3 Exercises

module Learn where

-- Exercise number 2
  --(a)
  exclaim n = n ++ "!"

  --(b)
  returnFifth n = [n !! 4]

  --(c)
  dropfirstNine n = drop 9 n

-- Exercise number 3
  thirdLetter :: String -> Char
  thirdLetter x =
   x !! 2

-- Ex number 4
  xthLetter :: Int -> Char
  xthLetter x =
   "Curry is awesome!" !! (x-1)

-- Ex number 5
  rvrs :: String -> String
  rvrs x = (drop 9 x) ++ " is " ++ (take 5 x)
