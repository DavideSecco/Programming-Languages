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
be_grandfather(X, S):- father_of(X,Y), parent_of(Y, S).

/* 
be_grandfather(stanley, jack) --> yes
be_grandfather(gabrielle, agnes) --> no
be_grandfather(X, george) --> no
*/