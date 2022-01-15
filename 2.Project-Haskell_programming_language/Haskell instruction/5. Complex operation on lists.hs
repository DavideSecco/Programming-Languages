--  INFINITE LISTS AND LAZY EVALUATION
    In Haskell, the values of individual elements of tables are only calculated when they are needed (lazy evaluation). 
    Thus, one can operate e.g. on innite lists:
    Prelude> let fib = 1 : 1 : zipWith (\ x y => x+y ) fib (tail fib)
    Prelude> fib !! 0
    1
    Prelude> fib !! 5
    8
    Prelude> fib !! 7
    21
    Prelude> fib !! 8
    34
    Prelude> fib !! 9
    55


-- MODULE DATA.LIST
    Additional operations on the lists are available after the module Data.List has been loaded:
    Prelude> import Data.List
    Prelude Data.List > intersperse ',' "12345"         -- przeplatanie
    "1,2,3,4,5"
    Prelude Data.List > reverse [1,2,3,4,5]             -- odwr .
    kolejnosci
    [5,4,3,2,1]
    Prelude Data.List > transpose [[11,12,13],[21,22,23],[31,32,33]]                      -- transpozycja
    [[11,21,31],[12,22,32],[13,23,33]]

    Further operations from the module Data.List :
    Prelude Data.List > subsequences "XYZ"              -- wszystkie podciagi
    ["","X","Y","XY","Z","XZ","YZ","XYZ"]
    Prelude Data.List > permutations [1,2,3]            -- wszystkie permutacje
    [[1,2,3],[2,1,3],[3,2,1],[2,3,1],[3,1,2],[1,3,2]]
    Prelude Data.List > replicate 5 "X"                 -- powtorzenie elementu
    ["X","X","X","X","X"]
    Prelude Data.List > sort [1,5,3,2,7,8,6,4,7,3]      -- sortowanie
    [1,2,3,3,4,5,6,7,7,8]

-- Module Data.List and ininite lists
    Prelude Data.List > let potegi 2 = iterate (\x => 2*x ) 1 -- infinite composition of agiven operation
    Prelude Data.List > potegi 2 !! 10
    1024
    Prelude Data.List > potegi2 !! 32
    10044294967296
    Prelude Data.List > letczas = cycle "tik tak"             -- infinitecycle
    ...
    *Main Data.List > wez 1000 1100 czas                      -- elements from a list within given scope    
    "tik tak tik tak tik tak tik tak tik tak tik tak tik tak tik tak tik tak tik tak tik tak tik tak tik t"
    Note: In Polish pot¦ga means "power"; czas means "time"; tik tak means tic toc.
