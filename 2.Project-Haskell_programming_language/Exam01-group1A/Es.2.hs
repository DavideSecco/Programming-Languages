-- Implement your own function sumInt doing the same as sum function working on lists (adding list items). Narrow 
-- function to Int types by adding the appropriate header. Load file as module and run function: sumInt [2,4..12]. 
-- Check if result is 42 and if function type > :t is: sumInt :: [Int] -> Int. As a solution, do printScreen of 
-- successfully loaded and executed module.

sumInt l =
    if not (null l)
        then head l + sumInt (tail l)
    else 0

main = do
    let l = [2,4..12]
    print ("La lista è " ++ show l)
    let somma = sumInt l
    print ("Somma = " ++ show somma)