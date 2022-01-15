-- Goal: implement a simple event manager.
-- Steps:
-- 1. Implement the Event_Managers package.
-- 1. Declare the task type Event_Manager.
-- 2. Implement the Start entry.
-- 3. Implement the Event entry.

-- Remarks:
-- 1. In the Start entry, you can use the Natural type for the ID.
-- 2. In the Event entry, you should use the Time type from the Ada.Real_Time package for the time parameter.
-- 3. Note that the test application below creates an array of event managers with different delays.

with Ada.Real_Time;
use Ada.Real_Time;

package Event_Managers is
	task type Event_Manager is
		entry Start(ID: in Natural);
		entry Event(T: in Time);
	end Event_Manager;
end Event_Managers;
