with Ada.Command_Line;
with Ada.Text_IO; use Ada.Command_Line;
use Ada.Text_IO;
with Aggregates; use Aggregates;

procedure Main is
	-- Remark: the following line is not relevant.
	F: array (1 .. 10) of Float := (others => 42.42)
		with Unreferenced;

	type Test_Case_Index is
		(Default_Rec_Chk,Init_Rec_Chk,Init_Some_Arr_Chk,Init_Arr_Chk);

	procedure Check (TC : Test_Case_Index) is
		A  : Int_Arr;
		R  : Rec;
		DR : constant Rec := (others => <>);
	begin
		case TC is
			when Default_Rec_Chk =>
				R := DR;
				Put_Line ("Record Default:");
				Put_Line ("W => " & Integer'Image (R.W));
				Put_Line ("X => " & Integer'Image (R.X));
				Put_Line ("Y => " & Integer'Image (R.Y));
				Put_Line ("Z => " & Integer'Image (R.Z));
			when Init_Rec_Chk =>
				Init (R);
				Put_Line ("Record Init:");
				Put_Line ("W => " & Integer'Image (R.W));
				Put_Line ("X => " & Integer'Image (R.X));
				Put_Line ("Y => " & Integer'Image (R.Y));
				Put_Line ("Z => " & Integer'Image (R.Z));
			when Init_Some_Arr_Chk =>
				Init_Some (A);
				Put_Line ("Array Init_Some:");
				for I in A'Range loop
					Put_Line (Integer'Image (I) & " " & Integer'Image (A (I)));
				end loop;
			when Init_Arr_Chk =>
				Init (A);
				Put_Line ("Array Init:");
				for I in A'Range loop
					Put_Line (Integer'Image (I) & " " & Integer'Image (A (I)));
				end loop;
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
