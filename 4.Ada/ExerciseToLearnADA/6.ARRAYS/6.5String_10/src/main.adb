-- Remarks:
-- 1. Declaring String_10 as a subtype of String is the easiest way.
-- - You may declare it as a new type as well. However, this requires some adaptations in
-- the Main test procedure.
-- 2. You can use Integer'Min to calculate the minimum of two integer values.

with Ada.Command_Line;
with Ada.Text_IO;
use Ada.Command_Line;
use Ada.Text_IO;
with Strings_10;
use Strings_10;

procedure Main is
	type Test_Case_Index is
		(String_10_Long_Chk,String_10_Short_Chk);

	procedure Check (TC : Test_Case_Index) is
		SL: constant String := "And this is a long string just for testing...";
		SS	: constant String := "Hey!";
		S_10: String_10;
	begin
		case TC is
			when String_10_Long_Chk =>
				S_10 := To_String_10 (SL);
				Put_Line(String(S_10));
			when String_10_Short_Chk =>
				S_10 := (others => ' ');
				S_10 := To_String_10 (SS);
				Put_Line(String(S_10));
		end case;
	end Check;

begin
	if Argument_Count < 1 then
		Ada.Text_IO.Put_Line ("ERROR: missing arguments! Exiting...");
		return;
	elsif Argument_Count > 1 then
		Ada.Text_IO.Put_Line ("Ignoring additional arguments...");
	end if;
	Check (Test_Case_Index'Value (Argument (1)));
end Main;
