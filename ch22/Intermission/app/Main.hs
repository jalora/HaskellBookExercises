module Main where

import Lib
import Control.Monad.Trans.State
import System.Random

main = do
    --return $ evalState rollToDieTresTimes (mkStdGen 0)
    return $ ((rollsToLimit 20) . mkStdGen) <$> randomIO
