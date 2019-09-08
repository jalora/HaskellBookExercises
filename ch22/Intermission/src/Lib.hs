module Lib where

import Control.Applicative (liftA3)
import Control.Monad (replicateM)
import Control.Monad.Trans.State
import System.Random

data Die =
     DieOne
   | DieTwo
   | DieThree
   | DieFour
   | DieFive
   | DieSix
   deriving (Eq, Show)

intToDie :: Int -> Die
intToDie n =
    case n of
      1 -> DieOne
      2 -> DieTwo
      3 -> DieThree
      4 -> DieFour
      5 -> DieFive
      6 -> DieSix
      x ->
        error $
          "Not a valid die number in range of 1-6 integer: "
          ++ show x

rollDie :: State StdGen Die
rollDie =
    intToDie <$> state (randomR (1, 6))

rollToDieTresTimes :: State StdGen (Die, Die, Die)
rollToDieTresTimes =
    liftA3 (,,) rollDie rollDie rollDie

rollsToTwenty :: StdGen -> Int
rollsToTwenty s = go 0 0 s
    where go :: Int -> Int -> StdGen -> Int
          go sum count st
            | sum >= 20 = count
            | otherwise =
              let (die, nextSt) = randomR (1, 6) st
              in go (sum + die)
                    (count + 1)
                    nextSt

-- Exercises: Roll Your Own
rollsToLimit :: Int -> StdGen -> Int
rollsToLimit n s = go n 0 0 s
    where go :: Int -> Int -> Int -> StdGen -> Int
          go limit sum count st
            | sum >= limit = count
            | otherwise =
              let (die, nextSt) = randomR (1, 6) st
              in go limit
                    (sum + die)
                    (count + 1)
                    nextSt

rollsCountLog :: Int -> StdGen -> (Int, [Die])
rollsCountLog n s = go n 0 0 s []
    where go :: Int -> Int -> Int -> StdGen -> [Die] -> (Int, [Die])
          go limit sum count st dieHist
            | sum >= limit = (count, dieHist)
            | otherwise =
              let (die, nextSt) = randomR (1, 6) st
                  dieType = [intToDie die]
              in go limit
                    (sum + die)
                    (count + 1)
                    nextSt
                    (dieType <> dieHist)

-- 23.6 Write State for Yourself
newtype Moi s a =
    Moi { runMoi :: s -> (a, s) }

instance Functor (Moi s) where
    fmap f (Moi g) = Moi $ (\s0 -> let (a, s1) = g s0 in (f a, s1))

instance Applicative (Moi s) where
    pure a = Moi $ (\s -> (a, s))

    (Moi f) <*> (Moi g) = Moi $ (\s0 ->
        let (fn, s1) = f s0
            (a, s2)  = g s1
        in (fn a, s2))

instance Monad (Moi s) where
    return = pure
    (Moi f) >>= g = Moi $ (\s0 ->
        let (a, s1) = f s0
            Moi fn = g a
        in (fn s1)
        )
