-- 11.1.1 Basic syntax
	array (Index_Range) of Element_Type

	type Character_Counter is array (Character) of Natural;

-- 11.1.2 With known subrange
	subtype Index_Sub_Type is Index_Type range First .. Last
	array (Index_Sub_Type) of Element_Type

	array (Index_Type range First .. Last) of Element_Type
	array (First .. Last) of Element_Type

	type Character_Counter is array (Character range 'A' .. 'Z') of Natural;

-- 11.1.3 With unknown subrange
	array (Index_Type range <>) of Element_Type;

	type String is array (Positive range <>) of Character;



