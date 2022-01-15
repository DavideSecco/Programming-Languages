-- 2. Function To_I_100 converts from the U_100 type to the I_100 type.
-- 3. Function To_U_100 converts from the I_100 type to the U_100 type.

-- 5. Function To_D_50 converts from the I_100 type to the D_50 type.
-- 6. Function To_S_50 converts from the I_100 type to the S_50 type.
-- 7. Functions To_D_50 and To_S_50 saturate the input values if they are out of range.
-- - If the input is less than 10 the output should be 10.
-- - If the input is greater than 50 the output should be 50.
-- 8. Function To_I_100 converts from the D_50 type to the I_100 type.
-- Remarks:
-- 1. For the implementation of functions To_D_50 and To_S_50, you may use the type attributes
-- D_50'First and D_50'Last:
-- 1. D_50'First indicates the minimum value of the D_50 type.
-- 2. D_50'Last indicates the maximum value of the D_50 type.
-- 3. The same attributes are available for the S_50 type ( S_50'First and S_50'Last).
-- 2. We could have implement a function To_I_100 as well to convert from S_100 to I_100.
-- However, we skip this here because explicit conversions are not needed for subtypes.


package body Int_Types is
	function To_I_100 (V : U_100) return I_100 is
	begin
		-- Implement the conversion from U_100 to I_100 here!
		return I_100(V);
	end To_I_100;

	function To_U_100 (V : I_100) return U_100 is
	begin
		-- Implement the conversion from I_100 to U_100 here!
		return U_100(V);
	end To_U_100;

	function To_D_50 (V : I_100) return D_50 is
		Min : constant I_100 := I_100 (D_50'First);
		Max : constant I_100 := I_100 (D_50'Last);
	begin
		-- Implement the conversion from I_100 to D_50 here!
		-- Hint: using the constants above simplifies the checks needed for this function.
		if (V > Max) then
			return D_50'Last;
		elsif (V < Min) then
			return D_50'First;
		else
			return D_50(V);
		end if;
	end To_D_50;

	function To_S_50 (V : I_100) return S_50 is
	begin
		-- Implement the conversion from I_100 to S_50 here!
		-- Remark: don't forget to verify whether an explicit conversion like S_50 (V) is needed.
		if(V > S_50'Last) then
			return S_50'Last;
		elsif (V < S_50'First) then
			return S_50'First;
		else
			return S_50(V);
		end if;
	end To_S_50;

	function To_I_100 (V: D_50) return I_100 is
	begin
		-- Implement the conversion from I_100 to D_50 here!
		-- Remark: don't forget to verify whether an explicit conversion like I_100 (V) is needed
		return I_100(V);
	end To_I_100;
end Int_Types;
