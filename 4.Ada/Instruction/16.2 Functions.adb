-- 16.2 Functions
	--1 Version:
	function Minimum (A, B: Integer) return Integer is
	begin
		if A <= B then
			return A;
		else
			return B;
		end if;
	end Minimum;

	-- 2 Version:
	function Minimum (A, B: Integer) return Integer is
	begin
		return (if A <= B then A else B);
	end Minimum;