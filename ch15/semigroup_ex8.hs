module Semi where
import Data.Monoid
import Data.Semigroup
import Test.QuickCheck

data Or a b =
     Fst a
   | Snd b
   deriving (Eq, Show)

instance Semigroup (Or a b) where
 Fst x <> Snd y = Snd y
 Fst x <> Fst y = Fst y
 Snd x <> _     = Snd x

instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
 arbitrary = do
           a <- arbitrary
           b <- arbitrary
           frequency [(1, return $ Fst a)
                    , (1, return $ Snd b)]

type OrInt = Or Int Int
type OrAssoc = OrInt -> OrInt -> OrInt -> Bool

semigroupAssoc :: (Eq m, Semigroup m)
               => m -> m -> m -> Bool
semigroupAssoc a b c =
 (a <> (b <> c)) == ((a <> b) <> c)

main :: IO ()
main = do
 quickCheck(semigroupAssoc :: OrAssoc)
