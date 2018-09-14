module Semi where
import Data.Monoid
import Data.Semigroup
import Test.QuickCheck

newtype BoolConj =
  BoolConj Bool deriving (Eq, Show)

instance Semigroup Bool where
 True <> True  = True
 _ <> False = False
 False <> _ = False

instance Semigroup BoolConj where
 BoolConj x <> BoolConj y = BoolConj $ x <> y

instance Arbitrary BoolConj where
 arbitrary = frequency [(1, return $ BoolConj False)
                      , (1, return $ BoolConj True)]

type BoolConjAssoc =
  BoolConj -> BoolConj -> BoolConj -> Bool

semigroupAssoc :: (Eq m, Semigroup m)
               => m -> m -> m -> Bool
semigroupAssoc a b c =
 (a <> (b <> c)) == ((a <> b) <> c)

main :: IO ()
main = do
 quickCheck(semigroupAssoc :: BoolConjAssoc)
