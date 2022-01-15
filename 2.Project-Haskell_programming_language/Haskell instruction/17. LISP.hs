-- LISt Processor
    The second oldest high-level programming language after Fortran (John McCarthy, 1958).
    Has many dialects. Currently, the most popular are Common Lisp and Scheme.
    Lists are the basic data structure. Even the LISP code is a list.
    LISP is a multi-paradigm language. It allows to combine functional and imperative paradigm.

-- Symbols in LISP
    Symbols in LISP are sequences of upper and lower case letters, numbers and dashes started with a letter.
    Letters are not case-sensitive.
    Special symbols are NIL (false) and T (true).

-- Expressions in LISP
    All expressions are lists. The rst element of the list denes the operation, and the remaining elements its arguments, e.g. 
    (I NUMERI FRA PARENTESI QUADRE NON LI CONSIDERARE)
        [1]> (+ 2 2)
        4
        [2]> (/ 1 3)
        1/3
        [3]> (/ 1 3 . 0 )
        0.33333334
        [4]> (mod 7 3)
        1
        [5]> (mod =7 3)
        2
        [6]> ( rem 7 3)
        1

    Of course, expressions can be nested:
        [1]> (* (+ 3 4) (/ 1 13) )
        7/13

-- Operators in LISP
    Most operators can take more arguments than usual (compare with
    the fold operation in Haskell):
        [13]> (+ 1 2 3)
        6
        [14]> (- 1 2 3)
        - 4
        [15]> (/ 70 7 5)
        2
    Comment: 1 + 2 + 3 = 6, 1 - 2 - 3 = -4, (70/7)/5 = 2.

-- Logical operators
        [15]> (> 1 2)
        NIL -- (FALSE)
        [16]> (<= 1 2)
        T
        [17]> ( or 3 4)
        3
        [18]> ( or 4 3)
        4
        [19]> ( and n i l t )
        NIL
        [20]> (= 2 2)
        T

-- Numerical types in LISP
    Integers size is limited only by available memory. Complex numbers
    are created using the operator #c :
        [10]> (* #c (0 1) #c (0 =2) )
        2
        [11]> =5
        =5
        [12]> =5.32
        =5.32

-- Cons operator
    Operator cons :
        1000 [3]> ( cons 3 " dsd " )
        1001 (3 . " dsd " )

-- Value assignment
    Using setq , one can assign a value to the symbol:
        [4]> ( s e t q x 5)
        5
        [5]> ( s e t q y 2)
        2
        [6]> (* x y )
        10

-- Local value assignment
    Using let one can locally assign a value to the symbol:
        [7]> ( l e t ( ( a 3) ( b 5) ( c 7) ) (+ a b c ) )
        15








