-- Implement ind function which prints indexes of all occurrences of the element given as the first parameter in the list 
-- given as the second parameter. For example: ind 3 [1,3,-4,3] should return: [2,4]

ind n l index = do
    let ris = []
    if null l
        then ris
    else if n == head l
        then ris ++ [index] ++ ind n (tail l) (index + 1)
    else
        ris ++ ind n (tail l) (index + 1)

main = do
    let l = [1,3,-4,3,3,3]
    let n = 3
    print ("La lista e': " ++ show l ++ " e il parametro da cercare e': " ++ show n)
    let index = 1
    let ris = ind n l index

    print ("Gli indici corrispondenti sono: " ++ show ris)

