module Learn where

-- Exercise: Optional Monoid
-- Actually, since Semigroup is a superclass of
-- Monoid, just define "<>" in the Semigroup instance
-- and mempty in the Monoid instance

instance Monoid a => Semigroup (Optional a) where
 (<>) Nada Nada = Nada
 (<>) (Only a) Nada = Only $ (<>) a mempty
 (<>) Nada (Only a) = Only $ (<>) mempty a
 (<>) (Only a) (Only b) = Only $ (<>) a b

data Optional a = Nada
                | Only a
                deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
 mempty = Nada

-- Exercise: Mad Libs
type Verb = String
type Adjective = String
type Adverb = String
type Noun = String
type Exclamation = String

madlibbinBetter :: Exclamation
                -> Adverb
                -> Noun
                -> Adjective
                -> String

madlibbinBetter e adv noun adj =
 mconcat [e, "! he said ",
          adv, " as he jumped into his car ",
          noun, " and drove off with his ",
          adj, " wife."
          ]
