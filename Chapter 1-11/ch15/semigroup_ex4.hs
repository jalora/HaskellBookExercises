module Semi where
import Data.Monoid
import Data.Semigroup
import Test.QuickCheck

data Three a b c = Three a b c
                   deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c)
         => Semigroup (Three a b c) where
 Three x y z <> Three x' y' z' =
  Three (x <> x') (y <> y') (z <> z')

instance (Arbitrary a, Arbitrary b, Arbitrary c)
         => Arbitrary (Three a b c) where
 arbitrary = do
           a <- arbitrary
           b <- arbitrary
           c <- arbitrary
           return $ Three a b c

type ThreeStr = Three String String String
type ThreeAssoc =
 ThreeStr -> ThreeStr -> ThreeStr -> Bool

semigroupAssoc :: (Eq m, Semigroup m)
               => m -> m -> m -> Bool
semigroupAssoc a b c =
 (a <> (b <> c)) == ((a <> b) <> c)

main :: IO ()
main = do
 quickCheck(semigroupAssoc :: ThreeAssoc)
