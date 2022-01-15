revL :: [a] -> [a]
revL l = do
    if null l
        then []
    else
        revL (tail l) ++ [head l]