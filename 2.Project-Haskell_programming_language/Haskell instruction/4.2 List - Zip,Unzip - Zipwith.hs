-- ZIP - UNZIP
    Zip - combining two lists into a list of couples. Unzip - the inverse operation.
    Pre lude> : t zip       -- zapytanie o typ wyrazenia
    zip :: [a] => [b] => [(a,b)]
    Prelude> :t unzip
    unzip :: [(a,b)] => ([a],[b])
    ...
    Prelude> zip [1,2,3] ['A','B','C']
    [(1,'A'),(2,'B'),(3,'C')]
    Prelude> unzip [(1,'A'),(2,'B'),(3,'C')]
    ([1,2,3],"ABC")

-- ZIPWITH
    zipWith performs a zip and an additional operation on each pair.
    Prelude> :t zipWith
    zipWith :: (a =>b=>c) => [a] => [b] => [c]
    Prelude> zipWith (*) [1,3,5] [2,2,1]
    [2,6,5]

    For two vectors scalar product is the sum of products of elements:
    Prelude> foldl (+) 0 (zipWith (*) [1,3,5] [2,2,1])          -- scalar produc t
    13

    One can zip on 3 lists.
    Prelude> zipWith3 (\ x y z => x + y + z ) [1,2,3] [4,5,6] [7,8,9]
    [12,15,18]