-- 7 Unsigned integer types
	mod Modulus

	type Unsigned_n is mod 2**n;

	type Byte is mod 256;
	subtype Half_Byte is Byte range 0 .. 127;