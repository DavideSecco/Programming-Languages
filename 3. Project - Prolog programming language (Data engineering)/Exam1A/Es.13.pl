add_opr([A], A).
add_opr([A|B], A + Res):- add_opr(B, Res).
add_opr([A|B], A - Res):- add_opr(B, Res).
add_opr([A|B], A * Res):- add_opr(B, Res).
add_opr([A|B], A / Res):- add_opr(B, Res), Res \= 0.