package body Tests is
	pragma Warnings (Off, "variable ""C"" is assigned but never read");
	
	procedure Num_Exception_Test (ID : Test_ID) is
		A, B, C : Integer;
	begin
		case ID is
			when Test_1 =>
				A := Integer'Last;
				B := Integer'Last;
				C := A + B;
			when Test_2 =>
				raise Custom_Exception with "Custom_Exception raised!";
		end case;
	end Num_Exception_Test;
	
	pragma Warnings (On, "variable ""C"" is assigned but never read");
end Tests;