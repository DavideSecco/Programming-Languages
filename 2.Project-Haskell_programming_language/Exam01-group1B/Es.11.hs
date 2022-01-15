import Distribution.SPDX (LicenseId(Libpng_2_0))
function numL number = do
    let l2 = []
    if null numL
        then l2
    else
        if head numL /= number
            then l2 ++ [head numL] ++ function (tail numL) number
        else
            l2 ++ function (tail numL) number


-- uniq :: Integral a => [a] -> [a]
uniq :: [Int] -> [Int]
uniq l = do
    let l2 = []
    if null l
        then l2
    else
        l2 ++ [head l] ++ uniq (function (tail l) (head l))


setUni l1 l2 = uniq (l1 ++ l2)

main = do
    let l1 = [3,5,6]
    let l2 = [1,2,6] 
    let l3 = setUni l1 l2

    print ("The result is " ++ show l3)