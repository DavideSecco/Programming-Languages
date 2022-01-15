-- Remarks:
-- 1. You can use Currency (Q) to convert from an element Q of Quantity type to the Currency type.
-- 1. As you might remember, Ada requires an explicit conversion in calculations where vari-
-- ables of both integer and floating-point types are used.
-- 2. In our case, the Quantity subtype is based on the Integer type and the Currency subtype is
-- based on the Float type, so a conversion is necessary in calculations using those types.

with Ada.Command_Line;
with Ada.Text_IO; use Ada.Command_Line;
use Ada.Text_IO;
with Product_Info_Pkg; use Product_Info_Pkg;

procedure Main is
	package Currency_IO is new Ada.Text_IO.Float_IO (Currency);
	type Test_Case_Index is (Total_Func_Chk,Total_Proc_Chk,Total_Value_Chk);

	procedure Check (TC : Test_Case_Index) is
		subtype Test_Range is Positive range 1 .. 5;
		P    : Product_Infos (Test_Range);
		Tots : Currency_Array (Test_Range);
		Tot  : Currency;

	procedure Display (Tots : Currency_Array) is
	begin
		for I in Tots'Range loop
			Currency_IO.Put (Tots (I));
			New_Line;
		end loop;
	end Display;

	procedure Local_Init (P : in out Product_Infos) is
	begin
		P := ((1,0.5),
				 (2, 10.0),
				 (5, 40.0),
				 (10, 10.0),
				 (10, 20.0));
	end Local_Init;

	begin
		Currency_IO.Default_Fore := 1;
		Currency_IO.Default_Aft := 2;
		Currency_IO.Default_Exp := 0;
		case TC is
			when Total_Func_Chk =>
				Local_Init (P);
				Tots := Total (P);
				Display (Tots);
			when Total_Proc_Chk =>
				Local_Init (P);
				Total (P, Tots);
				Display (Tots);
			when Total_Value_Chk =>
				Local_Init (P);
				Tot := Total (P);
				Currency_IO.Put (Tot);
				New_Line;
		end case;
	end Check;

begin
	if Argument_Count < 1 then
		Put_Line ("ERROR: missing arguments! Exiting...");
		return;
	elsif Argument_Count > 1 then
		Put_Line ("Ignoring additional arguments...");
	end if;
	Check (Test_Case_Index'Value (Argument (1)));
end Main;
