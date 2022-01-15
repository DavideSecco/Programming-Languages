-- Goal: implement an on/off indicator for a state machine.
-- Steps:
-- 1. Implement the function Is_On.
-- 2. Implement the procedure Display_On_Off.
-- Requirements:
-- 1. Implement same state machine as in the previous exercise.
-- 2. Function Is_On returns:
--  - True if the machine is on;
--  - otherwise, it returns False.
-- 3. Procedure Display_On_Off displays the message
--  - "On" if the machine is on, or
--  - "Off" otherwise.
-- 4. Is_On must be called in the implementation of Display_On_Off.
-- Remarks:
-- 1. You can implement both subprograms using if expressions.

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Display_On_Off;
with Is_On;

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
	Display_On_Off (State);
	Put_Line (Boolean'Image (Is_On (State)));
end Main;
