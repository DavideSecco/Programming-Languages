-- where
    As we mentioned earlier, the where construction avoids repetition and improves the readability of complex expressions:
    liczbaPierwiastkow a b c            -- wielomian a x^2 + b x +c
        | delta < 0 = 0
        | delta == 0 = 1
        | otherwi s e = 2
    where delta = b^2 = 4 * a * c
    . . .
    *Main> liczbaPierwiastkow 1 2 3
    0
    *Main> liczbaPierwiastkow 1 20 3
    2
    *Main> liczbaPierwiastkow 1 4 4
    1

-- let ... in ...
    The construction let wyrazenie1 in wyrazenie2 allows you to dene what the expression wyrazenie1 means within the expression
    wyrazenie2.

    Example: the Brahmagupta formula for the S area of a quadrilateral
    (czworok¡t) with sides a; b; c; d inscribed (wpisany) in a circle:
    S = sqrt((p - a) * (p - b) * (p - c) * (p - d)); 
    where p = 1/2 (a + b + c + d)

    -- Brahmagupta f o rmul a
    -- quadrilateral side lengths as parameters
    poleCzworokataWpisanegoWOkrag a b c d =
    let p = (a+b+c+d)/2
    in sqrt ((p-a)*(p-b)*(p-c)*(p-d))
    ...
    *Main> poleCzworokataWpisanegoWOkrag 2 2 2 2
    4.0
    *Main> poleCzworokataWpisanegoWOkrag 2 6 9 7
    30.0

-- Curly bracket
    Instead using indentation one can disambiguate the syntax with curly
    brackets:
    bezklame r = let a = 1
    b = 2
    c = 3
    in a + b + c

    zklamrami = let { a = 1 ; b = 2 ; c = 3 }
    in a + b + c
    Note: In Polish bez klamer means without curly brackets; z
    klamrami means with curly brackets.