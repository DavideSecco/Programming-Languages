-- 5.5.2 Derived types
	type Integer_1 is range 1 .. 10;
	type Integer_2 is new Integer_1 range 2 .. 8;
	A : Integer_1 := 8;
	B : Integer_2 := A; --illegal!