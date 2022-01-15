-- Requirements:
-- 1. Range type My_Index has a range from 1 to 10.
-- 2. My_Array is a constrainted array of Integer type.
-- 1. It must make use of the My_Index type.
-- 2. It is therefore limited to 10 elements.
-- 3. Function Init returns an array where each element is initialized with the corresponding index.
-- 4. Procedure Double doubles the value of each element of an array.
-- 5. Function First_Elem returns the first element of the array.
-- 6. Function Last_Elem returns the last element of the array.
-- 7. Function Length returns the length of the array.
-- 8. Object A of My_Array type is initialized with:
-- 1. the values 1 and 2 for the first two elements, and
-- 2. 42 for all other elements.

package body Constrained_Arrays is
-- Create the implementation of the subprograms!
	function Init return My_Array is
		A: My_Array;
	begin
		for I in My_Index loop
			A(I):= Integer(I);
		end loop;
	return A;
	end Init;

	procedure Double (A: in out My_Array) is
	begin
		for I in My_Index loop
			A(I):= A(I)*2;
		end loop;
	end Double;

	function First_Elem (A: My_Array) return Integer is
	begin
		return Integer(A'First);
	end First_Elem;

	function Last_Elem (A: My_Array) return Integer is
	begin
		return Integer(A'Last);
	end Last_Elem;

	function Length (A: My_Array) return Integer is
	begin
		return Integer(A'Length);
	end Length;

end Constrained_Arrays;
