-- Goal: write a function that compares two values and returns a flag.
-- Steps:
-- 1. Complete the Is_Equal subprogram.
-- Requirements:
-- 1. Is_Equal returns a flag as a Boolean value.
-- 2. The flag must indicate whether the values are equal (flag is True) or not (flag is False).

with Ada.Command_Line;
with Ada.Text_IO;
use Ada.Command_Line;
use Ada.Text_IO;
with Is_Equal;

procedure Main is
	type Test_Case_Index is (Equal_Chk, Inequal_Chk);

	procedure Check (TC : Test_Case_Index) is

		procedure Display_Equal (A, B : Integer; Equal : Boolean) is
		begin
			Put (Integer'Image (A));
			if Equal then
				Put (" is equal to ");
			else
				Put (" isn't equal to ");
			end if;
			Put_Line (Integer'Image (B) & ".");
		end Display_Equal;

		Result : Boolean;

	begin
		case TC is
		when Equal_Chk =>
			for I in 0 .. 10 loop
				Result := Is_Equal (I, I);
				Display_Equal (I, I, Result);
			end loop;
		when Inequal_Chk =>
			for I in 0 .. 10 loop
				Result := Is_Equal (I, I - 1);
				Display_Equal (I, I - 1, Result);
			end loop;
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
