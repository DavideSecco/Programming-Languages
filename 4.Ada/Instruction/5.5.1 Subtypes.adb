-- 5.5.1 Creating subtypes
	type Integer_1 is range 1 .. 10;
	subtype Integer_2 is Integer_1		range 7 .. 11; --bad
	subtype Integer_3 is Integer_1'Base range 7 .. 11; -- OK
	A : Integer_1 := 8;
	B : Integer_3 := A; --OK

-- Predefined subtypes 
	subtype Natural is Integer range 0 .. Integer'Last;
	subtype Positive is Integer range 1 .. Integer'Last;