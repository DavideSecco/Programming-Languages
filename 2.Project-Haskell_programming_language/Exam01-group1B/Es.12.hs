digCount :: (Ord t, Num a, Fractional t) => t -> a
digCount n = do
    if n > 10
        then 1 + digCount(n/10)
    else
        1


main = do
    let n = 2354747600
    let digit = digCount n

    print("The result is " ++ show digit)