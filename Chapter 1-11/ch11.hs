{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

-- Chapter 11 Exercises
module Learn where

-- Exercises: Logic Goats
-- This is a typeclass definition
class TooMany a where
 tooMany :: a -> Bool

instance TooMany Int where
 tooMany n = n > 42

newtype Goats = Goats Int deriving (Eq, Show, TooMany)
--1)
-- Using FlexibleInstances
newtype Animals = Animals (Int, String)
                   deriving (Eq, Show, TooMany)
instance TooMany (Int, String) where
 tooMany (x, y) = tooMany x

--2)
--newtype DemGoats = DemGoats (Int, Int)
--                    deriving (Eq, Show, TooMany)
--instance TooMany (Int, Int) where
-- tooMany (x, y) = (x + y) > 42

--3)
instance (Num a, TooMany a) => TooMany (a, a) where
 tooMany (x, y) = tooMany (x + y)

-- Exercise: Programmers
data OperatingSystem =
      GnuPlusLinux
    | OpenBSDPlusNevermindJustBSDStill
    | Mac
    | Windows
    deriving (Eq, Show)

data ProgLang =
      Haskell
    | Agda
    | Idris
    | Purescript
    deriving (Eq, Show)

data Programmer =
 Programmer { os :: OperatingSystem
            , lang :: ProgLang }
 deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
  [ GnuPlusLinux
  , OpenBSDPlusNevermindJustBSDStill
  , Mac
  , Windows
  ]

allLanguages :: [ProgLang]
allLanguages =
   [Haskell, Agda, Idris, Purescript]

allProgrammers :: [Programmer]
allProgrammers = [Programmer x y
                   | x <- allOperatingSystems
                   , y <- allLanguages]
