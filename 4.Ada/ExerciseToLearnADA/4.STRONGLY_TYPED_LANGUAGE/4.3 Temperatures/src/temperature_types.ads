-- 1. Implement the Temperature_Types package.
-- 1. Declare the Celsius type.
-- 2. Declare the Int_Celsius type.
-- 3. Implement the To_Celsius function.
-- 4. Implement the To_Int_Celsius function.
-- 5. Declare the Kelvin type
-- 6. Implement the To_Celsius function to convert from the Kelvin type.
-- 7. Implement the To_Kelvin function.

package Temperature_Types is
	-- Include type declaration for Celsius!
	Type Celsius is digits 6 range -273.15.. 5504.85;
	Type Int_Celsius is range -273.. 5505;

	function To_Celsius (T : Int_Celsius) return Celsius;
	function To_Int_Celsius (T : Celsius) return Int_Celsius;

	-- Include type declaration for Kelvin!
	type Kelvin is digits 6 range 0.0.. 5778.0;

	-- Include function declarations for:
	-- - Kelvin => Celsius
	-- - Celsius => Kelvin
	function To_Celsius (T: Kelvin) return Celsius;
	function To_Kelvin (T: Celsius) return Kelvin;

end Temperature_Types;
