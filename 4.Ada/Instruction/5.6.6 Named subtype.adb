-- 5.6.6 Named subtype
	type Count_To_Ten is range 1 .. 10;

	subtype Ten_Characters is String (Count_to_Ten);

	subtype Positive is Integer range 1 .. Integer'Last;
	type String is (Positive range <>) of Character;

	subtype Count_To_Ten is Integer range 1 .. 10;
	subtype Ten_Characters is String (Count_to_Ten);

-- 5.6.7 Unconstrained subtype
	subtype My_String is String;