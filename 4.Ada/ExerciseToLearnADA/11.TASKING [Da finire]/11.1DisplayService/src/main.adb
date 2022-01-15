

with Ada.Command_Line;
use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Display_Services;
use Display_Services;

procedure Main is
	type Test_Case_Index is (Display_Service_Chk);

	procedure Check (TC : Test_Case_Index) is
		Display : Display_Service;
	begin
		case TC is
			when Display_Service_Chk =>
				Display.Display ("Hello");
				delay 0.5;
				Display.Display ("Hello again");
				delay 0.5;
				Display.Display (55);
				delay 0.5;
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
