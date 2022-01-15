-- 3. The first Init procedure outputs a record of Rec type where:
--    1. X is initialized with 100,
--    2. Y is initialized with 200, and
--    3. the remaining elements use their default values.
-- 4. Procedure Init_Some outputs an array of Int_Arr type where:
--    1. the first five elements are initialized with the value 99, and
--    2. the remaining elements are initialized with the value 100.
-- 5. The second Init procedure outputs an array of Int_Arr type where:
--    1. all elements are initialized with the value 5.

package body Aggregates is
	procedure Init (A: out Rec) is
	begin
		-- A.X:= 100;
		-- A.Y:= 200;
		A:= (X => 100, Y => 200, others => <>);
	end Init;

	procedure Init_Some (A: out Int_Arr) is
	begin
		-- for I in A'First .. A'Last loop
		--	if I <= 5 then
		--		A(I):= 99;
		--	else
		--		A(I):= 100;
		--	end if;
		-- end loop;
		A:= (1..5 => 99, others => 100);
	end Init_Some;

	procedure Init (A: out Int_Arr) is
	begin
		-- for I in A'Range loop
		-- 	A(I):= 5;
		-- end loop;
		A:= (others => 5);
	end Init;

end Aggregates;
