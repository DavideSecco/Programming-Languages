-- REMARKS
-- 1. In the implementation of procedure Add, you may use an index to indicate the last valid po-
-- sition in the array - see Last_Valid in the code below.
-- 2. In the implementation of procedure Display, you should use the Trim function from the
-- Ada.Strings.Fixed package to format the person's name - for example: Trim (P.Name,
-- Right).
-- 3. You may need the Integer'Min (A, B) and the Integer'Max (A, B) functions to get
-- the minimum and maximum values in a comparison between two integer values A and B.
-- 4. Fixed-length strings can be initialized with whitespaces using the others syntax. For example:
-- S : String_10 := (others => ' ');
-- 5. You may implement additional subprograms to deal with other types declared in the
-- Names_Ages package below, such as the Name_Type and the Person type.
-- 1. For example, a function To_Name_Type to convert from String to Name_Type might be
-- useful.
-- 2. Take a moment to reflect on which additional subprograms could be useful as well.


with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Strings;
use Ada.Strings;
with Ada.Strings.Fixed;
use Ada.Strings.Fixed;

package body Names_Ages is

	function To_Name_Type (S : String) return Name_Type is
		S_Out : Name_Type := (others => ' ');
	begin
		for I in 1 .. Integer'Min (S'Last, Name_Type'Last) loop
			S_Out (I) := S (I);
		end loop;
		return S_Out;
	end To_Name_Type;

	procedure Init (P: in out Person;Name:String) is
	begin
		P.Name := To_Name_Type (Name);
		P.Age := 0;
	end Init;

	procedure Reset (P : in out People) is
	begin
		P.Last_Valid:= 0;
	end Reset;

	-- procedure Add (P: in out People;	Name :	String) is
	-- begin
	-- 	P.Last_Valid:= P.Last_Valid + Natural(1);
	-- 	P.People_A(P.Last_Valid).Age:= 0;
	-- 	P.People_A(P.Last_Valid).Name:= Name_Type(Name);
	-- end Add;

	procedure Add (P: in out People; Name:String) is
	begin
		P.Last_Valid := P.Last_Valid + 1;
		Init (P.People_A (P.Last_Valid), Name);
	end Add;

	function Get (P: People; Name : String) return Age_Type is
	begin
		for I in 1 .. P.Last_Valid loop
			if(P.People_A(I).Name = Name) then
				return P.People_A(I).Age;
			end if;
		end loop;
		return 0;
	end Get;

	procedure Update (P: in out People; Name:String; Age: Age_Type) is
	begin
		for I in 1 .. P.Last_Valid loop
			if(P.People_A(I).Name = Name) then
				P.People_A(I).Age:= Age;
			end if;
		end loop;
	end Update;

	procedure Display (P : People) is
	begin
		for I in 1 .. P.Last_Valid loop
			Put_Line("Name:" & Trim(P.People_A(I).Name, Right));
		end loop;
		-- Put_Line(New_Line);
		for I in 1 .. P.Last_Valid loop
			Put_Line("Age: " & Age_Type'Image(P.People_A(I).Age));
		end loop;
	end Display;
end Names_Ages;
