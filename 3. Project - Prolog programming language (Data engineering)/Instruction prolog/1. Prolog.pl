/* Atoms in Prolog*/
    The simplest expressions in Prolog are called atoms (constants or strings) and do not mean anything in themselves.
    In order to check if something is an atom one can use a predicate atom/1 (/1 means the predicate is of arity 1).
    ?- atom(characters_and_UNDERSCORE_with_SMALL_letter).
    true.

    ?- atom(A_with_CAPTIAL) .
    false.

    ?- atom(12) .
    false.

    ?- atomic (12) .
    true.

    ?- atom(q) .
    true.

    ?- atom(Q) .
    false.

    ?= atom('Q') .
    true .

    ?= atom( ' a sample t e x t wi th s p a c e s or not ' ) .
    true.

/* Variables in Prolog */
Variables (or more properly, unknowns) have names starting with a
captial letter or underscore:
    ?- var (This_i s_a_variale).    %with CAPITAL letter
    true.

    ?= var (this_i s_a_variable).   %starts with underscore
    true.

    ?- var (_).                     %anonymous variable, one cannot refer to it
    true.
    ?- var (and_this_is_atom).      %this not avariable
    false.

/* Numeric types in Prolog */
In Prolog, we have two numeric types, integer and real:
    ?- integer (2).
    true.

    ?= integer (2.1) .
    false.

    ?= integer (2.0) .
    false.

    ?= number (2.0) .
    true.

    ?= number (2.1) .
    true.

    ?= number (a) .
    false.


