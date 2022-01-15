-- 16.1 Procedures
	procedure A_Test ( A, B: in Integer; C: out Integer) is
	begin
	C := A + B;
	end A_Test;
	
	-- When the procedure is called with the statement
	A_Test (5 + P, 48, Q);