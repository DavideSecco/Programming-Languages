divRem :: Integral b => b -> b -> (b, b)
divRem n d = (n `div` d, n `mod` d)

main :: IO ()
main = do
    let n = 46
    let d = 7

    let ris =  divRem n d

    print("The result is " ++ show ris)