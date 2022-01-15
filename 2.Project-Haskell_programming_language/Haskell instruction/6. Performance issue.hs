// MEMOIZATION AND TIMINGS (scrivere le cose in modo diverso cambia le performance)
    Two ways to dene the Fibonacci sequence:
    low_fib :: Int => Integer
    slow_fib 0 = 0
    slow_fib 1 = 1
    slow_fib n = slow_fib (n=2) + slow_fib (n=1)

    memoized_fib :: Int => Integer
    memoized_fib = (mapfib[0..]!!)      -- infinitelist
    wherefib0 = 0
    fib 1 = 1
    fib n = memoized_fib (n=2) + memoized_fib (n=1)

    The above example comes from https://wiki.haskell.org/Memoization.
    Recall that one of the properties of Haskell is the lazy evaluation, i.e.
    the values of the expressions are determined only when they are
    needed.
    The System.CPUTime module contains the getCPUTime function that
    returns the CPU time used by the current program, which can be
    displayed in a readable way using the System.TimeIt module.
    The example call slow_b 30 takes 1.33s, while memoized_b 30,000
    takes only 0.15s!
    Z poziomu GHCi wy±wietlanie czasu wykonania i u»ycia pami¦ci
    mo»na wª¡czy¢ komend¡ : set +s .