-- Goal: create a package to perform basic mathematical operations.
-- Steps:
-- 1. Implement the Operations package.
-- 1. Declare and implement the Add function.
-- 2. Declare and implement the Subtract function.
-- 3. Declare and implement the Multiply: function.
-- 4. declare and Implement The Divide function.
-- 2. Implement the Operations.Test package
-- 1. Declare and implement the Display procedure.

-- Requirements:
-- 1. Package Operations contains functions for each of the four basic mathematical operations
-- for parameters of Integer type:
-- 1. Function Add performs the addition of A and B and returns the result;
-- 2. Function Subtract performs the subtraction of A and B and returns the result;
-- 3. Function Multiply performs the multiplication of A and B and returns the result;
-- 4. Function Divide: performs the division of A and B and returns the result.
-- 2. Package Operations.Test contains the test environment:
-- 1. Procedure Display must use of the functions from the parent (Operations) package
-- as indicated by the template in the code below.

with Ada.Command_Line;
use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Operations;
with Operations.Test;
use Operations.Test;

procedure Main is
	type Test_Case_Index is
	  (Operations_Chk,
	 Operations_Display_Chk);
	procedure Check (TC : Test_Case_Index) is
	begin
		case TC is
		when Operations_Chk =>
			Put_Line ("Add (100, 2) = " & Integer'Image (Operations.Add (100, 2)));
			Put_Line ("Subtract (100, 2) = " & Integer'Image (Operations.Subtract (100, 2)));
			Put_Line ("Multiply (100, 2) = " & Integer'Image (Operations.Multiply (100, 2)));
			Put_Line ("Divide (100, 2) = " & Integer'Image (Operations.Divide (100, 2)));
		when Operations_Display_Chk =>
			Display (10, 5);
			Display ( 1, 2);
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
