-- Goal: rewrite a package to represent HTML colors in RGB format using a lookup table.
-- Steps:
-- 1. Implement the Color_Types package.
-- 1. Declare the array type HTML_Color_RGB.
-- 2. Declare the To_RGB_Lookup_Table object and initialize it.
-- 3. Adapt the implementation of To_RGB function.

package Color_Types is
	type HTML_Color is
		(Salmon,Firebrick,Red,Darkred,Lime,Forestgreen,Green,Darkgreen,Blue,Mediumblue,Darkblue);

	subtype Int_Color is Integer range 0 .. 255;

	type RGB is record
		Red		: Int_Color;
		Green : Int_Color;
		Blue  : Int_Color;
	end record;

	function To_RGB (C : HTML_Color) return RGB;
	function Image (C : RGB) return String;

	-- Declare array type for lookup table here:
	type HTML_Color_RGB is Array(HTML_Color) of RGB;
	-- Declare lookup table here:

	To_RGB_Lookup_Table: constant HTML_Color_RGB
		:= (Salmon => (16#FA#, 16#80#, 16#72#),
			Firebrick => (16#B2#, 16#22#, 16#22#),
			Red       => (16#FF#, 16#00#, 16#00#),
			Darkred   => (16#8B#, 16#00#, 16#00#),
			Lime      => (16#00#, 16#FF#, 16#00#),
			Forestgreen => (16#22#, 16#8B#, 16#22#),
			Green       => (16#00#, 16#80#, 16#00#),
			Darkgreen   => (16#00#, 16#64#, 16#00#),
			Blue        => (16#00#, 16#00#, 16#FF#),
			Mediumblue  => (16#00#, 16#00#, 16#CD#),
			Darkblue    => (16#00#, 16#00#, 16#8B#));
end Color_Types;
