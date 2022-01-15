-- 1) For a given number n, find the sum of all Fibonacci sequence 
-- even elements less than n. 
factorial n = if n == 0 then 1 else n * factorial (n - 1)

fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

main = do putStrLn "insert your number "
          x <- readLn
          let l2 = [0..x]
          print $ map fib l2
          print "fine"


