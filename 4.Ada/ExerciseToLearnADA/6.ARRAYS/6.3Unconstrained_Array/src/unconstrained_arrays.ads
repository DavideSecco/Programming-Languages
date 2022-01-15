-- Goal: declare an unconstrained array and implement operations on it.
-- Steps:
-- 1. Implement the Unconstrained_Arrays package.
-- 1. Declare the My_Array type.
-- 2. Declare and implement the Init procedure.
-- 3. Declare and implement the Init function.
-- 4. Declare and implement the Double procedure.
-- 5. Declare and implement the Diff_Prev_Elem function.

-- Requirements:
-- 1. My_Array is an unconstrained array (with a Positive range) of Integer elements.
-- 2. Procedure Init initializes each element with the index starting with the last one.
-- - For example, for an array of 3 elements where the index of the first element is 1
-- (My_Array (1 .. 3)), the values of these elements after a call to Init must be (3,
-- 2, 1).
-- 3. Function Init returns an array based on the length L and start index I provided to the Init
-- function.
-- 1. I indicates the index of the first element of the array.
-- 2. L indicates the length of the array.
-- 3. Both I and L must be positive.
-- 4. This is its declaration: function Init (I, L : Positive) return My_Array;.
-- 5. You must initialize the elements of the array in the same manner as for the Init proce-
-- dure described above.
-- 4. Procedure Double doubles each element of an array.

-- the difference between an element of array A and the previous element.
-- 1. For the first element, the difference must be zero.
-- 2. For example:
-- - INPUT: (2, 5, 15)
-- - RETURN of Diff_Prev_Elem: (0, 3, 10), where


-- input array;

-- the input array.

-- Remarks:
-- 1. For an array A, you can retrieve the index of the last element with the attribute 'Last.
-- 1. For example: Y : Positive := A'Last;
-- 2. This can be useful during the implementation of procedure Init.
-- 2. For the implementation of the Init function, you can call the Init procedure to initialize the
-- elements. By doing this, you avoid code duplication.
-- 3. Some hints about attributes:
-- 1. You can use the range attribute (A'Range) to retrieve the range of an array A.
-- 2. You can also use the range attribute in the declaration of another array (e.g.: B :
-- My_Array (A'Range)).
-- 3 . Alternatively, you can use the A'First and A'Last attributes in an array declaration.


package Unconstrained_Arrays is
	-- Complete The type and Subprogram Declarations:

	type My_Array is array (Positive range <>) of Integer;

	procedure Init (A: in out My_Array);

	function Init (I, L : Positive) return My_Array;

	procedure Double (A: in out My_Array);
	function Diff_Prev_Elem (A: My_Array) return My_Array;
end Unconstrained_Arrays;
