package body Unconstrained_Arrays is
	-- Implement the subprograms:

	-- different!!!
	procedure Init (A: In  out My_Array) is
	begin
		for I in A'Range loop
			A(I):= Integer(A'Length)- Integer(I);
		end loop;
	end Init;

	function Init (I, L : Positive) return My_Array is
		A: My_Array (I .. I + L -1);
	begin
		Init(A);
		return A;
	end Init;

	procedure Double (A: in out My_Array) is
	begin
		for I in A'Range loop
			A(I):= 2*A(I);
		end loop;
	end Double;

	-- differnet
	function Diff_Prev_Elem (A:My_Array) return My_Array is
		B: My_Array(A'Range);
	begin
		for I in A'Range loop
			if(I=1) then
				B(I):= 0;
			else
				B(I):= A(I) - A(I-1);
			end if;
		end loop;
		return B;
	end Diff_Prev_Elem;
end Unconstrained_Arrays;
