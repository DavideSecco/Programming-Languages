-- 4.3.5 for loop
	For_Loop:
		for I in Integer range 1 .. 10 loop
		Do_Something (I)
		end loop For_Loop;

-- for loop on arrays
	Array_Loop :
		for I in X'Range loop
			X (I) := Get_Next_Element;
		end loop Array_Loop;

