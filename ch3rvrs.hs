module Rvrs where

 rvrs :: String -> String
 rvrs w = (++) (drop 9 w) $ (++) " is " (take 5 w)

 main :: IO ()
 main = print (rvrs "Curry is awesome")
