function numL number = do
    let l2 = []
    if null numL
        then l2
    else
        if (head numL `mod` number) /= 0
            then l2 ++ [head numL] ++ function (tail numL) number
        else
            l2 ++ function (tail numL) number



primelast l1 = do
    let l2 = []
    if null l1
        then l2
    else
        l2 ++ [head l1] ++ primelast (function l1 (head l1))

main = do
    let l = [2..100]
    let l2 = primelast l

    print ("the new list is: " ++ show l2)