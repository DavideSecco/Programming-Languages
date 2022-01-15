package Directions is
	type Angle_Mod is mod 360;

	type Direction is
		(North, Northwest,West,Southwest,
     South,Southeast,East);

	function To_Direction (N : Angle_Mod) return Direction;

	type Ext_Angle is private;

	function To_Ext_Angle (N : Angle_Mod) return Ext_Angle;

	procedure Display (N : Ext_Angle);

private

	type Ext_Angle is record
		Angle_Elem     : Angle_Mod;
		Direction_Elem : Direction;
	end record;
end Directions;
