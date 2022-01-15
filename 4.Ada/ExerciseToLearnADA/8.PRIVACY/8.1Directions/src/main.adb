with Ada.Command_Line;
with Ada.Text_IO;
use Ada.Command_Line;
use Ada.Text_IO;
with Test_Directions;

procedure Main is
	type Test_Case_Index is (Direction_Chk);
	procedure Check (TC : Test_Case_Index) is
	begin
		case TC is
			when Direction_Chk =>
				Test_Directions;
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
