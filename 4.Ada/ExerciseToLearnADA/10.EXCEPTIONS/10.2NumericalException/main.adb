-- Goal: handle numerical exceptions in a test procedure.
-- Steps:
-- 1. Add exception handling to the Check_Exception procedure.
-- Requirements:
-- 1. The test procedure Num_Exception_Test from the Tests package below must be used in the implementation of Check_Exception.
-- 2. The Check_Exception procedure must be extended to handle exceptions as follows:
-- 	1. If the exception raised by Num_Exception_Test is Constraint_Error, the procedure must display the message "Constraint_Error detected!" to the user.
-- 	2. Otherwise, it must display the message associated with the exception.
-- Remarks:
-- 1. You can use the Exception_Message function to retrieve the message associated with an exception.

with Ada.Command_Line; 	use Ada.Command_Line;
with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Exceptions;		use Ada.Exceptions;
with Tests;					use Tests;
with Check_Exception;	

procedure Main is
	type Test_Case_Index is	(Exception_1_Chk,	Exception_2_Chk);
	
	procedure Check (TC : Test_Case_Index) is
		procedure Check_Handle_Exception (ID : Test_ID) is
		begin
			Check_Exception (ID);
			exception
				when Constraint_Error => Put_Line ("Constraint_Error" & " (raised by Check_Exception) detected!");
				when E : others => Put_Line (Exception_Name (E) & " (raised by Check_Exception) detected!");
		end Check_Handle_Exception;

		begin
		case TC is
			when Exception_1_Chk =>	Check_Handle_Exception (Test_1);
			when Exception_2_Chk =>	Check_Handle_Exception (Test_2);
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