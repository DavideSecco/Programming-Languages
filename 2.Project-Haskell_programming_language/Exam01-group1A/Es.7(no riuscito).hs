import GHC.Event.Windows.FFI (getOverlappedResult)
-- Implement getVarL function printing 2length two-element lists (variations with repetitions), where lenght = the number 
-- of list elements passed as a parameter. Each such 2-element list includes all possible 2-element variations with 
-- repetitions of input list elements. The program retrieves elements from the list given as a parameter and adds to each 
-- of them one element from the same list, along with the repetition. For example: getVarL [1,2] should return: [[1,1],[1,2],[2,1],[2,2]]

-- NON CE L'HO FATTA

-- l1 --> a ogni ciclo lo metto come prima valore
-- l2 --> lo scorro per ogni valore di l1, quando finisce lo faccio ricominciare (grazie a l3)
-- l3 --> non cambia mai, mi serve per aver sempre memorizzare il vettore

getVarL l1 l2 l3 = do
    let l4 = [(,)]
    if null l1 -- ho finito il vettore, non c'è più nulla
        then l4
    else if null l2
        then zip l3 getVarL (tail l1 l3 l3)
    else
        zip l3 (head l1, head l2) [getVarL l1 l2 l3]

main = do
    let l = [1,2]
    print ("La lista di input e' " ++ show l)

    let l2 = getVarL l l l

    print ("La lista di output e' " ++ show l2)
