-- For a given list l consisting of elements ei use the appropriate language construction to obtain l_ind list of the same 
-- length as l consisting of two-element tuples (pairs). Each pair consists of the element ei of list l at first position and 
-- its index i at second position. The index i is a number from 1 that indicates the position of element on the list. For 
-- example: l = [1,3,-4,3] should return: [(1,1),(3,2),(-4,3),(3,4)]

-- you have to use "zip" function

main = do
    let l = [5..9]
    print ("la lista e': " ++ show l)
    let lung = length l
    let index = [1..lung]

    let l_ind = zip l index

    print ("la lista finale e': " ++ show l_ind)
