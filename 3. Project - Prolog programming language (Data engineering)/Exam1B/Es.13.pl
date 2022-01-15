is_winner(0,0) :- fail. 
is_winner(A,B) :- X is A - 1, X >= 0, not(is_winner(X,B)). 
is_winner(A,B) :- X is A - 2, X >= 0, not(is_winner(X,B)). 
is_winner(A,B) :- X is B - 1, X >= 0, not(is_winner(A,X)). 
is_winner(A,B) :- X is B - 2, X >= 0, not(is_winner(A,X)). 

/* 
is_winner(X,Y):- X > 0, Z is X - 1, is_winner(Z,Y).
is_winner(X,Y):- Y > 0, Z is Y - 1, is_winner(X,Z).
is_winner(X,Y):- X > 0, Z is X - 2, is_winner(Z,Y).
is_winner(X,Y):- Y > 0, Z is Y - 2, is_winner(X,Z).

is_winner(13, 3)
*/