-- It doesn't work!!! but I don't know with (it has a strange error...)


-- 2. When copying from a short string to a longer string, the remaining characters of the longer
-- string must be initialized with underscores (_). For example:
-- S1 : constant Lim_String := Init ("Hello");
-- S2 :          Lim_String := Init (10);
-- begin
-- Copy (From => S1, To => S2);
-- -- This displays "Hello_____".
-- Put_Line (S2);
-- Remarks:
-- 1. As we've discussed in the course:
-- 1. Variables of limited types have the following limitations:
-- - they cannot be assigned to;
-- - they don't have an equality operator (=).
-- 2. We can, however, define our own, custom subprograms to circumvent these limitations:
-- - In order to copy instances of a limited type, we can define a custom Copy procedure.
-- - In order to compare instances of a limited type, we can define an = operator.
-- 2. You can use the Min_Last constant - which is already declared in the implementation of
-- these subprograms - in the code you write.
-- 3. Some details about the Limited_Strings package:
-- 1. The Lim_String type acts as a container for strings.
-- 1. In the the private part, Lim_String is declared as an access type to a String.
-- 2. There are two versions of the Init function that initializes an object of Lim_String
-- type:
-- 1. The first one takes another string.
-- 2. The second one receives the number of characters for a string container.
-- 3. Procedure Put_Line displays object of Lim_String type.
-- 4. The design and implementation of the Limited_Strings package is very simplistic.
-- 1. A good design would have better handling of access types, for example.

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Check_Lim_String;

procedure Main is

	type Test_Case_Index is (Lim_String_Chk);

	procedure Check (TC : Test_Case_Index) is
	begin
		case TC is
			when Lim_String_Chk =>
				Check_Lim_String;
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
