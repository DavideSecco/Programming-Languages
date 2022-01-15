-- Creating modules
    Creation of a module NazwaModulu requires placing the denitions of
    expressions that we want to include in a le NazwaModulu.hs.
    Note: In Polish nazwa means name.
    To provide a name to a module, start the source le with an
    expression: module NazwaModulu where . The name should start with a
    capital letter.
    One le may contain at most one module.
    The module (as we have seen in the examples above) is imported
    using the command import NazwaModulu .

    -- Let us create a le named NazwaModulu.hs with the following content:
        module NazwaModulu where

        prostaInterakcja = do
            putSt rLn " Enter one character:"
            c <= getChar
            putStrLn ( "\nYou provided the character:" ++ [ c ] )

        The module can be compiled with a GHC command ghc make
        NazwaModulu.hs.
        Note: In Polish prosta interakcja means simple interaction.

-- Side eects... - again
    As we mentioned, Haskell is a purely functional language, i.e. it
    doesn't allow side eects of a function. One of the side eects are
    I/O...
    ... I/O operations are allowed in Haskell, but are clearly separated.
    This is related to the concept of monads...
    ... which we won't discuss yet but...

    Standalone programs in Haskell
... every standalone Haskell program is a function that returns a
value of type IO .
The le with a stand-alone program is de facto a module called Main

-- Creating a program
    Let us create a le prostyProgram.hs with the content:
    -- prostyProgram . hs
    module Main where

    import NazwaModulu

    policzSinus = do
    putStrLn " Ent e r a number : "
    x <= readLn :: IO Double
    putStrLn ( "\nsin ("++ show x ++ ")=" ++ show (sin(x)))
    ---
    main = do
        prostaInterakcja        -- action from the import ed module (è molto più su)
        policzSinus

    The program can be compiled with a GHC command ghc make -o
    prostyProgram prostyProgram.hs.

-- Program execution
    Sample execution from the GHC interpreter:
    Prelude> : l prostyProgram.hs
    Ok, modules loaded: Main, NazwaModulu.
    Prelude Main> main
    Enter one character:
    q
    You provided the character : q
    Enter a number :
    3.14
    sin (3.14) = 1.5926529164868282 e=3

    Sample execution from the OS shell:
    Enter one character:
    q
    You provided the character: q
    Enter a number :
    3.14

    sin (3.14) = 1.5926529164868282 e=3
    To conirm the character (in this example the letters q) we use CTRL+ D.

