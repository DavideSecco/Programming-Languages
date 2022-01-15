
-- Requirements:
-- 1. The following table contains the HTML colors and the corresponding value in hexadecimal
-- form for each color element:
-- 
-- Color       Red		Green	Blue
-- Salmon		  #FA		#80		#72
-- Firebrick  	#B2		#22		#22
-- Red			    #FF		#00		#00
-- Darkred		  #8B		#00		#00
-- Lime			  #00		#FF		#00
-- Forestgreen	#22		#8B		#22
-- Green		    #00		#80		#00
-- Darkgreen	  #00		#64		#00
-- Blue			  #00		#00		#FF
-- Mediumblue	  #00		#00		#CD
-- Darkblue		  #00		#00		#8B
-- 
-- 
-- 2. The hexadecimal information of each HTML color can be mapped to three color elements:
-- red, green and blue.
-- 1. Each color element has a value between 0 and 255, or 00 and FF in hexadecimal.
-- 2. For example, for the color salmon, the hexadecimal value of the color elements are:
-- 3. Record RGB stores information about HTML colors in RGB format, so that we can retrieve the
-- individual color elements.
-- 4. Function To_RGB converts from the HTML_Color enumeration to the RGB type based on the
-- information from the table above.
-- 5. Function Image returns a string representation of the RGB type in this format:

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Color_Types;
use Color_Types;

procedure Main is
	type Test_Case_Index is(HTML_Color_To_RGB);

	procedure Check (TC : Test_Case_Index) is
	begin
		case TC is
			when HTML_Color_To_RGB =>
				for I in HTML_Color'Range loop
					Put_Line (HTML_Color'Image (I) & " => "& Image (To_RGB (I)) & ".");
				end loop;
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
