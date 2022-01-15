with Ada.Command_Line;
use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Display_Numbers;

procedure Main is
	A, B: Integer;
begin
	if Argument_Count < 2 then
		Put_Line ("ERROR: missing arguments! Exiting...");
		return;
	elsif Argument_Count > 2 then
		Put_Line ("Ignoring additional arguments...");
	end if;

	A := Integer'Value (Argument (1));
	B := Integer'Value (Argument (2));
	Display_Numbers (A, B);
end Main;
