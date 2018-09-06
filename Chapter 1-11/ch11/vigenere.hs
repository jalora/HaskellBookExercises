-- Vigenere cipher

module Learn where
import Data.Char

data Option = Encode | Decode deriving (Eq, Show)
type Message = String
type Key = String
type MsgChar = Char
type KeyChar = Char

vigenere :: Message -> Key -> Option -> String
vigenere str key opt =
  zipWith' (shiftFromWith opt) ' ' str parsedKey
   where parsedKey = parseKey str key

wrapHelper :: (Int -> Int -> Int)
              -> MsgChar
              -> KeyChar
              -> Int
wrapHelper f char kchr = lcWrap $ f (ord char) (mod kOrd lcBord)
   where kOrd = ord kchr
         lcBord = ord 'a'

lcWrap :: Int -> Int
lcWrap x
  | x == a             = a
  | x == z             = z
  | x > z              = (a - 1) + mod x z
  | x < a              = (z + 1) - mod a x
  | otherwise          = mod x z
   where a = ord 'a'
         z = ord 'z'

ucWrap :: Int -> Int
ucWrap x
  | x == upperA        = upperA
  | x == upperZ        = upperZ
  | x > upperZ         = (upperA - 1) + mod x upperZ
  | x < upperA         = (upperZ + 1) - mod upperA x
  | otherwise          = mod x upperZ
   where upperA = ord 'A'
         upperZ = ord 'Z'

parseKey :: Message -> Key -> String
parseKey str key = take x key'
   where key'   = concat (replicate factor key)
         factor = (div x y) + 1
         x      = length str'
         y      = length key
         str'   = [y | y <- str, (y /= ' ')]

zipWith' :: Eq a => (a -> b -> a) -> a -> [a] -> [b] -> [a]
zipWith' _ _ [] _ = []
zipWith' _ _ _ [] = []
zipWith' f ex (x:xs) (y:ys) =
  if (x /= ex) then
   f x y : zipWith' f ex xs ys
  else
   x : zipWith' f ex xs (y:ys)

shiftFromWith :: Option -> MsgChar -> KeyChar -> Char
shiftFromWith opt c k = chr c'
    where c' = if opt == Encode then wrapHelper (+) c k
               else wrapHelper (-) c k
