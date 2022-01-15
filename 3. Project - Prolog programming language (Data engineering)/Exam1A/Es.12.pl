/* NOT CORRECT AT ALL */
split([A], [], [A]):- !.
split([A|B], [A], B).
split([A|B], [A|L1], L2):- split(B, L1, L2).
