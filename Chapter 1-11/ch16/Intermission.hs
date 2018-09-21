module Intermission where

liftedInc :: (Functor f, Num a)
          => f a -> f a
liftedInc = fmap (+1)

-- Exercise: Possibly --

data Possibly a =
     LolNope
   | Yeppers a
   deriving (Eq, Show)

instance Functor Possibly where
 fmap _ LolNope = LolNope
 fmap f (Yeppers a) = Yeppers (f a)

-- Exercise: Short Exercise --

data Sum a b =
    First a
  | Second b
  deriving (Eq, Show)

-- Note that "a" is part of the functor structure --
instance Functor (Sum a) where
 fmap _ (First a) = First a
 fmap f (Second b) = Second (f b)
