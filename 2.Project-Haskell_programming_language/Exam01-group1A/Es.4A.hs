-- Implement setDiff function that returns difference of sets a\b2 given as lists a and b.
-- For instance setDiff [3,5,6] [1,2,6] should return [3,5].
-- Please do not use \\ operator and union or intersect functions from the Data.List module.

-- funzione che controlla che un valore non sia nella lista:
-- se il valore c'è --> True
-- se il valore non c'è --> False

check val l = do
     if null l
         then False
     else if (val /= (head l))
         then check val (tail l)
     else
         True

funz :: Eq a => [a] -> [a] -> [a]
funz l1 l2  = do
    let l3 = []
    if null l2
        then l1
    else if null l1
        then l3
    else if head l1 == head l2
        then l3 ++ funz (tail l1) l2
    else
        if not (check (head l1) l2) -- se ha ritornato false vuol dire che il valore non c'è 
            then l3 ++ [head l1] ++ funz (tail l1) l2
        else -- se controllando il valore c'è, allora non devo aggiungere
            l3 ++ funz (tail l1) l2


main = do
    let l1 = [1,2,3,4,5]
    print ("Lista di partenza: " ++ show l1)
    let l2 = [3,4,5,6,7]
    print ("Lista da togliere " ++ show l2)

    let l3 = funz l1 l2
    print ("lista con (possibili) ripetizioni " ++ show l3)