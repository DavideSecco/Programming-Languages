with Ada.Command_Line;
use Ada.Command_Line;
with Ada.Text_IO;
use Ada.Text_IO;

package body Display_Services is
	task body Display_Service is
	begin
		loop
			select
				accept Display (S: in String) do
					Put_Line(S);
				end Display;
			or
				accept Display (I: in Integer) do
					Put_Line(Integer'Image (I));
				end Display;
			end select;
		end loop;
	end Display_Service;
end Display_Services;
