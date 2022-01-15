with Ada.Command_Line;
with Ada.Text_IO;
use Ada.Command_Line;
use Ada.Text_IO;
with Temperature_Types; use Temperature_Types;

procedure Main is
	package Celsius_IO is new Ada.Text_IO.Float_IO (Celsius);
	package Kelvin_IO is new Ada.Text_IO.Float_IO (Kelvin);
	package Int_Celsius_IO is new Ada.Text_IO.Integer_IO (Int_Celsius);
	use Celsius_IO;
	use Kelvin_IO;
	use Int_Celsius_IO;
	type Test_Case_Index is
		(Celsius_Range,
	 Celsius_To_Int_Celsius, Int_Celsius_To_Celsius, Kelvin_To_Celsius, Celsius_To_Kelvin);

	procedure Check (TC : Test_Case_Index) is
	begin
		Celsius_IO.Default_Fore := 1;
		Kelvin_IO.Default_Fore := 1;
		Int_Celsius_IO.Default_Width := 1;
		case TC is
			when Celsius_Range =>
				Put (Celsius'First); New_Line;
				Put (Celsius'Last);  New_Line;
			when Celsius_To_Int_Celsius =>
				Put (To_Int_Celsius (Celsius'First)); New_Line;
				Put (To_Int_Celsius (0.0));           New_Line;
				Put (To_Int_Celsius (Celsius'Last));  New_Line;
			when Int_Celsius_To_Celsius =>
				Put (To_Celsius (Int_Celsius'First)); New_Line;
				Put (To_Celsius (0));                 New_Line;
				Put (To_Celsius (Int_Celsius'Last));  New_Line;
			when Kelvin_To_Celsius =>
				Put (To_Celsius (Kelvin'First));			New_Line;
				Put (To_Celsius (0));           			New_Line;
				Put (To_Celsius (Kelvin'Last));     	New_Line;
			when Celsius_To_Kelvin =>
				Put (To_Kelvin (Celsius'First));	     New_Line;
			  Put (To_Kelvin (Celsius'Last));			   New_Line;
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
