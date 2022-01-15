age(jack, 21).
age(john, 18).
age(ann, 17).

legal_age(X):- age(X, Y), Y >= 18.
drink_beer(X):- legal_age(X).

/*
legal_age(jack) --> yes
drink_beer(ann) --> no
drink_beer(X) --> 2 solution: jack and john
*/