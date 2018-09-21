module Intermission where

-- Exercise: Identity Instance --
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
