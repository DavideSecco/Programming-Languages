// LIST
    Lists are used to store multiple items of the same type in a fixed order:
    Prelude> let l1 = [2..9]
    Prelude> l1
    [2, 3, 4, 5, 6, 7, 8, 9]

    // Concatenation of lists (One can also use the concatenation operator++.):
    Prelude> concat [[ 1, 2, 3], [ 4, 5], [ 6, 7, 8]]
    [ 1, 2, 3, 4, 5, 6, 7, 8]

// HEAD AND TAIL: 
    We can divide the list into head and tail using... head and tail.

    Prelude> let l1 = [1..7]
    Prelude> head l1            -- head of the list
    1
    Prelude> tail l1            -- the rest of the list
    [2, 3, 4, 5, 6, 7]

// COUSING: 
    Adding an item to the top of the list is called consing (from constructor):
    Prelude> let liczby = [1..5]
    Prelude> liczby
    [1,2,3,4,5]
    Prelude> 0 : liczby             -- this is consing
    [0,1,2,3,4,5]
    Prelude> 0 : liczby ++ 6:7:[]   -- consing and concatenation
    [0,1,2,3,4,5,6,7]

    The consing operator can be used to divide the list into head and tail.
    Note: In Polish dlugo±¢ means length. Recursive denition of the list length:                 (NON HAI CAPITO QUESTA FUNZIONE!)
    dlugosc :: [a] => Integer
    dlugosc [] = 0
    dlugosc (x:xs) = (dlugosc xs) + 1


// CREATING AND INDEXING LISTS
    You can create lists in various ways. Strings are a sort of lists.
    Prelude> [0,5..40]                      -- every 5th element
    [0,5,10,15,20,25,30,35,40]
    Prelude> concat ["ABC","DEF","GH"]      -- string concatenation
    "ABCDEFGH"
    Prelude> ['A','B','C'] == "ABC"         -- LHS and RHS expressions are equivalent
    True

    0 based indexing using the operator !! :
    Prelude> [0,5..40] !! 3                 -- 4th (0 based indexing) element
    15

// LIST TRUNCATION
    List truncation:
    Prelude> take 3 [1..10]             -- take first 3 elements
    [1,2,3]
    Prelude> drop 3 [1..10]             -- drop first 3 elements
    [4,5,6,7,8,9,10]

// SUBSEQUENCE OF LIST ELEMENTS
    Definition of selecting items from the range:
    wez odtad dotad lista = take (dotad - odtad + 1) (drop odtad lista)
    . . .
    *Main> wez 3 6 [1..10]
    [4,5,6,7]
    Note: In Polish wez means "take those"; odt¡d means "from here; dot¡d means "til here".
