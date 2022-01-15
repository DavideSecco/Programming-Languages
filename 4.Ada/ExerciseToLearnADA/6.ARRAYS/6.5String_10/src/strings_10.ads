-- Goal: work with constrained string types.
-- Steps:
-- 1. Implement the Strings_10 package.
--    1. Declare the String_10 type.
--    2. Implement the To_String_10 function.


package Strings_10 is
-- Complete the type and subprogram declarations:
	subtype String_10 is String(1..10);

-- Using "type String_10 is..." is possible, too. However, it
-- requires a custom Put_Line procedure that is called in Main:

-- procedure Put_Line (S : String_10);

	function To_String_10 (S1: String) return String_10;
end Strings_10;
