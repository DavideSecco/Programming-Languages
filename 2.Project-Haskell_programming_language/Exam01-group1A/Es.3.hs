-- Implement function exist checking that element e passed as first parameter is on list l passed as the second 
-- parameter. If element e exists, function should return "yes" otherwise it should return "no". For instance
-- exist 8 [4, 6 ,8, 8] should return "yes", and exist 5 [4, 6 ,8, 8] should return "no".
-- Please do not use elem function working on lists.

exist n list = do
    if null list
        then print "no"
    else if n == head list
        then print "yes"
    else 
        exist n (tail list)

main = do
    let list = [4,6,8,8]
    print ("La lista da cui cercare e': " ++ show list)
    print "Insersci il numero che vuoi cercare:"
    n <- readLn

    exist n list

