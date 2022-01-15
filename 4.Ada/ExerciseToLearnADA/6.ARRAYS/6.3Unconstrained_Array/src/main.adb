with Ada.Command_Line;
with Ada.Text_IO;
use Ada.Command_Line;
use Ada.Text_IO;
with Unconstrained_Arrays; use Unconstrained_Arrays;

procedure Main is
	type Test_Case_Index is(Init_Chk,Init_Proc_Chk,Double_Chk,Diff_Prev_Chk,Diff_Prev_Single_Chk);

	procedure Check (TC : Test_Case_Index) is
		AA : My_Array (1 .. 5);
		AB : My_Array (5 .. 9);

		procedure Display (A : My_Array) is
		begin
			for I in A'Range loop
				Put_Line (Integer'Image (A (I)));
			end loop;
		end Display;

		procedure Local_Init (A : in out My_Array) is
		begin
			A := (1, 2, 5, 10, -10);
		end Local_Init;

	begin
		case TC is
			when Init_Chk =>
				AA := Init (AA'First, AA'Length);
				AB := Init (AB'First, AB'Length);
				Display (AA);
				Display (AB);
			when Init_Proc_Chk =>
				Init (AA);
				Init (AB);
				Display (AA);
				Display (AB);
			when Double_Chk =>
				Local_Init (AB);
				Double (AB);
				Display (AB);
			when Diff_Prev_Chk =>
				Local_Init (AB);
				AB := Diff_Prev_Elem (AB);
				Display (AB);
			when Diff_Prev_Single_Chk =>
				declare
					A1 : My_Array (1 .. 1) := (1 => 42);
				begin
					A1 := Diff_Prev_Elem (A1);
					Display (A1);
				end;
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













