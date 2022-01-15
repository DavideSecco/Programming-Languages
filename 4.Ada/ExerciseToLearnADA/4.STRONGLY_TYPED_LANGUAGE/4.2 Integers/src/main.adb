with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Int_Types;
use Int_Types;

procedure Main is
	package I_100_IO is new Ada.Text_IO.Integer_IO (I_100);
	package U_100_IO is new Ada.Text_IO.Modular_IO (U_100);
	package D_50_IO is new Ada.Text_IO.Integer_IO (D_50);
	use I_100_IO;
	use U_100_IO;
	use D_50_IO;
	type Test_Case_Index is
		(I_100_Range,	U_100_Range, U_100_Wraparound, U_100_To_I_100, I_100_To_U_100, D_50_Range, S_50_Range, I_100_To_D_50, I_100_To_S_50, D_50_To_I_100, S_50_To_I_100);

	procedure Check (TC : Test_Case_Index) is
	begin
		I_100_IO.Default_Width := 1;
		U_100_IO.Default_Width := 1;
		D_50_IO.Default_Width := 1;
		case TC is
			when I_100_Range =>
				Put (I_100'First); New_Line;
				Put (I_100'Last);  New_Line;
			when U_100_Range =>
				Put (U_100'First); New_Line;
				Put (U_100'Last);  New_Line;
			when U_100_Wraparound =>
				Put (U_100'First - 1);	New_Line;
				Put (U_100'Last + 1);	New_Line;
			when U_100_To_I_100 =>
				for I in U_100'Range loop
					I_100_IO.Put (To_I_100 (I)); New_Line;
				end loop;
			when I_100_To_U_100 =>
				for I in I_100'Range loop
					Put (To_U_100 (I));	New_Line;
				end loop;
			when D_50_Range =>
				Put (D_50'First); New_Line;
				Put (D_50'Last);  New_Line;
			when S_50_Range =>
				Put (S_50'First); New_Line;
				Put (S_50'Last);  New_Line;
			when I_100_To_D_50 =>
				for I in I_100'Range loop
					Put (To_D_50 (I));	New_Line;
				end loop;
			when I_100_To_S_50 =>
				for I in I_100'Range loop
					Put (To_S_50 (I));	New_Line;
				end loop;
			when D_50_To_I_100 =>
				for I in D_50'Range loop
					Put (To_I_100 (I));	New_Line;
				end loop;
			when S_50_To_I_100 =>
				for I in S_50'Range loop
					Put (I); New_Line;
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
