import GHC.Generics ((:+:)(L1))
-- 2) For a given (as a lists) sets L and M, 
-- calculate their difference and symmetrical difference. 



main :: IO ()
main = do
        print "Inzio del programma"

        let l = [5..10]
        print ("la prima lista e': " ++ show l)

        let m = [0..5]
        print ("la seconda lista e': " ++ show m)

        -- let somma1 = foldr (+) 0 l
        let somma1 = sum l        
        print ("Somma prima lista = " ++ show somma1)
        -- print somma1

        -- let somma1 = foldr (+) 0 l
        let somma2 = sum m
        print ("Somma prima lista = " ++ show somma2)
        -- print somma2

        let l3 = zipWith (-) l m
        print ("La differenza simmetrica e': " ++ show l3)

        let diff = somma1 - somma2
        print ("La differenza e': " ++ show diff)    
