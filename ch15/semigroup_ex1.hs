module Semi where
import Data.Monoid
import Data.Semigroup
import Test.QuickCheck

-- Exercise 1:
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
 (<>) _ _ = Trivial

instance Arbitrary Trivial where
 arbitrary = return Trivial

type TrivAssoc =
 Trivial -> Trivial -> Trivial -> Bool

semigroupAssoc :: (Eq m, Semigroup m)
               => m -> m -> m -> Bool
semigroupAssoc a b c =
 (a <> (b <> c)) == ((a <> b) <> c)

main :: IO ()
main =
 quickCheck (semigroupAssoc :: TrivAssoc)
