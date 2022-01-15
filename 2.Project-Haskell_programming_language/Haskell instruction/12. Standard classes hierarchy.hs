-- Class Eq
    The class (actually the so-called type class) is declared with the keyword class .
    class Eq a where
    (==), (/=) :: a => a => Bool

    -- Minimal complete definition:
    -- (==) or (/=)
    x /= y = not ( x == y )
    x == y = not ( x /= y )

-- Standard numerical type class Num
    An example of Num type class declaration from Prelude module:
    class (Eq a , Show a ) => Num a where
        (+) , (=) , ( * ) : : a => a => a
        negate :: a => a
        abs , signum :: a => a
        fromInteger :: Integer => a
        -- Minimal complete definition :
        -- All, except negate or (--)
        x - y       = x + negate y
        negate x    = 0 - x
    In the expression (Eq a, Show a) => Num a , the operator =>
    declares that the Num type inherits from Eq and Show . This is
    called type constraint.

-- Type class Fractional
    class (Num a ) => Fractional a where
    (/) :: a => a => a
    recip :: a => a
    fromRational : : Ra t i o n a l => a
    -- Minimal complete definition :
    -- fromRational and (recip or (/))
    recip x = 1 / x
    x / y = x * recip y




