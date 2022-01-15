join([], L2, L2).
join([X|Xs], L2, [X|L3]):- join(Xs, L2, L3).



