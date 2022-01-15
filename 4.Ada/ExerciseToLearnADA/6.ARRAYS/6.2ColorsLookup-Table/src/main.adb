
-- Requirements:
-- 1. Array type HTML_Color_RGB is used for the table.
-- 2. The To_RGB_Lookup_Table object of HTML_Color_RGB type contains the lookup table.
-- - This table must be implemented as an array of constant values.
-- 3. The implementation of the To_RGB function must use the To_RGB_Lookup_Table object.
-- Remarks:
-- 1. This exercise is based on the HTML colors exercise from a previous lab (Records (page 31)).
-- 2. In the previous implementation, you could use a case statement to implement the To_RGB
-- function. Here, you must rewrite the function using a look-up table.
-- 1. The implementation of the To_RGB function below includes the case statement as
-- commented-out code. You can use this as your starting point: you just need to copy
-- it and convert the case statement to an array declaration.
-- 1. Don't use a case statement to implement the To_RGB function. Instead, write code that
-- accesses To_RGB_Lookup_Table to get the correct value.
-- 3. The following table contains the HTML colors and the corresponding value in hexadecimal
-- form for each color element:

with Ada.Command_Line;
with Ada.Text_IO; use Ada.Command_Line;
use Ada.Text_IO;
with Color_Types; use Color_Types;

procedure Main is
	type Test_Case_Index is (Color_Table_Chk,HTML_Color_To_Integer_Chk);

	procedure Check (TC : Test_Case_Index) is
	begin
		case TC is
			when Color_Table_Chk =>
				Put_Line ("Size of HTML_Color_RGB: "& Integer'Image (HTML_Color_RGB'Length));
				Put_Line ("Firebrick: "& Image (To_RGB_Lookup_Table (Firebrick)));
			when HTML_Color_To_Integer_Chk =>
				for I in HTML_Color'Range loop
					Put_Line (HTML_Color'Image (I) & " => "& Image (To_RGB (I)) & ".");
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
