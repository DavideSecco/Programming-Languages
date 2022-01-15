with Ada.Text_IO;
use Ada.Text_IO;
with Limited_Strings;
use Limited_Strings;

procedure Check_Lim_String is
	S  : constant String := "----------";
	S1 : constant Lim_String := Init ("Hello World");
	S2 : constant Lim_String := Init (30);
	S3 : Lim_String := Init (5);
	S4 : Lim_String := Init (S & S & S);

begin
	Put ("S1 => ");
	Put_Line (S1);
	Put ("S2 => ");
	Put_Line (S2);

	if S1 = S2 then
		Put_Line ("S1 is equal to S2.");
	else
		Put_Line ("S1 isn't equal to S2.");
	end if;

	Copy (From => S1, To => S3);
	Put ("S3 => ");
	Put_Line (S3);

	if S1 = S3 then
		Put_Line ("S1 is equal to S3.");
	else
		Put_Line ("S1 isn't equal to S3.");
	end if;

	Copy (From => S1, To => S4);
	Put ("S4 => ");
	Put_Line (S4);
	if S1 = S4 then
		Put_Line ("S1 is equal to S4.");
	else
		Put_Line ("S1 isn't equal to S4.");
	end if;

end Check_Lim_String;
