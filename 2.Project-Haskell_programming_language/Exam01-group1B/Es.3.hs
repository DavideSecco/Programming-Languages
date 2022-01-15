revL :: [a] -> [a]
revL l = do
    if null l
        then []
    else
        revL (tail l) ++ [head l]

main = do
    let l2 = revL [1..5]
    print ("The result list is "++ show l2)