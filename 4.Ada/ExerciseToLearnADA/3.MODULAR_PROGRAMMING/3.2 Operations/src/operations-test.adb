with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Command_Line;
use Ada.Command_Line;

package body Operations.Test is
	--
	--	Implement body of Operations.Test package.

	procedure Display (A, B : Integer) is
		-- A_Str : constant String := Integer'Image (A);
		-- B_Str : constant String := Integer'Image (B);
	begin
		Put_Line ("Operations:");
		Put_Line (Integer'Image (A) & " + " & Integer'Image (B) & " = " & Integer'Image (Add (A, B)) & ",");
		Put_Line (Integer'Image (A) & " - " & Integer'Image (B) & " = " & Integer'Image (Subtract (A, B)) & ",");
		Put_Line (Integer'Image (A) & " * " & Integer'Image (B) & " = " & Integer'Image (Multiply (A, B)) & ",");
		Put_Line (Integer'Image (A) & " / " & Integer'Image (B) & " = " & Integer'Image (Divide (A, B)) & ",");
		-- Use the line above as a template and add the rest of the
		-- implementation for Subtract, Multiply and Divide.
	end Display;

end Operations.Test;
