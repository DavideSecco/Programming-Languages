-- DOESN'T WORK PROPERLY!!!
with Ada.Command_Line;
with Ada.Text_IO; use Ada.Command_Line;
use Ada.Text_IO;
with Names_Ages; use Names_Ages;

procedure Main is
	type Test_Case_Index is
		(Names_Ages_Chk,Get_Age_Chk);

	procedure Check (TC : Test_Case_Index) is
		P : People;
	begin
		case TC is
			when Names_Ages_Chk =>
				Reset (P);
				Add (P, "John");
				Add (P, "Patricia");
				Add (P, "Josh");
				Display (P);
				Update (P, "John",18);
				Update (P, "Patricia", 35);
				Update (P, "Josh", 53);
				Display (P);
			when Get_Age_Chk =>
				Reset (P);
				Add (P, "Peter");
				Update (P, "Peter", 45);
				Put_Line ("Peter is "
							& Age_Type'Image (Get (P, "Peter"))
							& " years old.");
		end case;
	end Check;

begin
	if Argument_Count < 1 then
		Ada.Text_IO.Put_Line ("ERROR: missing arguments! Exiting...");
		return;
	elsif Argument_Count > 1 then
		Ada.Text_IO.Put_Line ("Ignoring additional arguments...");
	end if;
	Check (Test_Case_Index'Value (Argument (1)));
end Main;
