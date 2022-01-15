// LAMBDA ESPRESSION AND N-CONVERSION 
    ((utile per le liste?) --> non hai hai capito): 
    map(\n -> sinx) [ 0, pi, pi/2, pi/4, pi/5]          (so - called eta abstraction)
    [ 0.0, 1.22462e-16, 1.0, 0.707,0.5877]

    let x2 = (\x => x^2)         -- eta reduction
    x2 4
    16

    let razy2 = (2 *)            -- eta reduction
    razy2 2
    4


// TACIT PROGRAMMIN (pointfree programming): 
is a coding style that avoids explicit specification of arguments of functions--> evita di mettere la varibile
    
    Prelude> let razy2 x = (2*x)
    Prelude> razy2 2
    4

    Prelude> let razy2 ' = (2*)         -- pointfree
    Prelude> razy2 ' 2
    4

    Prelude> let sumuj = foldr (+) 0
    Prelude> sumuj [1,2,3]
    6