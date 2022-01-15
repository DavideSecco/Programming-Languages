-- 2. Function To_String_10 returns constrained strings of String_10 type based on an input
-- parameter of String type.
-- - For strings that are more than 10 characters, omit everything after the 11th character.
-- - For strings that are fewer than 10 characters, pad the string with ' ' characters until it is
-- 10 characters.

-- Requirements:
-- 1. The constrained string type String_10 is an array of ten characters.

package body Strings_10 is
	-- Complete The Subprogram Declaration and Implementation:
	function To_String_10 (S1: String) return String_10 is
		S2: String_10;
	begin
		for I in 1..10 loop
			if(I < S1'Length) then
				S2(I):= S1(I);
			else
				S2(I):= ' ';
			end if;
		end loop;
		return S2;
	end To_String_10;
end Strings_10;
