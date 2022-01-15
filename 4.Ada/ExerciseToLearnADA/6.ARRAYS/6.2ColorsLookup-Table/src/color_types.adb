with Ada.Integer_Text_IO;
package body Color_Types is
	function To_RGB (C : HTML_Color) return RGB is
	begin
		-- Implement To_RGB using To_RGB_Lookup_Table
		return To_RGB_Lookup_Table(C);
	end To_RGB;

	function Image (C : RGB) return String is
		subtype Str_Range is Integer range 1 .. 10;
		SR : String (Str_Range);
		SG : String (Str_Range);
		SB : String (Str_Range);
	begin
			Ada.Integer_Text_IO.Put (To  => SR,
														Item => C.Red,
														Base => 16);
			Ada.Integer_Text_IO.Put (To  => SG,
														Item => C.Green,
														Base => 16);
			Ada.Integer_Text_IO.Put (To  => SB,
														Item => C.Blue,
														Base => 16);
			return ("(Red => " & SR & ", Green => " & SG & ", Blue => " & SB	 &")");
	end Image;
end Color_Types;
