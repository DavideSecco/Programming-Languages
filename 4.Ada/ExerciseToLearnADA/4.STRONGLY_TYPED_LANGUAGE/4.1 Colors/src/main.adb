with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Color_Types; use Color_Types;

procedure Main is
	type Test_Case_Index is (HTML_Color_Range, HTML_Color_To_Integer, Basic_HTML_Color_To_HTML_Color);

	procedure Check (TC : Test_Case_Index) is
	begin
		case TC is
		when HTML_Color_Range =>
			for I in HTML_Color'Range loop
				Put_Line (HTML_Color'Image (I));
			end loop;
		when HTML_Color_To_Integer =>
			for I in HTML_Color'Range loop
				Ada.Integer_Text_IO.Put (Item => To_Integer (I), Width => 6, Base => 16);
				New_Line;
			end loop;
		when Basic_HTML_Color_To_HTML_Color =>
			for I in Basic_HTML_Color'Range loop
				Put_Line (HTML_Color'Image (To_HTML_Color (I)));
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
