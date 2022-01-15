length( [],0 ).
length( [_|T],L ) :- length( T,P ), L is P + 1.
