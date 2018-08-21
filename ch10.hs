-- Ch 10 Exercises

module Learn where
import Data.Time

-- Ex: Database Processing
--Setup
data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
            (fromGregorian 1911 5 1)
    (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate (UTCTime
           (fromGregorian 1921 5 1)
           (secondsToDiffTime 34123))
  ]

--1) Write function that filters from DbDate
-- values and returns list of UTCTime values
getUTCTime :: DatabaseItem -> UTCTime
getUTCTime (DbDate u) = u
isDbDate :: DatabaseItem -> Bool
isDbDate (DbDate _) = True
isDbDate _ = False
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate db = map getUTCTime (filter isDbDate db)
