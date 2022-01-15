// MAPPING:
    molto utile quando devi calcolare la stessa funzione per più valori (che metti in una lista)
    
    Apply the given function to all elements of the list. Execute in GHCi:
    Prelude> let l1 = [2..9]
    Prelude> let ff x = x^2
    Prelude> map ff l1
    [4,9,16,25,36,49,64,81]
    Prelude> map ( * 2) l 1
    [4,6,8,10,12,14,16,18]

    Using lambda expressions:
    Prelude> mapuj (\x => x^2) [2..9]           -- with lambda expression
    [4,9,16,25,36,49,64,81]

// MAPPING AND PATTERN MATCHING
    How to do it? Let us dene:
    map :: (a -> b) -> [a] -> [b]
    map _ [] = []       -- so-called pattern matching
    map fun (x : xs) = (fun x) : (map fun x s)
    
    Matching always happens with the rst matching pattern (from up to down):
        _ - matches everything but does not bind,
        [] - matches the empty list, does not bind,
        fun - matches everything, binds the match with the variable fun ,
        (x: xs) - matches non-empty list formed by consing element (bound to x ) with list (bound to xs ).

// MAPPING AND FILTRATION
    The mapping function may return values of a dierent type:
    Prelude> let l1 = [2..9]
    Prelude> let is57 x = (x==5 || x==7)
    Prelude> map is57 l1
    [False,False,False,True,False,True,False,False]

    Filtration - selection of those elements for which a given predicate is true. Command lter .
    Prelude> filter is57 l1
    [5,7]

    Further examples:
    *Main> map ( *10) [ 1 , 2 , 3 , 4 , 5 ]
    [10,20,30,40,50]
    *Main> map (\x => x^2 + 1) [1,2,3,4,5]          -- with lambda expression
    [2,5,10,17,26]
    ...
    *Main> let is57 x = (x==5 || x==7)
    *Main> filter is57 [1,5,2,5,3,5]                -- filtration
    [5,5,5]

// FOLDING (non so quando possa essere utile, ma forse solo un caso particolare)
    Folding (or reduction, or aggregation) is a sort of  joining together (or summing up) all elements into one. One can fold from the left side (foldl) or from the right side (foldr).
    Example in Haskell
    Prelude> foldr (+) 0 [3,4,5,1]
    13
    Prelude> foldl (*) 1 [1,2,3,4,5]
    120

    Indeed:
    suma([3;4;5;1]) = foldl(+; 0; [3;4;5;1]) = f[(0+3)+4]+5g+1 = 13.
    Note: In Polish suma means "sum".

    
    We must dene: a function with two arguments or the relevant type, the initial value and the list to be reduce.
    The direction of reduction is important when the function is not commutative.
    For the initial value 0 and a list [3; 4; 5; 1] and operator 􀀀 (minus), folding from the left side, we have:
            {[(0 - 3) - 4] - 5} - 1 = -13;
    from the right
            3 - {4 - [5 - (1 - 0)]} = 3:
    Prelude> foldl (-) 0 [3,4,5,1]
    -13
    Prelude> foldr (=) 0 [3,4,5,1]
    3