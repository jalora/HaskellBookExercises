module Lib where

import Control.Applicative
import Text.Trifecta

data NumberOrString =
    NOSS String
  | NOSI Integer
  deriving (Eq, Show)

type Major = Integer
type Minor = Integer
type Patch = Integer
type Release = [NumberOrString]
type Metadata = [NumberOrString]

data SemVer =
    SemVer Major Minor Patch Release Metadata
    deriving (Eq, Show)

parseVer :: Parser (Major, Minor, Patch)
parseVer = do
    major <- integer
    char '.'
    minor <- integer
    char '.'
    patch <- integer
    return (major, minor, patch)

parseNOS :: Parser NumberOrString
parseNOS = do
    skipMany (oneOf ".")
    v <- (NOSI <$> integer)
         <|> (NOSS <$> some letter)
    skipMany (oneOf ".")
    return v

parseSemVer :: Parser SemVer
parseSemVer = do
    (maj, min, p) <- parseVer
    v1 <- (char '-' >> (Left <$> some parseNOS))
          <|> (char '+' >> (Right <$> some parseNOS))
    let (Right test) = v1
    return $ SemVer maj min p [] test
