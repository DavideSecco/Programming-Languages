permuteL :: [a] -> [[a]]
permuteL l = do
    let l2 = [[]]
    if null l
        then l2
    else if length l == 1
        then [l2 ++ [head l]]
    else
        if length l == 2
            then l2 ++ [[head l] ++ [head (tail l)]] ++ [[head (tail l)] ++ [head l]]
        else
            l2 ++ [[head l] ++ [head (tail l)] ++ permuteL (tail (tail l))] ++ [[head (tail l)] ++ [head l] ++ permuteL (tail(tail l))]

main :: IO ()
main = do
    let n = 3
    let l = [1..n]

    let ris = permuteL l

    print("The result is " ++ show ris)