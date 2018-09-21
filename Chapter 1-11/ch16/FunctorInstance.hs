{-# LANGUAGE ViewPatterns #-}

module Intermission where
import Test.QuickCheck
import Test.QuickCheck.Function

--16.10: Exercises Instances of Func

functorIdentity :: (Functor f, Eq (f a))
                => f a
                -> Bool
functorIdentity f =
 fmap id f == f

functorCompose :: (Eq (f c), Functor f)
               => f a
               -> Fun a b
               -> Fun b c
               -> Bool
functorCompose x (Fun _ f) (Fun _ g) =
 (fmap (g . f) x) == (fmap g . fmap f $ x)

type FunInt = Fun Int Int

-- Exercise 1: --
newtype Identity a = Identity a
                   deriving (Eq, Show)

instance Functor Identity where
 fmap f (Identity a) = Identity (f a)

instance (Arbitrary a) => Arbitrary (Identity a) where
 arbitrary = do
           a <- arbitrary
           return (Identity a)

type IdentInt = Identity Int
type IdentFC =
 IdentInt -> FunInt -> FunInt -> Bool

-- Exercise 2: --
data Pair a = Pair a a
            deriving (Eq, Show)

instance Functor Pair where
 fmap f (Pair x y) = Pair (f x) (f y)

instance (Arbitrary a) => Arbitrary (Pair a) where
 arbitrary = do
          a <- arbitrary
          return (Pair a a)

type PairInt = Pair Int
type PairFC =
 PairInt -> FunInt -> FunInt -> Bool

-- Exercise 3: --
data Two a b = Two a b
             deriving (Eq, Show)
instance Functor (Two a) where
 fmap f (Two a b) = Two a (f b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
 arbitrary = do
           a <- arbitrary
           b <- arbitrary
           return (Two a b)

type TwoInt = Two Int Int
type TwoFC =
 TwoInt -> FunInt -> FunInt -> Bool

-- Exercise 4: Three a b c --
data Three a b c = Three a b c
                 deriving (Eq, Show)

instance Functor (Three a b) where
 fmap f (Three a b c) = Three a b (f c)

instance (Arbitrary a, Arbitrary b, Arbitrary c)
         => Arbitrary (Three a b c) where
 arbitrary = do
           a <- arbitrary
           b <- arbitrary
           c <- arbitrary
           return (Three a b c)

type ThreeInt = Three Int Int Int
type ThreeFC =
 ThreeInt -> FunInt -> FunInt -> Bool

-- Exercise 5: Three' a b --
data Three' a b = Three' a b b
                deriving (Eq, Show)

instance Functor (Three' a) where
 fmap f (Three' a b c) = Three' a (f b) (f c)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
 arbitrary = do
           a <- arbitrary
           b <- arbitrary
           return (Three' a b b)

type Three'Int = Three' Int Int
type Three'FC =
 Three'Int -> FunInt -> FunInt -> Bool

-- Exercise: Four a b c d --
data Four a b c d = Four a b c d
                  deriving (Eq, Show)

instance Functor (Four a b c) where
 fmap f (Four a b c d) = Four a b c (f d)

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d)
         => Arbitrary (Four a b c d) where
 arbitrary = do
           a <- arbitrary
           b <- arbitrary
           c <- arbitrary
           d <- arbitrary
           return (Four a b c d)

type FourInt = Four Int Int Int Int
type FourFC =
 FourInt -> FunInt -> FunInt -> Bool

-- Exercise: Four' a b --
data Four' a b = Four' a a b b
               deriving (Eq, Show)

instance Functor (Four' a) where
 fmap f (Four' a b c d) = Four' a b (f c) (f d)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Four' a b) where
 arbitrary = do
           a <- arbitrary
           b <- arbitrary
           return (Four' a a b b)

type Four'Int = Four' Int Int
type Four'FC =
 Four'Int -> FunInt -> FunInt -> Bool

main :: IO ()
main = do
 -- Exercise 1: Identity a
 putStrLn "Identity a"
 putStr "Compose: "
 quickCheck (functorCompose :: IdentFC)
 putStr "Identity: "
 quickCheck (functorIdentity :: IdentInt -> Bool)
 -- Exercise 2: Pair a a
 putStrLn "Pair a a"
 putStr "Compose: "
 quickCheck (functorCompose :: PairFC)
 putStr "Identity: "
 quickCheck (functorIdentity :: PairInt -> Bool)
 -- Exercise 3: Two a b
 putStrLn "Two a b"
 putStr "Compose: "
 quickCheck (functorCompose :: TwoFC)
 putStr "Identity: "
 quickCheck (functorIdentity :: TwoInt -> Bool)
 -- Exercise 4: Three a b c
 putStrLn "Three a b c"
 putStr "Compose: "
 quickCheck (functorCompose :: ThreeFC)
 putStr "Identity: "
 quickCheck (functorIdentity :: ThreeInt -> Bool)
 -- Exercise 5: Three' a b
 putStrLn "Three' a b"
 putStr "Compose: "
 quickCheck (functorCompose :: Three'FC)
 putStr "Identity: "
 quickCheck (functorIdentity :: Three'Int -> Bool)
 -- Exercise 6: Four a b c d
 putStrLn "Four a b c d"
 putStr "Compose: "
 quickCheck (functorCompose :: FourFC)
 putStr "Identity: "
 quickCheck (functorIdentity :: FourInt -> Bool)
 -- Exercise 7: Four' a a b b
 putStrLn "Four' a a b b"
 putStr "Compose: "
 quickCheck (functorCompose :: Four'FC)
 putStr "Identity: "
 quickCheck (functorIdentity :: Four'Int -> Bool)
