q( 0,0 ).
q( X,Y ) :- X > 0, T is X - 1, q( T,Y ).

/* perchè sia vera basta che X > Y (nota che è ricorsiva)*/
