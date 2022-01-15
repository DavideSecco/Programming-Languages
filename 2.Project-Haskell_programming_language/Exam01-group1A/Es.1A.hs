import Data.Text.IO (putStrLn)
import Distribution.SPDX (LicenseExceptionId(SHL_2_1))

square x = x^2

main = do
    -- 1) Create constants down = 3 i up = 14 and list l consisting of increasing integers from down to up.
    let down = 3
    let up = 14
    print ("down =  "++ show down ++ " up = " ++  show up)
    let l = [down..up]
    print ("list: " ++ show l)
    
    -- 2) Calculate sum s of elements of list l using the appropriate function working on the list.
    let s = foldr (+) 0 l
    -- let s = sum l    ALTERNATIVE
    print("The sum is: " ++ show s)

    -- 3) Calculate square s2 of sum s (elements of list l).
    let s2 = s^2
    print ("The square is: " ++ show s2)

    -- 4) Using the appropriate function, create a list l2 of squares of elements of list l
    let l2 = map square l
    print ("List of square: " ++ show l2)

    -- 5) Calculate the sum sl2 of elements of list l2
    let sl2 = foldr (+) 0 l2
    print("The sum is: " ++ show sl2)

    -- 6) Calculate the difference between s2 (square of sum of elements of l) 
    -- and sl2 (sum of the squares of elements l), is it 9394?
    let diff = s2 - sl2
    print ("The difference between s2 and sl2 is: " ++ show diff)









