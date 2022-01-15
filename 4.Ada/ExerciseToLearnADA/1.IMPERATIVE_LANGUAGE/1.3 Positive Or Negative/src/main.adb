-- 1.3 Positive Or Negative
-- Goal: create an application that classifies integer numbers.
-- Steps:
-- 1. Complete the Classify_Number procedure.
-- Requirements:
-- 1. Given an integer number X, procedure Classify_Number must classify X as positive, nega-
-- tive or zero and display the result:
-- 1. If X > 0, it displays Positive.
-- 2. If X < 0, it displays Negative.
-- 3. If X = 0, it displays Zero.

with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Main is
	X:Integer;
begin
	Put_Line("Insert your number:");
	Get(X);
	if(X>0) then
		Put_Line("POSITIVE");
	elsif(X<0) then
		Put_Line("NEGATIVE");
	else
		Put_Line("ZERO");
	end if;
	null;
end Main;
