/* Resolution */
    The resolution is the automatic theorem proving method in which subsequent clauses are generated based on earlier ones.
    Let a1, ..., am, b1, ..., bn and c be formulas or their negations (so-called literals ).
    If we know that it holds a1 v a2 ... am v c and b1 v b2 ... bn v (simbolo impossibile) c, then we may infere that
        a1 v a2 ... am v b1 v b2 ... bn:
    In particular, from the inference rule modus ponens: If ¬p v q (i.e. p ==> q) and p, then q.

/* Horn Clauses */
    From the point of view of programming in logic, the so-called Horn clauses are particularly important.
    Let a0, a1, ... am be literals. Horn Clauses are of the form:
            /* formula impossibile da riscrivere */
    or, equivalenty
            a0 v ¬a1 v ¬a2 v ... v ¬am:
    Note: q <-- p is equivalent p --> q.

/* Resolution on Horn clauses */
    Each Horn clause has at most one non-negated formula.

    By properly choosing a pair of Horn clauses and carrying out a
    resolution, we can as a result obtain another Horn clause (and reject
    the matched pair). In this way we reduce the number of Horn
    clauses.

    Facts, or Horn clauses with one non-negated formula without free
    variables, can reduce the length of the Horn clause by 1.
