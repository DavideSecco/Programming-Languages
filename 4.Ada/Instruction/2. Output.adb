with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Main is
   A:Integer;
   B:Integer;
   C:Integer;
begin
   A := 1;
   B := 2;
   C:= A + B;
   Put_line("C = A + B = " & Integer'Image (C));
   null;
end Main;

-- STRINGHE INFINITE:
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
use Ada.Text_IO.Unbounded_IO;

procedure Main is
   Name: Unbounded_String;
begin
   Put_Line("Insert your name");
   Get_Line(Name);
   Put_Line("Hello " & Name);
   null;
end Main;