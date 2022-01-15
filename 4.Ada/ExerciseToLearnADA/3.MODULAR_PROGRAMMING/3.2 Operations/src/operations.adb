package body Operations is
-- Create body of Operations package.
	function Add (A, B: Integer) return Integer is
	begin
		return A + B;
	end Add;

	function Subtract (A, B: Integer) return Integer is
	begin
		return A - B;
	end Subtract;

	function Multiply (A, B: Integer) return Integer is
	begin
		return A * B;
	end Multiply;

	function Divide (A, B: Integer) return Integer is
	begin
		return A / B;
	end Divide;

end Operations;
