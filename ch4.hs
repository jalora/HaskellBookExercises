-- Ch 4 exercises

module Learn where

 -- Exercise "Mood Swings"
 data Mood = Blah | Woot deriving Show

 changeMood :: Mood -> Mood
 changeMood Blah = Woot
 changeMood    _ = Blah
 -- 2nd expression is called "Pattern matching".
 -- Looks for any data constructor of the "Mood" type
 -- not defined in the first function already
 -- e.g. "Blah"
