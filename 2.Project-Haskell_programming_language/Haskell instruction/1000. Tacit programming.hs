
// TACIT PROGRAMMING
    A more drastic example of tacit programming :
    Prelude> let mf warunek funkcja lista = filter warunek (map funkcja lista)
    Prelude> let mf' = (. map) . ( . ) . filter             -- tacit version
    Prelude> mf (>10) (^2) [1,2,3,4,5]
    [16,25]
    Prelude> mf ' (>10) (^2) [1,2,3,4,5]

    The example above is by Udo Stenzel.
    Note: In Polish warunek means "condition"; funkcja means "function"; lista means "list".

    For those who are curious... derivation, by https://mail.haskell.org/pipermail/haskell-cafe/2006-September/017758.html:
    func2 f g l = filter f (map g l)
    func2 f g = (filter f) . (map g )           -- definition of (.)
    func2 f g = ((.) (filter f)) (map g)        -- desugaring
    func2 f = ((.) (filter f)) . map            -- definition of (.)
    func2 f = flip (.) map ((.) (filter f))     -- desugaring , def. of flip
    func2 = flip (.) map . ( . ) . filter       -- def . of ( . ) , twice
    func2 = (.map) . ( . ) . filter             -- add back some sugar


