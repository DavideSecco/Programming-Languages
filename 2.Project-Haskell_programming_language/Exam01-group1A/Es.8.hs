-- Implement isSorted that checking if the integer list given as a parameter is sorted. For example: isSorted [3,1,2]
-- should return: False, and isSorted [1,2,3] should return: True


-- 1° function, but I don't know if it is fine: the function use 2 parameters
{-
isSorted :: Ord t => [t] -> t -> Bool
isSorted l n = if null l
                   then True
               else if n <= head l
                   then isSorted (tail l) (head l)
               else
                   False
-}

-- 2° function: 
isSorted :: Ord a => [a] -> Bool
isSorted l
  | length l <= 1 = True
  | head l <= head (tail l) = isSorted (tail l)
  | otherwise = False

main = do
    let l1 = [1,1,2,4]
    let l2 = [4,2,6]

    -- 1° function: 
    {-
    if isSorted l1 (head l1)
        then print ("la lista " ++ show l1 ++ " e' ordinata")
    else
        print ("la lista " ++ show l1 ++ " non e' ordinata")

    if isSorted l2 (head l2)
        then print ("la lista " ++ show l2 ++ " e' ordinata")
    else
        print ("la lista " ++ show l2 ++ " non e' ordinata")
    -}

    if isSorted l1
        then print ("The list " ++ show l1 ++ " is sorted")
    else
        print ("la lista " ++ show l1 ++ " non e' ordinata")

    if isSorted l2
        then print ("la lista " ++ show l2 ++ " e' ordinata")
    else
        print ("la lista " ++ show l2 ++ " non e' ordinata")
