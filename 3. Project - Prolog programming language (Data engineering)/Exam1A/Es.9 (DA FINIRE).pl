remove_from_list([], _, []).
remove_from_list([X|Xs], Y, Z):- X == Y, remove_from_list(Xs, Y, Z), !.
remove_from_list([X|Xs], Y, [X|Zs]):- remove_from_list(Xs, Y, Zs). 