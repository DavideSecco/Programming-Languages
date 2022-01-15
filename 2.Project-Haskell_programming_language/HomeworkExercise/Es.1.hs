{-# LANGUAGE FlexibleContexts #-}
-- For a given number n and a list L of numbers, find the sum of all numbers from 1 to n divisible by at least one number from L.

-- verifico che il numero preso da l1 sia sia divisibile per un vettore della lista 2

divisibile :: Integral a => a -> [a] -> Bool
divisibile num l2 = if null l2
                        then False
                    else if (num `mod` head l2) == 0
                        then True
                    else
                        divisibile num (tail l2)


-- scorro l1

funz :: Integral a => [a] -> [a] -> [a]
funz l1 l2 = do
    let l3 = []
    if null l1
        then l3
    else
        if divisibile (head l1) l2 == True  
            then l3 ++ [head l1] ++ funz (tail l1) l2
        else
            l3 ++ funz (tail l1) l2

main :: IO ()
main = do
    let n = 6
    let l1 = [1..n]
    let l2 = [2,3,5]
    print ("Prima lista: " ++ show l1)
    print ("Seconda lista: " ++ show l2)

    let l3 = funz l1 l2
    print ("la lista risultata e' :" ++ show l3)
    let somma = sum l3

    print ("Somma = " ++ show somma)