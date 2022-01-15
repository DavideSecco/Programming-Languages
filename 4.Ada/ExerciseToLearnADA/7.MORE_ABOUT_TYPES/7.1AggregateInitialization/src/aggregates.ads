-- Goal: initialize records and arrays using aggregates.
-- Steps:
-- 1. Implement the Aggregates package.
-- 1. Create the record type Rec.
-- 2. Create the array type Int_Arr.
-- 3. Implement the Init procedure that outputs a record of Rec type.
-- 4. Implement the Init_Some procedure.
-- 5. Implement the Init procedure that outputs an array of Int_Arr type.

-- Requirements:
-- 1. Record type Rec has four components of Integer type. These are the components with the
-- corresponding default values:
-- - W = 10
-- - X = 11
-- - Y = 12
-- - Z = 13
-- 2. Array type Int_Arr has 20 elements of Integer type (with indices ranging from 1 to 20).

-- 3. The first Init procedure outputs a record of Rec type where:
--    1. X is initialized with 100,
--    2. Y is initialized with 200, and
--    3. the remaining elements use their default values.
-- 4. Procedure Init_Some outputs an array of Int_Arr type where:
--    1. the first five elements are initialized with the value 99, and
--    2. the remaining elements are initialized with the value 100.
-- 5. The second Init procedure outputs an array of Int_Arr type where:
--    1. all elements are initialized with the value 5.

package Aggregates is
	type Rec is
		record
			W: Integer:= 10;
			X: Integer:= 11;
			Y: Integer:= 12;
			Z: Integer:= 13;
	end record;

	type Int_Arr is array(1..20) of Integer;

	procedure Init (A: out Rec);
	procedure Init_Some (A: out Int_Arr);
	procedure Init (A: out Int_Arr);
end Aggregates;
