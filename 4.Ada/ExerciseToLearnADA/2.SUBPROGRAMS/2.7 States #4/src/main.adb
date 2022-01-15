-- Goal: implement a procedure to update the state of a machine.
-- Steps:
-- 1. Implement the procedure Set_Next.
-- Requirements:
-- 1. Implement the same state machine as in the previous exercise.
-- 2. Procedure Set_Next updates the machine's state with the next one in a circular manner:
--  - In most cases, the next state of N is simply the next number (N + 1).
--  - However, if the state is the last one (which is 2 for our machine), the next state must be
-- the first one (in our case: 0).
-- Remarks:
-- 1. You can use an if expression to implement Set_Next.

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Set_Next;

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
	Set_Next (State);
	Put_Line (Integer'Image (State));
end Main;
