-- Goal: implement an enumeration to avoid the use of uninitialized values.
-- Steps:
-- 1. Implement the Options package.
-- 	1. Declare the Option enumeration type.
-- 	2. Declare the Unitialized_Value exception.
-- 	3. Implement the Image function.
-- Requirements:
-- 1. Enumeration Option contains:
-- 	1. the Unitialized value, and
-- 	2. the actual options:
-- 		• Option_1,
-- 		• Option_2,
-- 		• Option_3.

package Options is
 	-- Declare the Option enumeration type!
	type Option is (Unitialized, Option_1, Option_2, Option_3);
	
   Unitialized_Value : exception;

	function Image (O : Option) return String;
end Options;