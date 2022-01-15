somma :: (Show a, Num a) => a -> a -> IO ()
somma x y  = do
    let s = x + y
    print x
    putStrLn "+"
    print y
    putStrLn "="
    print s


main = do
    putStrLn "Inserisci i due numeri di cui fare la sommma:"
    input1 <- getLine
    input2 <- getLine
    let x = (read input1 :: Int)
    let y = (read input2 :: Int)
    putStrLn "chiamo la funzione che fa la somma"
    somma x y