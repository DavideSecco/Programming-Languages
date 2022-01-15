{-# LANGUAGE FlexibleContexts #-}
-- 3) For a given number n and a list L of numbers, find the sum of all 
-- numbers from 1 to n divisible by at least one number from L. 

divisibile num l = do
    let modulo = num mod head l
    if modulo == 0
        then num 
    else if length (l) > 0
        then do 
            drop 1 l
            divisibile num l
    else 0 


somma nlist l = do
    let b = divisibile (head nlist) l
    drop 1 nlist
    let s = 0
    if length (nlist) > 0
        then somma nlist l
    else s

main = do
    let l = [4..6]
    print ("List: " ++ show l)

    let n = 10
    print ("Numeber: " ++ show n)
    
    let nlist = [1..n]
    print ("List of from 1 to n number: " ++ nlist)

    somma nlist l 
    print
