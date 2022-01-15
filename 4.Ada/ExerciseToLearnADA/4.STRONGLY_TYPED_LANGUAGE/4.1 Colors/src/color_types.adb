-- 3. Function To_Integer converts from the HTML_Color type to the HTML color code

-- - You can find the HTML color codes in the table below.
-- 4. Function To_HTML_Color converts from Basic_HTML_Color to HTML_Color.

package body Color_Types is
-- Implement the conversion from HTML_Color to Integer here!
	function To_Integer (C : HTML_Color) return Integer is
	begin
		-- Hint: use 'case' for the HTML colors;
		-- use 16#...# for the hexadecimal values.
		case C is
			when Salmon => return 16#FA8072#;
			when Firebrick => return 16#B22222#;
			when Red => return 16#FF0000#;
			when Darkred => return 16#8B0000#;
			when Lime => return 16#00FF00#;
			when Forestgreen => return 16#228B22#;
			when Green => return 16#008000#;
			when Darkgreen => return 16#006400#;
			when Blue => return 16#0000FF#;
			when Mediumblue => return 16#0000CD#;
			when Darkblue => return 16#00008B#;
		end case;

	end To_Integer;

	-- Implement the conversion from Basic_HTML_Color to HTML_Color here!
	function To_HTML_Color (C : Basic_HTML_Color) return HTML_Color is
	begin
		case C is
			when Red => return Red;
			when Green => return Green;
			when Blue => return Blue;
		end case;
	end To_HTML_Color;

end Color_Types;
