module Semi where
import Data.Monoid
import Data.Semigroup
import Test.QuickCheck

newtype Combine a b =
 Combine { unCombine :: (a -> b)}

instance Eq (Combine a b) where
 Combine f == Combine g = f == g

instance (Semigroup a, Semigroup b) => Semigroup (Combine a b) where
 Combine f <> Combine g = Combine $ f <> g

type CombineInt = Combine Int Int
type CombineAssoc =
 CombineInt -> CombineInt -> CombineInt -> Bool

semigroupAssoc :: (Eq m, Semigroup m)
               => m -> m -> m -> Bool
semigroupAssoc a b c =
 (a <> (b <> c)) == ((a <> b) <> c)

main :: IO ()
main = do
 quickCheck(semigroupAssoc :: CombineAssoc)
