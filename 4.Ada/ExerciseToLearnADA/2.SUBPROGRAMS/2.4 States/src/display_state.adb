with Ada.Text_IO; use Ada.Text_IO;
procedure Display_State (State : Integer) is
begin
	if(State = 0) then
		Put_Line("OFF");
	elsif (State = 1) then
		Put_Line("On: Simple Processing");
	else
		Put_Line("On: Advanced Processing");
	end if;
-- You can use case statement in thi case
end Display_State;
