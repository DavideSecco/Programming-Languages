bulb_is_lit(21).
blinds_are_exposed(20).
outside(X):- X == 1.
/* if X = 1 is bright outside
else is not bright outside */

/* relation: */
is_light(X, Y):- bulb_is_lit(X); (blinds_are_exposed(X), outside(Y)).

/*
- is_light(19, 1) --> no
- is_light(19, 0) --> no
- is_light(20, 1) --> yes
- is_light(20, 0) --> no
- is_light(21, 1) --> yes
- is_light(21, 0) --> yes
- is_light(X, 1) --> yes, 2 solutions: X = 20, 21
- is_light(X, 0) --> yes, X = 21
*/