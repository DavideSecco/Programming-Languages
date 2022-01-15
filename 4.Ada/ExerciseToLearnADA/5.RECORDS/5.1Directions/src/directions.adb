with Ada.Text_IO; use Ada.Text_IO;
package body Directions is
	procedure Display (N : Ext_Angle) is
	begin
		-- Uncomment the code below and fill the missing elements
		Put_Line ("Angle: " & Angle_Mod'Image (N.Module) & " => " & Direction'Image (N.Dir) 	& ".");
		null;
	end Display;

	function To_Direction (N : Angle_Mod) return Direction is
	begin
		case N is
			when 0           => return North;
			when 1 .. 89     => return Northeast;
			when 90          => return East;
			when 91 .. 179   => return Southeast;
			when 180         => return South;
			when 181 .. 269  => return Southwest;
			when 270         => return West;
			when 271 .. 359  => return Northwest;
	end case;
end To_Direction;


	function To_Ext_Angle (N : Angle_Mod) return Ext_Angle is
	begin
		-- Implement the conversion from Angle_Mod to Ext_Angle here!
		-- Hint: you can use a return statement and an aggregate.
		return (Module => N,
					Dir => To_Direction(N));
	end To_Ext_Angle;
end Directions;
