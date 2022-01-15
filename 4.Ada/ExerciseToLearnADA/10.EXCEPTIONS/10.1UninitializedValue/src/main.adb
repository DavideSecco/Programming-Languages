with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Exceptions;
use Ada.Exceptions;
with Options;
use Options;

procedure Main is
	type Test_Case_Index is (Options_Chk);

	procedure Check (TC : Test_Case_Index) is
		procedure Check (O : Option) is
		begin
			Put_Line (Image (O));
			exception
				when E : Unitialized_Value =>	Put_Line (Exception_Message (E));
			end Check;
			
	begin
		case TC is
			when Options_Chk =>
				for O in Option loop
					Check (O);
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