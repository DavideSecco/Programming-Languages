-- I don't know why, but the debug doesn't work.

with Ada.Command_Line;
use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Event_Managers;
with Ada.Real_Time;
use Event_Managers;
use Ada.Real_Time;

procedure Main is
	type Test_Case_Index is (Event_Manager_Chk);

	procedure Check (TC : Test_Case_Index) is
		Ev_Mng : array (1 .. 5) of Event_Manager;
	begin
		case TC is
			when Event_Manager_Chk =>
				for I in Ev_Mng'Range loop
					Ev_Mng(I).Start (I);
				end loop;
				Ev_Mng (1).Event (Clock + Seconds (5));
				Ev_Mng (2).Event (Clock + Seconds (3));
				Ev_Mng (3).Event (Clock + Seconds (1));
				Ev_Mng (4).Event (Clock + Seconds (2));
				Ev_Mng (5).Event (Clock + Seconds (4));
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
