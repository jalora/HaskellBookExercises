module Semi where
import Data.Monoid
import Data.Semigroup
import Test.QuickCheck

-- Semigroup Exercises

-- Exercise 2:
newtype Identity a = Identity a deriving (Eq, Show)

instance (Semigroup a) => Semigroup (Identity a) where
 (Identity a) <> (Identity b) = Identity $ a <> b

instance (Arbitrary a) => Arbitrary (Identity a) where
 arbitrary = do
  a <- arbitrary
  return $ Identity a

type IdentStr = Identity String
type IdentAssoc =
 IdentStr -> IdentStr -> IdentStr -> Bool

semigroupAssoc :: (Eq m, Semigroup m)
               => m -> m -> m -> Bool
semigroupAssoc a b c =
 (a <> (b <> c)) == ((a <> b) <> c)

main :: IO ()
main =
 quickCheck (semigroupAssoc :: IdentAssoc)
