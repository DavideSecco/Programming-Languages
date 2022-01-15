// COSTRUTTO IF... THEN ... ELSE:
    funz x = 
        if x > 0
            then 1
            else if x == 0
                then 0
                else -1

// INDENTAZION:
    Indentations in Haskell matter for the parser. The use of indentation
    as a syntax element is sometimes called oside rule (spalony).
    When writing a multi-line denition, subsequent lines must have at
    least the same indentation as the rst line.
    Remark: For compatibility tabs should be avoided (in Windows, tabs
    have 4 spaces, in Linux 8).



// GUARDS: 
    esempio con il valore assoluto:
    absolute x
        x < 0 = -x
        otherWise = x

// CASE: 
    The expression case is similar to guards. Example: Replacing a number with the name of the month (here in Polish):

    mese n =
        case n of
            1 => " St y c z en "
            2 => " Luty "
            3 => "Marzec "
            4 => "Kwi e c i en "
            5 => "Maj"
            . . .
            9 => "Wr z e s i en "
            10 => " Pa z d z i e r n i k "
            11 => " L i s t o p a d "
            12 => " Grudz i en "
             _ => "ERROR! "
