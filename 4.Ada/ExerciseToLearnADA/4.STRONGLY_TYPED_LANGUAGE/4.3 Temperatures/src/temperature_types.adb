-- Requirements:
-- 1. The custom floating-point types declared in Temperature_Types must use a precision of six digits.
-- 2. Types Celsius and Int_Celsius are used for temperatures in Celsius:
-- 1. Celsius is a floating-point type with a range between -273.15 and 5504.85
-- 2. Int_Celsius is an integer type with a range between -273 and 5505.
-- 3. Functions To_Celsius and To_Int_Celsius are used for type conversion:
-- 1. To_Celsius converts from Int_Celsius to Celsius type.
-- 2. To_Int_Celsius converts from Celsius and Int_Celsius types:
-- 4. Kelvin is a floating-point type for temperatures in Kelvin using a range between 0.0 and
-- 5778.0.
-- 5. The functions To_Celsius and To_Kelvin are used to convert between temperatures in
-- Kelvin and Celsius.
-- 1. In order to convert temperatures in Celsius to Kelvin, you must use the formula K =
-- C + 273.15, where:
-- - K is the temperature in Kelvin, and
-- - C is the temperature in Celsius.

package body Temperature_Types is
	function To_Celsius (T : Int_Celsius) return Celsius is
		Min : constant Float := Float (Celsius'First);
		Max : constant Float := Float (Celsius'Last);
		F   : constant Float := Float (T);
	begin
		if F > Max then
			return Celsius (Max);
		elsif F < Min then
			return Celsius (Min);
		else
			return Celsius (F);
		end if;
	end To_Celsius;

	function To_Int_Celsius (T : Celsius) return Int_Celsius is
	begin
		return Int_Celsius(T);
	end To_Int_Celsius;

	-- Include function implementation for:
	-- - Kelvin => Celsius
	-- - Celsius => Kelvin
	function To_Celsius (T: Kelvin) return Celsius is
	begin
		return Celsius(T - 273.15);
	end To_Celsius;

	function To_Kelvin (T: Celsius) return Kelvin is
	begin
		return Kelvin(T + 273.15);
	end To_Kelvin;
	end Temperature_Types;
