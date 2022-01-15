
-- Requirements:
-- 1. These are the formal parameters for the generic package Gen_Queues:
--    1. a formal modular type;
--       - This modular type should be used by the Queue to declare an array that stores the
--       elements of the queue.
--       - The modulus of the modular type must correspond to the maximum number of el-
-- ements of the queue.
--    2. the data type of the elements of the queue.
--       - Select a formal parameter that allows you to store elements of any data type in the queue.
-- 2. These are the operations of the Queue type:
--    1. Function Empty indicates whether the queue is empty.
--    2. Function Full indicates whether the queue is full.
--    3. Entry Push stores an element in the queue.
--    4. Entry Pop removes an element from the queue and returns the element via output parameter.

-- Remarks:
-- 1. In this exercise, we create a queue container by declaring and implementing a protected type
-- (Queue) as part of a generic package (Gen_Queues).
-- 2. As a bonus exercise, you can analyze the body of the Queue_Tests package and understand
-- how the Queue type is used there.
-- 1. In particular, the procedure Concurrent_Test implements two tasks: T_Producer and
-- T_Consumer. They make use of the queue concurrently.

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Queue_Tests;
use Queue_Tests;

procedure Main is
	type Test_Case_Index is (Simple_Queue_Chk, Concurrent_Queue_Chk);

	procedure Check (TC : Test_Case_Index) is
	begin
		case TC is
			when Simple_Queue_Chk =>
				Simple_Test;
			when Concurrent_Queue_Chk =>
				Concurrent_Test;
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
