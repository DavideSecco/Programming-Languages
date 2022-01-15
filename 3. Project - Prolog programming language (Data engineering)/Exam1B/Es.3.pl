woman(ann).
woman(joan).
woman(agnes).
woman(gabrielle).
woman(edith). 
woman(ursula).

men(jack).
men(george).
men(john).
men(victor).
men(stanley).

parent_of(ann, joan).
parent_of(ann, agnes).
parent_of(ann, john).

parent_of(edith, ann).
parent_of(gabrielle, jack).

parent_of(george, jack).
parent_of(george, agnes).
parent_of(george, john).

parent_of(victor, ursula).

parent_of(stanley, george).
parent_of(stanley, victor).

/* */
mother_of(X,Y):- woman(X), parent_of(X,Y).
father_of(X,Y):- men(X), parent_of(X,Y).

/* */

be_siblings(X,Y) :- (parent_of(M, X), parent_of(M, Y)), X \=Y.
be_sister(X, Y) :- woman(X), be_siblings(X,Y).
be_brother(X, Y) :- men(X), be_siblings(X,Y).

/*
- be_siblings(joan, agnes) --> yes
- be_siblings(joan, jack) --> no
- be_siblings(john, X) --> 3 solution: joan, agnes, jack
- be_sister(agnes, jack) --> yes
- be_sister(joan, jack) --> no
- be_sister(john, joan) --> no 
- be_brother(X, joan) --> yes (1)

*/