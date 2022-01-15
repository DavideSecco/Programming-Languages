{-# LANGUAGE FlexibleContexts #-}

-- The exercise look the same as Es.1A.hs because in that one you should do the same step but using console


-- Write the same as the function sqrSum_sumSqr taking two numbers defining range of increasing integers and 
-- returning difference between square of sum and the sum of squares. For a call sqrSum_sumSqr 3 14 should return 
-- result 9394. As a solution include the code to the final solution file.

square x = x^2

sqrSumsumSqr = do
    let down = 3
    let up = 14
    print("The number are: " ++ show down ++ " and " ++ show up)
    let l = [down..up]
    print("The list is: " ++ show l)
    let s = foldr (+) 0 l
    let s2 = s^2

    let l2 = map square l
    let sl2 = foldr (+) 0 l2

    let diff = s2 - sl2
    print ("The difference between s2 and sl2 is: " ++ show diff)

