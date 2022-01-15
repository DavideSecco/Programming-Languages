-- 8 Enumerations
	-- An enumeration type is defined as a list of possible values:
		type Primary_Color is (Red, Green, Blue);

	-- Also Booleans are defined as enumeration types:
		type Boolean is (False, True);

-- 8.3 Enumeration subtypes
	-- You can use range to subtype an enumeration type:
		subtype Capital_Letter is Character range 'A' .. 'Z';
		type Day_Of_Week is (Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday);
		subtype Working_Day is Day_Of_Week range Monday .. Friday;