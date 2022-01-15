-- 2. Function Image returns a string for the Option type.
-- 	1. In case the argument to Image is Unitialized, the function must raise the Unitialized_Value exception.
-- Remarks:
-- 	1. In this exercise, we employ exceptions as a mechanism to avoid the use of uninitialized values
-- 	for a certain type.



package body Options is
	function Image (O : Option) return String is
	begin
		case O is 
			when Unitialized => 
				raise Unitialized_Value with "Uninitialized value detected";
			when others =>
				return Option'Image (O);
			end case;
	end Image;
end Options;