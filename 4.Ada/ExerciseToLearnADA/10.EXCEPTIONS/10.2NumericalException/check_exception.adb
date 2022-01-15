with Tests; use Tests;

procedure Check_Exception (ID : Test_ID) is
begin
	Num_Exception_Test (ID);
	exception
 		when Constraint_Error => Put_Line ("Constraint_Error detected!");
 		when E : others => Put_Line (Exception_Message (E));
end Check_Exception;