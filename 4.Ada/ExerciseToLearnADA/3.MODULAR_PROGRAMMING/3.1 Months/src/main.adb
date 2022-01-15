-- Goal: create a package to display the months of the year.
-- Steps:
-- 1. Convert the Months procedure below to a package.
-- 2. Create the specification and body of the Months package.
-- Requirements:
-- 1. Months must contain the declaration of strings for each month of the year, which are stored
-- in three-character constants based on the month's name.
-- - For example, the string "January" is stored in the constant Jan. These strings are then
-- used by the Display_Months procedure, which is also part of the Months package.
-- Remarks:
-- 1. The goal of this exercise is to create the Months package.
-- 1. In the code below, Months is declared as a procedure.
-- - Therefore, we need to convert it into a real package.
-- 2. You have to modify the procedure declaration and implementation in the code below,
-- so that it becomes a package specification and a package body.

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Months;
use Months;


procedure Main is
	type Test_Case_Index is (Months_Chk);

	procedure Check (TC : Test_Case_Index) is
	begin
		case TC is
		when Months_Chk => Display_Months;
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
