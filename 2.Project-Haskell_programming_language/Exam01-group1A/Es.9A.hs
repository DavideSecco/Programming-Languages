-- Implement remFromL function removing the element given as the first parameter from the list given as the second 
-- parameter. For example: remFromL 3 [1,3,-4,3] should return: [1,-4]


remFromL :: Eq a => a -> [a] -> [a]
remFromL n l = do
    let l2 = []
    if null l
        then l2
    else if n == head l
        then l2 ++ remFromL n (tail l)
    else
        l2 ++ [head l] ++ remFromL n (tail l)

main = do
    let l = [1,3,-4,3]
    let n = 3
    print ("The list is: " ++ show l ++ " the number is: " ++ show n)

    let l2 = remFromL n l
    print ("The new list is: " ++ show l2)
