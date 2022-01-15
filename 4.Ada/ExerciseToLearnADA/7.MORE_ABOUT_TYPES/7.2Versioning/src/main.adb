
-- 2. The first Convert function returns a string containing the version number.
-- 3. The second Convert function returns a floating-point value.
--    1. For this floating-point value:
--       1. the number before the decimal point must correspond to the major number, and
--       2. the number after the decimal point must correspond to the minor number.
--       3. the maintenance number is ignored.
--    2. For example, version "1.3.5" is converted to the floating-point value 1.3.
--    3. An obvious limitation of this function is that it can only handle one-digit numbers for the minor component.
-- - For example, we cannot convert version "1.10.0" to a reasonable value with the ap-
-- proach described above. The result of the call Convert ((1, 10, 0)) is therefore
-- unspecified.
-- - For the scope of this exercise, only version numbers with one-digit components are
-- checked.
-- Remarks:
-- 1. We use overloading for the Convert functions.
-- 2. For the function Convert that returns a string, you can make use of the Image_Trim function,
-- as indicated in the source-code below - see package body of Versioning.

with Ada.Command_Line;
with Ada.Text_IO; use Ada.Command_Line;
use Ada.Text_IO;
with Versioning; use Versioning;

procedure Main is
	type Test_Case_Index is
		(Ver_String_Chk,Ver_Float_Chk);

	procedure Check (TC : Test_Case_Index) is
		V : constant Version := (1, 3, 23);
	begin
		case TC is
			when Ver_String_Chk
				=> Put_Line (Convert (V));
			when Ver_Float_Chk =>	Put_Line (Float'Image (Convert (V)));
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
