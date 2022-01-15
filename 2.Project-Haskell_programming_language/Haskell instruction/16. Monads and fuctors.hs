-- Prima di questo argomento ci sono tutte le integrazioni con Python e C++

-- MONAD - Hello World
   The monads confuse most of Haskell's beginner.
    There are a lot of tutorials, a few are created every year trying to explain the monads again:
    https://wiki.haskell.org/Monad_tutorials_timeline.
    The main reason for the problems: monads are relatively abstract in relation to the moment when a beginner encounters them.
    Typical first program: main = putStrLn "Hello, World!"

-- Monads - IO
    As promised, all functions are clean (they do not change anything in the world, display nothing, do not load anything). To keep this word one had to cheat...
   
    Where is the monad here? main = putStrLn "Hello, World!" ?
        Prelude> : t putSt rLn
        putStrLn : : String => IO ( )
    IO is a monad. But what does it mean?

    What does it mean? Just a moment...
    Sample program with input and output operations:
        module Main where

        out1 = (putStrLn "Podaj liczbe:" )
        in 1 = (readLn :: IO Double )
        out2 = (\x => putStrLn ( "\nsin ("++ show x ++ ") = " ++ show (sin(x))))

        main = out1 >> in 1 >>= out2

    We discussed a similar program before, but using the do construct, which is a so-called syntactic sugar.

    Let's see types of the expressions:
        out1 :: IO ( )
        in 1 :: IO Double
        out2 :: Double => IO ( )
        -- previous slide reminder : out1 >> in 1 >>= out2

        (>>) :: Monad m => m a => m b => m b -- monad sequence

        (>>=) :: Monad m => m a => ( a => m b ) => m b -- sequence of monads with passing values
    
    We see the scheme: operators >> and >>= combine expressions with the monads at the beginning and end.

-- Monads - IO - as a whole
    module Main where

    out1 :: IO ()
    out1 = ( putStrLn " Enter a number: " )

    in 1 : : IO Double
    in 1 = (readLn :: IO Double )

    out2 :: Double => IO ()
    out2 = (\ x => putStrLn ( "\nsin ( " ++ show x ++ " ) = " ++ show (sin (x))))

    main = out1 >> in 1 >>= out2

-- Monads - time for denition
    Standard denition of the Haskell monad:
        class ( Applicative m) => Monad m where
        (>>=) :: m a => ( a => m b ) => m b
        return :: a => m a
    Function >>= takes as an argument a monad (m a) and a function that returns a monad ( a => m b ) and transforms them
    into a monad ( m b )!
    In other words >>= takes a from the monad m a and passes them to a function that will do something on it (get b ) and turn it back into a monad, this time m b .

-- Monads - some side notes
    The denition seems simple (or at least short), but the monad instance must inherit from the Applicative class, which inherits from the Functor class.
    
    You do not need to use this (default) denition when dening your own monads. Custom types do not have to be instances of the Monad class to implement the monad concept.
    https://wiki.haskell.org/All_About_Monads

    Note: Only from version Haskell 7.10 (2014) the so-called Applicative
    => Monad proposal (AMP) - previously the monad did not inherit
    from the Applicative class, but only from Functor itself. https: //wiki.haskell.org/Functor-Applicative-Monad_Proposal

-- What are functors?
    Functor is a class that contains a denition of fmap :
        class Func tor f where
        fmap :: (a => b) => f a => f b

    Compare: map :: (a => b) => [a] => [b] .
    Reasonable fmap should full the laws of composition and identity (the functor laws):
        fmap ( f . g ) = fmap f . fmap g    -- Composition law
        fmap id = id                        -- Identity law
    
    Note: Not to be confused with functors from propositional calculus (^;_; =) ; : : : ).

-- Fuctor Laws
    To be more precise...
    If one composes two or more functions and pass that to fmap , then
    fmap 's output must be the same as the output of a composition of
    multiple calls of fmap separately for each function.
        fmap ( f . g ) = fmap f . fmap g    -- Composition law
    
    If one passes identity to fmap , fmap 's output must be equal to its
    input (mapping identity does nothing ).
        fmap id = id                         -- Identity lawù

-- POI CI SONO ESEMPI DI MONAD














    >> monad sequance
    >>= monad sequence and passing value