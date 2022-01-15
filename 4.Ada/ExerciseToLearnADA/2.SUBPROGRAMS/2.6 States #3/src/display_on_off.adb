with Ada.Text_IO; use Ada.Text_IO;
with Is_On;

procedure Display_On_Off (State : Integer) is
	S: Boolean;
begin
	S := Is_On(State);

	if S = true then
		Put_Line ("ON");
	else
		Put_Line("OFF");
	end if;
end Display_On_Off;
