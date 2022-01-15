-- 16 Subprograms
In Ada the subprograms are classified into two categories: procedures 1 and functions 2 . A
procedures call is a statement and does not return any value, whereas a function returns a
value and must therefore be a part of an expression.
Subprogram parameters may have three modes.

in => 
The actual parameter value goes into the call and is not changed there. The formal
parameter is a constant and allows only reading. This is the default when no mode is given.
The actual parameter is an expression.

in out => 
The actual parameter goes into the call and may be redefined. The formal parameter is a
variable and can be read and written.

out =>
The actual parameter's value before the call is irrelevant, it will get a value in the call. The
formal parameter can be read and written. (In Ada 83 out parameters were write-only.)
A parameter of any mode may also be explicitly aliased.

access => 
The formal parameter is an access (a pointer) to some variable. (This is not a parameter
mode from the reference manual point of view.)
Note that parameter modes do not specify the parameter passing method. Their purpose is
to document the data flow.

The parameter passing method depends on the type of the parameter. A rule of thumb is
that parameters fitting into a register are passed by copy, others are passed by reference.
For certain types, there are special rules, for others the parameter passing mode is left to
the compiler (which you can assume to do what is most sensible). Tagged types are always
passed by reference.

Explicitly aliased parameters and access parameters specify pass by reference.
Unlike in the C class of programming languages, Ada subprogram calls cannot have empty
parameters parentheses ( ) when there are no parameters.