// TIPO DI UN OGGETTO:
    :t nome_dell'oggetto --> esempio :t add ==> param1_type -> ... -> paramn_type -> result_type

// To pass a command consisting of several lines, put it between :{ i }:, for instance:
> :{
| let fib 0 = 0
| fib 1 = 1
| fib n = fib (n-1) + fib (n-2)
| :}


// FUNZIONE DI UNA RIGA:
    nome_funzione param1 ... param_n = operazione
    [let] add x y = x + y

    let pole r = pi * r^2
    Prelude> pole 1
    3.141592653589793

// FUNZIONE DI PIU' RIGHE:
    nome_funzione param1 param2 ... param_n = do
        istruzione 1
        istruzione 2

// RICORSIONE:
    factorial 0 = 1
    factorial n = n*factorial(n-1)
   
    fib 0 = 0
    fib 1 = 1
    fib n = fib (n-1) + fib (n-2)

// COMPOSIZIONE DI FUNZIONI 
    --> si usano i punti:
    plus1 x = x + 1
    razy2 x = x * 2

    razy2plus1 = razy2.plus1
    plus1razy2 = plus1.razy2

    razy2plus1 3        (means: (3 + 1) * 2)
    8
    plus1razy2 3        (means: 3 * 2) + 1
    7