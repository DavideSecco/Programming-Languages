
-- Requirements:
-- 1. Record Ext_Angle stores information about the extended angle (see remark about extended
-- angles below).
-- 2. Procedure Display displays information about the extended angle.
-- 1. You should use the implementation that has been commented out (see code below) as
-- a starting point.
-- 3. Function To_Ext_Angle converts a simple angle value to an extended angle (Ext_Angle
-- type)

-- Remarks:
-- 1. We make use of the algorithm implemented in the Check_Direction procedure (chapter
-- on imperative language 2 ).
-- 2. For the sake of this exercise, we use the concept of extended angles. This includes the actual
-- geometric angle and the corresponding direction (North, South, Northwest, and so on).

with Ada.Command_Line;
with Ada.Text_IO; use Ada.Command_Line;
use Ada.Text_IO;
with Directions; use Directions;

procedure Main is
	type Test_Case_Index is (Direction_Chk);

	procedure Check (TC : Test_Case_Index) is
	begin
		case TC is
			when Direction_Chk =>
				Display (To_Ext_Angle (0));
				Display (To_Ext_Angle (30));
				Display (To_Ext_Angle (45));
				Display (To_Ext_Angle (90));
				Display (To_Ext_Angle (91));
				Display (To_Ext_Angle (120));
				Display (To_Ext_Angle (180));
				Display (To_Ext_Angle (250));
				Display (To_Ext_Angle (270));
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
