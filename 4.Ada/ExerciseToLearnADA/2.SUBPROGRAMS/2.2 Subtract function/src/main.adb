-- Goal: write a function that subtracts two numbers.
-- Steps:
-- 1. Rewrite the Subtract procedure from the previous exercise as a function.
-- Requirements:
-- 1. Subtract performs the operation A - B and returns the result.


with Ada.Command_Line;
with Ada.Text_IO;
use Ada.Command_Line;
use Ada.Text_IO;
with Subtract;

procedure Main is

	type Test_Case_Index is (Sub_10_1_Chk, Sub_10_100_Chk, Sub_0_5_Chk, Sub_0_Minus_5_Chk);

	procedure Check (TC: Test_Case_Index) is
		Result: Integer;
	begin
		case TC is
		when Sub_10_1_Chk =>
			Result := Subtract (10, 1);
			Put_Line ("Result: " & Integer'Image (Result));
		when Sub_10_100_Chk =>
			Result := Subtract (10, 100);
			Put_Line ("Result   : " & Integer'Image (Result));
		when Sub_0_5_Chk =>
			Result := Subtract (0, 5);
			Put_Line ("Result   : " & Integer'Image (Result));
		when Sub_0_Minus_5_Chk =>
			Result := Subtract (0, -5);
			Put_Line ("Result : " & Integer'Image (Result));
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
