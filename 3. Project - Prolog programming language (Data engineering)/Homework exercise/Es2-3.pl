is_graphic(L, Res):- (summa(L,S), R = S mod 2, R =:= 0, max_2(L,M), lenght(L, Len), M=<Len, Res = "T"); Res = "N".
is_connected(L, Res):- (summa(L,S), R = S mod 2, R =:= 0, lenght(L,Len), S =:= (2*Len - 2), Res = "T"); Res = "N".

/* is sum even */
summa([], 0). 
summa([A], A).
summa([A|T], A + Res):- summa(T, Res).

/* finding the max value in list */
max_2([R], R).
max_2([X|Xs], R):- max_2(Xs, T), (X > T -> R = X; R = T).

/* finding the lenght of list */
lenght([], 0).
lenght([_], 1).
lenght([_|T], 1+Len):- lenght(T, Len).