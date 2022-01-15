-- Goal: implement a package with various integer types.
-- Steps:
-- 1. Implement the Int_Types package.
-- 1. Declare the integer type I_100.
-- 2. Declare the modular type U_100.
-- 3. Implement the To_I_100 function to convert from the U_100 type.
-- 4. Implement the To_U_100 function to convert from the I_100 type.
-- 5. Declare the derived type D_50.
-- 6. Declare the subtype S_50.
-- 7. Implement the To_D_50 function to convert from the I_100 type.
-- 8. Implement the To_S_50 function to convert from the I_100 type.
-- 9. Implement the To_I_100 function to convert from the D_50 type.

-- Requirements:
-- 1. Types I_100 and U_100 have values between 0 and 100.
-- 1. Type I_100 is an integer type.
-- 2. Type U_100 is a modular type.
-- 4. Types D_50 and S_50 have values between 10 and 50 and use I_100 as a base type.
-- 1. D_50 is a derived type.
-- 2. S_50 is a subtype.

package Int_Types is
	--  Include type declarations for I_100 and U_100!
	type I_100 is range 0..100;
	type U_100 is mod 101;

	function To_I_100 (V : U_100) return I_100;
	function To_U_100 (V : I_100) return U_100;

	-- Include type declarations for D_50 and S_50!
	type D_50 is new I_100 range 10..50;
	subtype S_50 is I_100'Base range 10..50;

	function To_D_50 (V : I_100) return D_50;
	function To_S_50 (V : I_100) return S_50;
	function To_I_100 (V : D_50) return I_100;
end Int_Types;
