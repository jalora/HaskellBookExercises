module Intermission where

import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

---------------------------------
-- Exercise: Identity Instance --
---------------------------------

newtype Identity a = Identity a
      deriving (Eq, Ord, Show)

instance Functor Identity where
 fmap id (Identity a) = Identity (id a)

instance Applicative Identity where
 pure = Identity
 Identity id <*> Identity a = Identity (id a)

-- Exercise: Constant Instance --
newtype Constant a b =
   Constant { getConstant :: a}
   deriving (Eq, Ord, Show)

instance Functor (Constant a) where
 fmap _ (Constant a) = Constant a

instance Monoid a => Applicative (Constant a) where
 pure _ = Constant mempty
 (Constant a) <*> (Constant b) = Constant $ a <> b

--------------------------------
-- Exercise: List Applicative --
--------------------------------
-- Note a lot of instance declarations
-- are recursive

data List a =
    Nil
  | Cons a (List a)
  deriving (Eq, Show)

instance Semigroup (List a) where
 x <> Nil = x
 Nil <> x = x
 (Cons x xs) <> ys = Cons x $ xs <> ys

instance (Semigroup a) => Monoid (List a) where
 mempty = Nil
 mappend = (<>)

instance Functor List where
 fmap _ Nil = Nil
 fmap f (Cons x xs) = Cons (f x) (fmap f xs)

-- Example of how Applicative
-- is a "Monoidal Functor"
instance Applicative List where
 pure x = Cons x Nil
 Nil <*> _ = Nil
 Cons f g <*> xs = (f <$> xs) <> (g <*> xs)

instance Arbitrary a => Arbitrary (List a)  where
 arbitrary = sized go
   where go 0 = pure Nil
         go n = do
           xs <- go (n - 1)
           x  <- arbitrary
           return (Cons x xs)

instance (Eq a) => EqProp (List a) where
 (=-=) = eq

 -----------------------------------
 -- Exercise: ZipList Applicative --
 -----------------------------------

take' :: Int -> List a -> List a
take' 0 _  = Nil
take' _ Nil = Nil
take' n (Cons x cs) = Cons x (take' (n-1) cs)

--zipWith' :: List (a -> b) -> List a -> List b
zipWith' Nil _ = Nil
zipWith' _ Nil = Nil
zipWith' (Cons f fs) (Cons x xs) = Cons (f x) (zipWith' fs xs)

repeat' :: a -> (List a)
repeat' x = xs
  where xs = Cons x xs

newtype ZipList' a =
  ZipList' (List a)
  deriving (Eq, Show)

instance Functor ZipList' where
 fmap f (ZipList' xs) = ZipList' $ fmap f xs

instance Applicative ZipList' where
 -- repeat' x required to pass identity,
 -- composition and functor test
 pure x = ZipList' $ repeat' x
 ZipList' Nil <*> _ = ZipList' Nil
 _ <*> ZipList' Nil = ZipList' Nil
 ZipList' xs <*> ZipList' ys = ZipList' $ zipWith' xs ys

instance Eq a => EqProp (ZipList' a) where
 xs =-= ys = xs' `eq` ys'
  where xs' = let (ZipList' l) = xs
              in take' 3000 l
        ys' = let (ZipList' l) = ys
              in take' 3000 l

instance Arbitrary a => Arbitrary (ZipList' a) where
 arbitrary = do
          a <- arbitrary
          return $ ZipList' a

--------------------------------------
-- Exercise: Validation Applicative --
--------------------------------------

data Validation' e a =
    Failure' e
  | Success' a
  deriving (Eq, Show)

instance Functor (Validation' e) where
 fmap _ (Failure' e) = Failure' e
 fmap f (Success' a) = Success' $ f a

instance Monoid e => Applicative (Validation' e) where
 pure = Success'
 Failure' e <*> Failure' e' = Failure' $ e <> e'
 Failure' e <*> Success' _  = Failure' e
 Success' _ <*> Failure' e  = Failure' e
 Success' f <*> Success' x = Success' $ f x

instance (Eq e, Eq a) => EqProp (Validation' e a) where
 (=-=) = eq

instance (Arbitrary e, Arbitrary a)
         => Arbitrary (Validation' e a) where
 arbitrary = oneof [failCase, successCase]
    where failCase = do
           e <- arbitrary
           return $ Failure' e
          successCase = do
           a <- arbitrary
           return $ Success' a

type TrigSetup = (String, Int, String)

main :: IO ()
main = do
 let trigger = undefined :: List TrigSetup
 let zipTrigger = undefined :: ZipList' TrigSetup
 let valTrigger = undefined :: Validation' String TrigSetup

 putStr "Applicative Law Check on List: "
 quickBatch $ applicative trigger
 putStr "Applicative Law Check on ZipList': "
 quickBatch $ applicative zipTrigger
 putStr "Applicative Law Check on Validation': "
 quickBatch $ applicative valTrigger
