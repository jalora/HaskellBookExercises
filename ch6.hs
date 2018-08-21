-- Exercises for typeclasses
module Learn where

-- Exercise: Eq Instances

-- 1)
data TisAnInteger =
   TisAn Integer

-- TisAnInteger has an instance of Eq
instance Eq TisAnInteger where
 (==) (TisAn a) (TisAn a') =
    a == a'

-- 2)
data TwoIntegers =
   Two Integer Integer

instance Eq TwoIntegers where
 (==) (Two a b) (Two a' b') =
    (a == a') && (b == b')

-- 3)
data StringOrInt =
   TisAnInt Int
   | TisAString String

instance Eq StringOrInt where
 (==) (TisAnInt a) (TisAnInt a') =
    a == a'
 (==) (TisAString s) (TisAString s') =
    s == s'
 (==) _ _ =
    False

-- 4)
data Pair a =
   Pair a a

instance Eq a => Eq (Pair a) where
 (==) (Pair a b) (Pair a' b') =
    (a == a') && (b == b')

-- 5)
data Tuple a b =
   Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
 (==) (Tuple a b) (Tuple a' b') =
    (a == a') && (b == b')

-- 6)
data Which a =
   ThisOne a
   | ThatOne a

instance Eq a => Eq (Which a) where
 (==) (ThisOne a) (ThisOne a') =
    (a == a')
 (==) (ThatOne b) (ThatOne b') =
    (b == b')
 (==) _ _ =
    False

-- 7)
data EitherOr a b =
   Hello a
   | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
 (==) (Hello a) (Hello a') =
    a == a'
 (==) (Goodbye b) (Goodbye b') =
    b == b'
 (==) _ _ =
    False

-- Type-Kwon Do Two: Electric Typealoo
-- 1)
chk :: Eq b => (a -> b) -> a -> b -> Bool

chk fTest a b =
 if (fTest a) == b
 then True
 else False

-- 2)
arith :: Num b => (a -> b) -> Integer -> a -> b

arith f _ a = (f a) + 1
