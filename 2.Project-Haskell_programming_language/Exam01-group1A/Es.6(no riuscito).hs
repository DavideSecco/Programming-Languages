
-- Complete: foldl … … [(1,3),(3,-6),(3,9),(3,8)] function by providing the appropriate first two parameters to 
-- obtain the sum (10,14) of the 2-dimensional space vectors given as the third parameter.

main = do
    print "Ho questa lista: [(1,3),(3,-6),(3,9),(3,8)] come faccio a ottenere questa: sum (10,14)"
    print " partendo da foldl ... ... [(1,3),(3,-6),(3,9),(3,8)]"
    let l1 = [(1,3),(3,-6),(3,9),(3,8)]

    let b = [1..4]
    let a = [7..9] 
    
    let l2 = unzip l1
    let ris = zipWith (*) a b

    print ("Si usa: foldl (+) 0 [(1,3),(3,-6),(3,9),(3,8)] infatti il risultato e': " ++ show ris)
