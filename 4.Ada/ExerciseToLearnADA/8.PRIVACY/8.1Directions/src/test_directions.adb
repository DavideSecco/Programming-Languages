-- Goal: create a package that handles directions and geometric angles using a previous implementation.
-- Steps:
-- 1. Fix the implementation of the Test_Directions procedure.
-- Requirements:
-- 1. The implementation of the Test_Directions procedure must compile correctly.

-- Remarks:
-- 1. This exercise is based on the Directions exercise from the Records (page 31) labs.
-- 1. In this version, however, Ext_Angle is a private type.
-- 2. In the implementation of the Test_Directions procedure below, the Ada developer tried

-- 1. Since we now have a private type, the compiler complains about this initialization.
-- 3. To fix the implementation of the Test_Directions procedure, you should use the appro-
-- priate function from the Directions package.
-- 4. The initialization of All_Directions in the code below contains a consistency error where
-- the angle doesn't match the assessed direction.
-- 1. See if you can spot this error!
-- 2. This kind of errors can happen when record components that have correlated informa-
-- tion are initialized individually without consistency checks - using private types helps to
-- avoid the problem by requiring initialization routines that can enforce consistency.

with Directions;
use Directions;

procedure Test_Directions is

	type Ext_Angle_Array is array (Positive range <>) of Ext_Angle;

	All_Directions : constant Ext_Angle_Array (1 .. 6)
		:=(To_Ext_Angle (0),
		   To_Ext_Angle (45),
		   To_Ext_Angle (90),
		   To_Ext_Angle (91),
		   To_Ext_Angle (180),
		   To_Ext_Angle (270));

begin
	for I in All_Directions'Range loop
		Display (All_Directions (I));
	end loop;
end Test_Directions;
