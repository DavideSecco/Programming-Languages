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

be_partner(X,Y) :- parent_of(X, S), parent_of(Y, S), X \= Y.

/* 
- be_partner(ann, george) --> yes
- be_partner(X,Y) --> (MAYBE????)
- be_partner(george, X) --> (2 wife: ann and gabrielle)
*/