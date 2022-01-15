/* Recursion in Prolog */
    An example of a recursively dened function: The power of two.
        pow2 (0,1) .
        pow2 (Y,Z) :- Y1 is Y - 1 , pow2 (Y1,Z1), Z is Z1*2 .
    1 is zero power 2.
    Z is equal 2Y when Z = 2 x 2^(Y-1).

/*Recursion in Prolog - lists */
Checking if an item is on the list of items:
    naLiscie(X,[X|_]).                      %iswhenitisthefirstelement
    naLiscie(X,[_|T]):- naLiscie(X,T).1     %iswhenitisonthelistwithoutthefirstitem
    ...
    ?- naLiscie(1,[1,2,3,4,5]).
    true.

    ?=naLiscie(7,[1,2,3,4,5]).
    false.

    Note: In Polish na li±cie means on a list.

    Print list using the above predicate:
        ?= naLiscie (X, [1,2,3,4,5]) .
        X = 1;
        X = 2;
        X = 3;
        X = 4;
        X = 5;
        false.

    Length of the list:
        dlugosc([],0).                              %dlugosclistypustejto0
        dlugosc([_|T],Lp):- dlugosc(T, L), Lp is L+1.    %dlugosclistyzjednymelementemwiecej
        ...
        ?=dlugosc([1,2,3,4,5],X).
        X=5.

/* Operator cut */
    The prologue makes inferences by examining various possible values
    of the variables and lists them all. The operator ! stops and breaks
    the consideration of further possibilities on the part of evaluation
    found so far (please reect for a moment):
        q(10).
        q(20).
        r(10, 'a').
        r(10, 'b').
        r(20, 'c').
        pierwszeQ (L) :-q (X), ! , r (X, L) .
        wszystkieQ (L) :-q (X), r (X, L ) .
    Note: In Polish pierwsze means the rst, wszystkie means all.

    The operator ! stops considering other possibilities of satisfying the part of the evaluation analysed so far:
        ?=pierwszeQ (L).
        L=a;
        L=b.

        ?=wszystkieQ (L).
        L=a;
        L=b;
        L=c.
