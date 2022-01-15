procedure Set_Next (State : in out Integer) is
begin
	if (State < 2) then
		State:= State + 1;
	else
		State:= 0;
	end if;
end Set_Next;
