-- Requirements:
-- 1. The event manager has a similar behavior as an alarm
--    1. The sole purpose of this event manager is to display the event ID at the correct time.
--    2. After the event ID is displayed, the task must finish.
-- 2. The event manager (Event_Manager type) must have two entries:
--    1. Start, which starts the event manager with an event ID;
--    2. Event, which delays the task until a certain time and then displays the event ID as a user message.
-- 3. The format of the user message displayed by the event manager is Event #<event_id>.
--    1. You should use Natural'Image to display the ID (as indicated in the body of the Event_Managers package below).

with Ada.Text_IO;
use Ada.Text_IO;

package body Event_Managers is
	-- Don't forget to display the event ID:
	task body Event_Manager is
		Event_ID: Natural:= 0;
		Event_Delay: Time;
	begin
		accept Start (ID : in Natural) do
			Event_ID:= ID;
		end Start;

		accept Event (T : in Time) do
			Event_Delay:= T;
		end Event;

		delay until Event_Delay;
		Put_Line("Event #" & Natural'Image (Event_ID));
	end Event_Manager;

end Event_Managers;
