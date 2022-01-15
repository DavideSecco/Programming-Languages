function Is_On (State : Integer) return Boolean is
begin
	if (State = 1 or else State = 2) then
		return True;
	end if;
	return False;
end Is_On;
