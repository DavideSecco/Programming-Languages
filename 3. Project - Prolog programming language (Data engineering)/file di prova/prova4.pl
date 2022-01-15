attach( [],L,L ).
attach( [H|T],L,[H|X] ) :- attach( T,L,X ).
