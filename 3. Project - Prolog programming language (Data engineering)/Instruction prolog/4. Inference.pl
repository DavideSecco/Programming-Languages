Inference in the Prolog
    Let us express some more facts from which one can infer:
        plec (ewa, k).
        plec (ala, k).
        plec (adam, "m")
        plec (marek, "m").
        rodzic (ewa, ala).
        rodzic (ewa, marek).
        rodzic (adam, marek).
        matka (R, P) :- rodzic (R, P), plec (R, k).     %Horn clause

    (Example by dr K.M. Ocetkiewicz.)
    Note: In Polish pªe¢ means gender, rodzic means a parent, matka means a mother.

    Sample inferences:
        ?- matka (ewa, marek) .
        true.
        ?- matka (adam,marek).
        false.
        ?-matka (ala,ewa).
        false.
        ?- matka (ewa,Y).
        Y=ala;
        Y=marek.

/* Inference in the Prolog */
    How does inference work? We have a rule:
        matka (R, P) := r o d z i c (R, P) , p l e c (R, k ) .
    and a query matka(ewa,marek)..
    We bind R with ewa and P with marek.
    For matka(R, P) to be true, the following two has to hold: rodzic (R, P)
    and plec (R, k).
    Subqueries are evaluated left to right. First, the subquery
    rodzic (ewa, marek). is evaluated, here it is "hit"; then the evaluated
    subquery plec (ewa, k) . is also "hit". Both subqueries are "hit", so
    "hit"is also the conclusion that matka(ewa,marek). holds.

/* Keyword is */
    A prime number X is Mersenne if it is of the form 2Y 􀀀 1 for some
    natural Y . Example with keyword is :
        p(2).
        p(3).
        p(5).
        p(7).
        ...
        p(23).
        p(29).
        p(31).
        malaMersenne (X) :=p (X) , between (0, 5, Y) , pow(2,Y,Z) , (X is Z-1) .
    The query smallMersenne(X) returns 3, 7 and 31.
    Note: In Polish maªa means small.
