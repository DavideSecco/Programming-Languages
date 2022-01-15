with Ada.Integer_Text_IO;
package body Color_Types is
	function To_Integer (C : HTML_Color) return Integer is
	begin
		case C is
			when Salmon	=> return 16#FA8072#;
			when Firebrick	=> return 16#B22222#;
			when Red		=> return 16#FF0000#;
			when Darkred	=> return 16#8B0000#;
			when Lime	=> return 16#00FF00#;
			when Forestgreen	=> return 16#228B22#;
			when Green	=> return 16#008000#;
			when Darkgreen	=> return 16#006400#;
			when Blue	=> return 16#0000FF#;
			when Mediumblue	=> return 16#0000CD#;
			when Darkblue	=> return 16#00008B#;
		end case;
	end To_Integer;

	function To_HTML_Color (C : Basic_HTML_Color) return HTML_Color is
	begin
		case C is
			when Red		=> return Red;
			when Green => return Green;
			when Blue  => return Blue;
		end case;
	end To_HTML_Color;

	function To_RGB (C : HTML_Color) return RGB is
	begin
		-- Implement the conversion from HTML_Color to RGB here!
		case C is
			when Salmon				=> return (Red => 16#FA#, Green => 16#80#, Blue => 16#72#);
			when Firebrick		=> return (Red => 16#B2#, Green => 16#22#, Blue => 16#22#);
			when Red					=> return (Red => 16#FF#, Green => 16#00#, Blue => 16#00#);
			when Darkred			=> return (Red => 16#8B#, Green => 16#00#, Blue => 16#00#);
			when Lime					=> return (Red => 16#00#, Green => 16#FF#, Blue => 16#00#);
			when Forestgreen	=> return (Red => 16#22#, Green => 16#8B#, Blue => 16#22#);
			when Green				=> return (Red => 16#00#, Green => 16#80#, Blue => 16#00#);
			when Darkgreen		=> return (Red => 16#00#, Green => 16#64#, Blue => 16#00#);
			when Blue					=> return (Red => 16#00#, Green => 16#00#, Blue => 16#FF#);
			when Mediumblue		=> return (Red => 16#00#, Green => 16#00#, Blue => 16#CD#);
			when Darkblue			=> return (Red => 16#00#, Green => 16#00#, Blue => 16#8B#);
		end case;

	end To_RGB;

	function Image (C : RGB) return String is
		subtype Str_Range is Integer range 1 .. 10;
		SR : String (Str_Range);
		SG : String (Str_Range);
		SB : String (Str_Range);
	begin
		-- Replace argument in the calls to Put below with the missing
		-- Elements (Red, Green, Blue) from the RGB record

		Ada.Integer_Text_IO.Put (To   => SR,
													 Item => C.Red, -- REPLACE!
													 Base => 16);
		Ada.Integer_Text_IO.Put (To   => SG,
													 Item => C.Green, -- REPLACE!
													 Base => 16);
		Ada.Integer_Text_IO.Put (To   => SB,
													 Item => C.Blue, -- REPLACE!
													 Base => 16);

		return ("(Red => " & SR & ", Green => " & SG & ", Blue => " & SB &")");
	end Image;
end Color_Types;
