-- Requirements:
-- 1. For both Copy and =, the two parameters may refer to strings with different lengths. We'll
-- limit the implementation to just take the minimum length:
--    1. In case of copying the string "Hello World" to a string with 5 characters, the copied string is "Hello":
--          S1 : constant Lim_String := Init ("Hello World");
--          S2 : Lim_String := Init (5);
--       begin
--          Copy (From => S1, To => S2);
--          Put_Line (S2); This displays "Hello".

--     2. When comparing "Hello World" to "Hello", the = operator indicates that these strings are
--     equivalent:
--          S1 : constant Lim_String := Init ("Hello World");
--          S2 : constant Lim_String := Init ("Hello");
--     begin
--     if S1 = S2 then
--        True => This branch gets selected.

with Ada.Text_IO;
package body Limited_Strings is

	function Init (S : String) return Lim_String is
		LS : constant Lim_String := new String'(S);
	begin
		return Ls;
	end Init;

	function Init (Max : Positive) return Lim_String is
		LS : constant Lim_String := new String (1 .. Max);
	begin
		LS.all := (others => '_');
		return LS;
	end Init;

	procedure Put_Line (LS : Lim_String) is
	begin
		Ada.Text_IO.Put_Line (LS.all);
	end Put_Line;

	function Get_Min_Last (A, B : Lim_String) return Positive is
	begin
		return Positive'Min (A'Last, B'Last);
	end Get_Min_Last;

	procedure Copy (From : Lim_String;
								 To		 : in out Lim_String) is
		Min_Last : constant Positive := Get_Min_Last (From, To);
	begin
		-- Complete the implementation!
		To (To'First .. Min_Last):= From (To'First .. Min_Last);
    To (Min_Last + 1 .. To'Last) := (others => '_');
	end;

	function "=" (Ref, Dut : Lim_String) return Boolean is
		Min_Last : constant Positive := Get_Min_Last (Ref, Dut);
	begin
		-- Complete the implementation!
		for I in Dut'First .. Min_Last loop
			if Dut (I) /= Ref (I) then
				return False;
			end if;
		end loop;
		return True;
	end;
end Limited_Strings;
