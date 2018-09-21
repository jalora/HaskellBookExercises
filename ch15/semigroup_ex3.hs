module Semi where
import Data.Monoid
import Data.Semigroup
import Test.QuickCheck

data Two a b = Two a b deriving (Eq, Show)

instance (Semigroup a, Semigroup b)
         => Semigroup (Two a b) where
 Two x y <> Two x' y' = Two (x <> x') (y <> y')

instance (Arbitrary a, Arbitrary b)
         => Arbitrary (Two a b) where
 arbitrary = do
           a <- arbitrary
           b <- arbitrary
           return $ Two a b

type TwoStr = Two String String
type TwoAssoc =
 TwoStr -> TwoStr -> TwoStr -> Bool

semigroupAssoc :: (Eq m, Semigroup m)
               => m -> m -> m -> Bool
semigroupAssoc a b c =
 (a <> (b <> c)) == ((a <> b) <> c)

main :: IO ()
main = do
 quickCheck(semigroupAssoc :: TwoAssoc)
