with Ada.Text_IO; 
use Ada.Text_IO;

package body Directions is
	procedure Display (N : Ext_Angle) is
	begin
		Put_Line ("Angle: "
						& Angle_Mod'Image (N.Angle_Elem)
						& " => "
						& Direction'Image (N.Direction_Elem)
						& ".");
	end Display;

	function To_Direction (N : Angle_Mod) return Direction is
	begin
		case N is
			when 0 				  => return East;
			when 1 .. 89 		=> return Northwest;
			when 90 				=> return North;
			when 91 .. 179 	=> return Northwest;
			when 180 			  => return West;
			when 181 .. 269	=> return Southwest;
			when 270 			  => return South;
			when 271 .. 359 => return Southeast;
		end case;
	end To_Direction;
		
	function To_Ext_Angle (N : Angle_Mod) return Ext_Angle is
	begin
		return (Angle_Elem => N,
				  Direction_Elem => To_Direction (N));
	end To_Ext_Angle;
end Directions;
