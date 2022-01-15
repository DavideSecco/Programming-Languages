-- Export of a module
    Let's create a Haskell file with a denition of a function that we want to call from a C++ program:
    module FunDlaCpp where

    foreign export ccall fun :: Double => Double
    fun :: Double => Double
    fun = (\x => x^2)

    Let us save it under the name DoCpp.hs.
    Compilation, e.g. with the command ghc -c
    -XForeignFunctionInterface DoCpp.hs, will create the object le
    DoCpp.o and the related header le DoCpp_stub.h.

-- Stub of a Haskell module in C++
    The header le DoCpp_stub.h has the following content:
    #include "HsFFI.h"
    #ifdef __cplusplus
    extern "C" {
    #endif
    extern HsDouble fun ( HsDouble a1 ) ;
    #ifdef __cplusplus
    }
    #endif
    The keyword of the C language extern next to the declaration means
    that the compiler (not the linker) has no access to the denition of
    the expression.

    Note that the stub file includes the header file HsFFI.h (FFI stands for foreign function interface ).
    This file species how to map variable types from Haskell to C or C++.

-- C++ code calling a Haskell module
    An example le using the Haskell module may have the following form:
    #include <iostream>
    #include "DoCpp_stub . h"
    int main ( i n t argc , cha r * a rgv [ ] ) {
        hs_i n i t (&argc , &a rgv ) ;
        std :: cout << fun ( 3 ) << std :: endl;
        hs_exit ( ) ;
    }

-- C++ code calling a Haskell module
    Let's save the above le under the name uruchomHs.cpp and compile
    using the command g++ -c uruchomHs.cpp -I/usr/lib/ghc/include.
    We obtain an object le uruchomHs.o.
    In the example call, we indicate to the compiler that additional
    header les may be searched in the directory /usr/lib/ghc/include. It
    contains, among others, the mentioned HsFFI.h le. The path to this
    directory varies depending on the system and its conguration.
    We link object les using the command ghc -no-hs-main DoCpp.o
    uruchomHs.o -lstdc++ -o uruchomHs. The -no-hs-main option will
    avoid double denition of main .
