-- Chapter 9
-- Bad implementation of myMaximumBy and myMininmumBy

module Learn where
import Data.Char
-- 8) implement 'myMaximumBy', which returns the number which
-- returned the LAST 'GT' from a comparison function
myMaximumBy :: Ord a => (a -> a -> Ordering) -> [a] -> a
myMaximumBy f (x:xs) = doMaxBy f xs x
 where doMaxBy f' (x':xs') lastMax
           | xs' == []  = lastMax --return max when list ends
           | otherwise  = lastMax'
            where lastMax' = case (f' x' x'') of
                              GT ->
                               if (f' x' lastMax == GT)
                               then doMaxBy f' xs' x'
                               else doMaxBy f' xs' lastMax
                              LT ->
                               if (f' x'' lastMax == LT)
                               then doMaxBy f' xs' lastMax
                               else doMaxBy f' xs' x''
                              where x'' = head xs'

-- 9) implement 'myMininmumBy', which is the opposite of the
-- above function (returns LAST number returning 'LT')
myMinimumBy :: Ord a => (a -> a -> Ordering) -> [a] -> a
myMinimumBy f (x:xs) = doMinBy f xs x
 where doMinBy f' (x':xs') lastMin
           | xs' == []  = lastMin --return min when list ends
           | otherwise  = lastMin'
            where lastMin' = case (f' x' x'') of
                              GT ->
                               if (f' x'' lastMin == GT)
                               then doMinBy f' xs' lastMin
                               else doMinBy f' xs' x''
                              LT ->
                               if (f' x' lastMin == LT)
                               then doMinBy f' xs' x'
                               else doMinBy f' xs' lastMin
                              where x'' = head xs'
