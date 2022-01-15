




function :: Integral a => [a] -> a -> [a]
function numL number = do
    let l2 = []
    if null numL
        then l2
    else
        if ((head numL) `mod` number) /= 0
            then l2 ++ [head numL] ++ function (tail numL) number
        else
            l2 ++ function (tail numL) number

main :: IO ()
main = do
    let last = 20
    let beg = 2
    let numL = [2..last]
    print("The initial list is:" ++ show numL)

    let number = head numL

    let num2L = function numL number

    print("The list result is " ++ show num2L)