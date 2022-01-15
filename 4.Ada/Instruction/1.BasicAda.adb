-- 1.1.1 "Hello, world!"
	with Ada.Text_IO;
	procedure Hello is
	begin
		Ada.Text_IO.Put_Line("Hello, world!");
	end Hello;

-- 1.1.3 "Hello, world!" with use
with Ada.Text_IO;
use Ada.Text_IO;

procedure Hello is
begin
	Put_Line("Hello, world!");
	New_Line; -- ANDARE A CAPO!
	Put_Line("I am an Ada program with package use.");
end Hello;