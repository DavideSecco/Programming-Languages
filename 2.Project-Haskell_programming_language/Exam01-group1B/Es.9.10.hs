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



main = do
    let l = [3,2,2,1,1,4,11,17]
    let l2 = uniq l
    print ("the new list is: " ++ show l2)