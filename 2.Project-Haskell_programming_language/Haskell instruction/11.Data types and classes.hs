-- Synonyms
    Using synonyms, we can give alternative names to built-in types (similar to typedef in C). Type names begin with a capital letter.
    type Imi e = String
    type Nazwi sko = String
    type Telefon = Int
    Note: In Polish imi¦ means name; nazwisko means surname;
    telefon means phone (number).

-- Dening data types
    You declare your own data type using the keyword data :
    data Data = Data Int Int Int    -- dzien, miesiac, rok
    There may be several dierent denitions under the same name
    (similar to enum in C):
    data Znajomy =
    Bliski Imie Telefon Urodz iny
    | Daleki Imie Nazwi sko Telefon
    Znajomy is a type name, Bliski and Daleki are constructors.
    
    Note: In Polish znajomy means friend; bliski znajomy means close
    friend; daleki znajomy means colleague.

    Functions for dened data types:
    wyswietlDate :: Data => String
    wyswietlDate (Data dmr) =
    show d ++ " " ++ mi e s i a c m ++ " " ++ show r
    ...
    *Main> let nowyRok = Data 1 1 2022
    *Main> wyswietlDate nowyRok
    "1 Styczen 2022 "
    (The expression miesiac was dened in the previous lecture.)

    -- then there are many slides written in polish...

-- Integers
    Let's take a look at the following integer denitions:
    Prelude> let a = 1
    Prelude> let b = 1 :: Int
    Prelude> let c = 1 :: Integer
    Prelude> : t a
    a :: Num p => p
    Prelude> : t b
    b :: I n t
    Prelude> : t c
    c :: I n t e g e r
    Operations + , = etc. are allowed between a and b (they return
    the type Int ) and a and c (return type Integer ), but not
    between b and c .
    What is Num ? And what does => mean?

-- Real numbers
    Let us try now with real numbers:
    Prelude> let x = 1.0
    Prelude> let y = 1 :: Float
    Prelude> let z = 1 :: Double
    Prelude> : t x
    x :: Fractional p => p
    Prelude> : t y
    y :: Float
    Pr e lude> : t z
    z : : Double
    Arithmetic operations are similar to integer types: Fractional
    matches both Float and Double , but the latter two do not
    match each other.
    What is this Fractional ?

-- Numeric data types
    Let's try this:
    Prelude> : t ( a+x )
    (a+x) :: Fractional a => a
    Prelude> : t ( a+y )
    (a+y) :: Float
    Prelude> : t ( a+z )
    (a+z) :: Double
    We get the same types when we change the order. But the other
    combinations (eg Hinline Int plus Hinline Float) are not allowed.