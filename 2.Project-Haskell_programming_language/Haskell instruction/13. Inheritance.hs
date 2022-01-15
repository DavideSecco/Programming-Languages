-- Inheritance
    A simple example of the data structure inheriting from the class Show :
        data Trojkat = Trojkat
        {a :: Double,
        b :: Double ,
        c :: Double
        } deriving (Show)   -- inferitance from the class Show
    The declaration that the type inherits from the class Show, automatically allows to print the type.
    Haskell can automatically inherit from some classes, e.g. Eq , Ord
    , Enum , Show , Read . However, the automatic denition does not
    always meet the needs.

    t1 = Trojkat {a = 3 , c = 5 , b = 4}        -- one way to d e f i n e
    t2 = Trojkat 7 8 9                          -- second way to define   
    t3 = Trojkat 4 4 4
    ...
    *Main> show t1                              -- automatically defined show
    "Trojkat {a = 3.0 , b = 4.0 , c = 5.0} "
    *Main> show t2
    "Trojkat {a = 7.0 , b = 8.0 , c = 9.0} "