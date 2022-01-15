-- Goal: create a package that handles directions and geometric angles.
-- Steps:
-- 1. Implement the Directions package.
-- 1. Declare the Ext_Angle record.
-- 2. Implement the Display procedure.
-- 3. Implement the To_Ext_Angle function.

package Directions is
	type Angle_Mod is mod 360;
	type Direction is  (North,
										Northeast,
										East,
										Southeast,
										South,
										Southwest,
										West,
										Northwest);

	function To_Direction (N: Angle_Mod) return Direction;
	-- Include type Declaration for Ext_Angle record type:
	-- NOTE: use The Angle_Mod and Direction Types Declared Above!
	type Ext_Angle is
		 record
			 Module: Angle_Mod;
			 Dir: Direction;
		 end record;

	function To_Ext_Angle (N : Angle_Mod) return Ext_Angle;
	procedure Display (N : Ext_Angle);
end Directions;
