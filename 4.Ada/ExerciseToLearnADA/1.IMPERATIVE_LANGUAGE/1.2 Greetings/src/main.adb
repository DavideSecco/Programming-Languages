-- Goal: create an application that greets a person.
-- Steps:
-- 1. Complete the Greet procedure.
-- Requirements:
-- 1. Given an input string <name>, procedure Greet must display the message "Hello <name>!".
-- 1. For example, if the name is "John", it displays the message "Hello John!".
-- Remarks:
-- 1. You can use the concatenation operator (&).

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
