-- Goal: declare a constrained array and implement operations on it.
-- Steps:
-- 1. Implement the Constrained_Arrays package.
-- 1. Declare the range type My_Index.
-- 2. Declare the array type My_Array.
-- 3. Declare and implement the Init function.
-- 4. Declare and implement the Double procedure.
-- 5. Declare and implement the First_Elem function.
-- 6. Declare and implement the Last_Elem function.
-- 7. Declare and implement the Length function.
-- 8. Declare the object A of My_Array type.

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

package Constrained_Arrays is
-- Complete the type and subprogram declarations:
	type My_Index is range 1..10;
	type My_Array is array (My_Index) of Integer;
	function Init return My_Array;
	procedure Double (A: in out My_Array);
	function First_Elem (A: My_Array) return Integer;
	function Last_Elem (A: My_Array) return Integer;
	function Length (A: My_Array) return Integer;
	A: My_Array:= (1,2,42, 42, 42, 42, 42, 42, 42,42);
end Constrained_Arrays;
