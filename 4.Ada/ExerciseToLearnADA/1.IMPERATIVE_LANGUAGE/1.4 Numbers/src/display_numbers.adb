with Ada.Text_IO;
use Ada.Text_IO;

procedure Display_Numbers (A, B : Integer) is
begin
	if(B<A) then
		Put_Line(Integer'Image (B) & Integer'Image (A));
	else
		Put_Line(Integer'Image (A) & Integer'Image (B));
	end if;
	null;
end Display_Numbers;
