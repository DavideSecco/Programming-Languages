-- Goal: create a package to represent HTML colors in RGB format using the hexadecimal form.
-- Steps:
-- 1. Implement the Color_Types package.
-- 1. Declare the RGB record.
-- 2. Implement the To_RGB function.
-- 3. Implement the Image function for the RGB type.

package Color_Types is
	type HTML_Color is
		(Salmon, Firebrick,Red,Darkred,Lime,Forestgreen,Green,Darkgreen,Blue,Mediumblue,Darkblue);

	function To_Integer (C : HTML_Color) return Integer;

	type Basic_HTML_Color is	(Red,Green,Blue);

	function To_HTML_Color (C : Basic_HTML_Color) return HTML_Color;
	subtype Int_Color is Integer range 0 .. 255;

	-- Replace type declaration for RGB record below
	-- - NOTE: Use the Int_Color type declared above!
	type RGB is
		 record
			 Red: Int_Color;
			 Green: Int_Color;
			 Blue: Int_Color;
	end record;

	function To_RGB (C : HTML_Color) return RGB;
	function Image (C : RGB) return String;
end Color_Types;
