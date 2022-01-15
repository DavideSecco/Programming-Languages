with ada.Text_IO;
use ada.Text_IO;

procedure Main is
	a: Integer:= 1;
	function X(z: in out Integer) return Integer is
		b: Integer:= 2;

		function Y(z: in out Integer) return Integer is
			b: Integer:= 3;
		begin 
			b:= a+z;
			return b;
		end Y;

	begin 
		a:= Y(z) + b;
		return a;
	end X;

begin 
	a:= X(a);
	Put_Line ("a = " & Integer'Image(a));
end Main;