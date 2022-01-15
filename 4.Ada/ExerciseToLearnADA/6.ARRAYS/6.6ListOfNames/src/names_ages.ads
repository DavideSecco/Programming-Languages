-- Goal: create a system for a list of names and ages.
-- Steps:
-- 1. Implement the Names_Ages package.
-- 1. Declare the People_Array array type.
-- 2. Complete the declaration of the People record type with the People_A element of People_Array type.
-- 3. Implement the Add procedure.
-- 4. Implement the Reset procedure.
-- 5. Implement the Get function.
-- 6. Implement the Update procedure.
-- 7. Implement the Display procedure.

-- Requirements:
-- 1. Each person is represented by the Person type, which is a record containing the name and the age of that person.
-- 2. People_Array is an unconstrained array of Person type with a positive range.
-- 3. The Max_People constant is set to 10.
-- 4. Record type People contains:
--   1. The People_A element of People_Array type.
--   2. This array must be constrained by the Max_People constant.
-- 5. Procedure Add adds a person to the list.
--   1. By default, the age of this person is set to zero in this procedure.
-- 6. Procedure Reset resets the list.
-- 7. Function Get retrieves the age of a person from the list.
-- 8. Procedure Update updates the age of a person in the list.
-- 9. Procedure Display shows the complete list using the following format:
--   1. The first line must be LIST OF NAMES:. It is followed by the name and age of each
-- person in the next lines.
--   2. For each person on the list, the procedure must display the information in the following
-- format:
-- NAME: XXXX
-- AGE: YY

package Names_Ages is
	Max_People : constant Positive := 10;
	subtype Name_Type is String (1 .. 50);
	type Age_Type is new Natural;

	type Person is record
		Name : Name_Type;
		Age	: Age_Type;
	end record;

	-- Add type Declaration for People_Array record:
	type People_Array is array (Positive range <>) of Person;
	-- Replace type declaration for People record. You may use the
	-- following template:

	type People is record
		People_A: People_Array (1.. Max_People);
		Last_Valid : Natural;
	end record;

	-- type People is null record;

	procedure Reset (P : in out People);

	procedure Add (P: in out People; Name:String);

	function Get (P: People;Name:String) return Age_Type;

	procedure Update (P:in out People; Name:String; Age:Age_Type);

	procedure Display (P:People);

end Names_Ages;
