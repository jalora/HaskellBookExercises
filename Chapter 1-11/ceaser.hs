module Cipher where
import Data.Char

-- shift n right
rshiftn :: Integral a => a -> [a] -> [a]
rshiftn n xs = map wrap (rShifted)
 where rShifted = map (+n) xs

-- shift n left
lshiftn :: Integral a => a -> [a] -> [a]
lshiftn n xs = map wrap (lShifted)
 where lShifted = map (+ negate n) xs

-- wrap alphabet ('a' = 97), ('z' = 122)
wrap :: Integral a => a -> a
wrap 122 = 122
wrap 97  = 97
wrap x
   | x > 122                = 96 + mod x 122
   | (x < 97) && (x > 58)   = 123 - mod 97 x
   | otherwise              = mod x 122

caeser :: Int -> String -> String
caeser n str = map chr newCipher
 where strToInt = map ord str
       newCipher = (rshiftn n) strToInt

unCaeser :: Int -> String -> String
unCaeser n str = map chr plain
 where strToInt = map ord str
       plain = (lshiftn n) strToInt
