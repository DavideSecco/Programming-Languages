/* Predicates in Prolog */
    Predicates with substituted values express facts about the world that
    we want to include in the inference:
        lubi(paulina, ola).
        lubi(paulina, piotr).
        lubi(piotr, rafal).
        lubi(ola, paulina).
    We decide ourselves what we mean by a given predicate, e.g.
    lubi (X,Y). may mean that X likes Y.
    Note: In Polish lubi means likes.

    Enumeration of relations:
    ?- lubi(X,Y).
    X = paulina,
    Y = ola;
    X = paulina,
    Y = piotr;
    X = piotr,
    Y = rafal;
    X = ola,
    Y = paulina.

    Enumeration of relations:
        ?= lubi(paulina,X).
        X = ola;
        X = piotr.

        ?= lubi(X,paulina).
        X = ola.
    It is usually convenient to list all the facts in an external le (typical
    extension: .pl). To load data from the le le . pl one use
    consult ( ' le . pl ' ).

    Conjunction (^) is expressed in the Prolog using a comma:
        lubi(paulina, ola).
        lubi(paulina, piotr).
        lubi(piotr, rafal).
        lubi(ola, paulina).
        ...
        ?- lubi(paulina, ola),lubi(paulina,piotr).
        true.

        ?=lubi(X,ola),lubi(X,piotr).
        X=paulina.

        ?=lubi(paulina,X),lubi(X,rafal).
        X=piotr.

    Alternative (_) is expressed in the Prolog using a semicolon:
        lubi(paulina, ola).
        lubi(paulina, piotr).
        lubi(piotr, rafal).
        lubi(ola, paulina).
        ...
        ?- lubi(X,ola);lubi(X,rafal).
        X = paulina;
        X = piotr.