-- Goal: write a procedure that displays the state of a machine.
-- Steps:
-- 1. Complete the procedure Display_State.
-- Requirements:
-- 1. The states can be set according to the following numbers:
-- Number     State
-- 0          Off
-- 1          On: Simple Processing
-- 2          On: Advanced Processing
-- 2. The procedure Display_State receives the number corresponding to a state and displays
-- the state (indicated by the table above) as a user message.
-- Remarks:
-- 1. You can use a case statement to implement this procedure.

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Display_State;

procedure Main is
	State : Integer;
begin
	if Argument_Count < 1 then
		Put_Line ("ERROR: missing arguments! Exiting...");
		return;
	elsif Argument_Count > 1 then
		Put_Line ("Ignoring additional arguments...");
	end if;
	State := Integer'Value (Argument (1));
	Display_State (State);
end Main;
