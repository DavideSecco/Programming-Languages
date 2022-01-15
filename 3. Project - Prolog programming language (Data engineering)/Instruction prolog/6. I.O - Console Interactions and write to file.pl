/* Console interactions */
    Move to new line with predicate nl/0.
    Printing predicate write/1 (write to current output).
    Read input using predicate read/1.
        czytaj (A):=nl, write('Podajcos: '), read (A).
        ...
        ?- czytaj (A).

        Podaj cos:asdfgh.
        A=asdfgh.

    Note: In Polish czytaj means read, Podaj co± means Enter
    something.

/* Write to file */
    Open the file with predicate tell/1.
    Write with predicate write/1 (write to current output).
    Close the file with predicate told/0.
        ?- tell ('plik.out'), write('napiswpliku'), told.
        true.

    Note: In Polish plik means file.

