import Distribution.SPDX.LicenseId (LicenseId(Libpng_2_0))
-- Implement setDiff function that returns difference of sets a\b2 given as lists a and b.
-- For instance setDiff [3,5,6] [1,2,6] should return [3,5].
-- Please do not use \\ operator and union or intersect functions from the Data.List module.

-- HO RISOLTO UN PROBLEMA DIVERSO: NON LA DIFFERENZA MA L'INTERSEZIONE

import Data.List


controllo :: Ord a => [a] -> [a] -> [a]
controllo l1 l2
  | null l1 = l2
  | null l2 = controllo (tail l1) (head l1 : l2)
  | head l1 > head l2 = controllo (tail l1) (head l1 : l2)
  | otherwise = controllo (tail l1) l2

funz :: Eq a => [a] -> [a] -> [a]
funz l1 l2  = do
    let l3 = []
    if null l1 || null l2
        then []
    else if head l1 == head l2
        then l3 ++ [head l1] ++ funz (tail l1) (tail l2)
    else
        l3 ++ funz (tail l1) l2 ++ funz l1 (tail l2)


main :: IO ()
main = do
    let l1 = [1,2,3,4,5]
    print ("Lista di partenza: " ++ show l1)
    let l2 = [3,4,5,6,7]
    print ("Lista da togliere " ++ show l2)

    let l3 = funz l1 l2
    print ("lista con ripetizioni " ++ show l3)

    let l4 = []
    let l5 = controllo l3 l4
    let l6 = sort l5

    print ("Lista intersecata: " ++ show l6)


