-- Goal: create a simple service that displays messages to the user.
-- Steps:
-- 1. Implement the Display_Services package.
-- 1. Declare the task type Display_Service.
-- 2. Implement the Display entry for strings.
-- 3. Implement the Display entry for integers.

-- Requirements:
-- 1. Task type Display_Service uses the Display entry to display messages to the user.
-- 2. There are two versions of the Display entry:
--    1. One that receives messages as a string parameter.
--    2. One that receives messages as an Integer parameter.
-- 3. When a message is received via a Display entry, it must be displayed immediately to the user.

package Display_Services is
	task type Display_Service is
		entry Display (S: in String);
		entry Display (I: in Integer);
	end Display_Service;
end Display_Services;
