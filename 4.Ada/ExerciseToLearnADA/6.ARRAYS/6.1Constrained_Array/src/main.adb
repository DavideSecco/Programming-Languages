with Ada.Command_Line;
with Ada.Text_IO;
use Ada.Command_Line;
use Ada.Text_IO;
with Constrained_Arrays; use Constrained_Arrays;

procedure Main is
	type Test_Case_Index is
		(Range_Chk,Array_Range_Chk,A_Obj_Chk,Init_Chk,Double_Chk,First_Elem_Chk,Last_Elem_Chk,Length_Chk);

procedure Check (TC : Test_Case_Index) is
		AA : My_Array;

		procedure Display (A : My_Array) is
		begin
			for I in A'Range loop
				Put_Line (Integer'Image (A (I)));
			end loop;
		end Display;

		procedure Local_Init (A : in out My_Array) is
		begin
			A := (100, 90, 80, 10, 20, 30, 40, 60, 50, 70);
		end Local_Init;

	begin
		case TC is
			when Range_Chk =>
				for I in My_Index loop
					Put_Line (My_Index'Image (I));
				end loop;
			when Array_Range_Chk =>
				for I in My_Array'Range loop
					Put_Line (My_Index'Image (I));
				end loop;
			when A_Obj_Chk =>	Display (A);
			when Init_Chk =>
				AA := Init;
				Display (AA);
			when Double_Chk =>
				Local_Init (AA);
				Double (AA);
				Display (AA);
			when First_Elem_Chk =>
				Local_Init (AA);
				Put_Line (Integer'Image (First_Elem (AA)));
			when Last_Elem_Chk =>
				Local_Init (AA);
				Put_Line (Integer'Image (Last_Elem (AA)));
			when Length_Chk =>
				Put_Line (Integer'Image (Length (AA)));
		end case;
	end Check;

begin
	if Argument_Count < 1 then
		Put_Line ("ERROR: missing arguments! Exiting...");
		return;
	elsif Argument_Count > 1 then
		Put_Line ("Ignoring additional arguments...");
	end if;
	Check (Test_Case_Index'Value (Argument (1)));
end Main;
