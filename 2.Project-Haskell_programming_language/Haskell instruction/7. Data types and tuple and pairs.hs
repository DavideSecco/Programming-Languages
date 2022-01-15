-- Basic data types
    Some basic data types:
        Integers:       Integer - any size, Int - 32 or 64 bits.
        Real numbers:   Double and Float .
        Logical values: Bool

-- Rational numbers (SE DEVI FARE LE FRAZIONI)
    Module Data.Ratio (we will tell more about modules later) has a type that stores rational numbers. They can be created, e.g. using the operator %:
    Prelude> import Data.Ratio
    Prelude Data.Ratio> let r = 3 % 4
    Prelude Data.Ratio> : t r
    r :: Integral a => Ratio a
    Prelude Data.Ratio> let s = 4 % 9
    Prelude Data.Ratio> let t = r * s
    Prelude Data.Ratio> t
    1 % 3
    Prelude Data.Ratio> toRational (1.25) -- conversion from double to rational
    5 % 4

-- Tuples (krotki)
    Tuple does not have a consing operation, but can store values of different types.
    Prelude> let tu1 = (1,'g',True,"gfgf")
    Prelude> : t tu1
    tu1 :: (Integer, Char, Bool, [Char])
    ...
    Prelude> let tu2 = (1.1, tu1)
    Prelude> tu2
    (1.1, (1,'g', True, "gfgf" ))
    Prelude> : t tu2
    tu2 :: ( Double, (Integer, Char , Bool , [Char]))

-- Pairs
    When a tuple is a pair of two elements, we can retrieve them using fst and snd .
    Prelude> let pa1 = (2,3)        -- pair
    Prelude> fst pa1                -- 1st element
    2
    Prelude> snd pa1                -- 2nd e l ement
    3