-- 21.1.1 Rendezvous
	-- if you use a task more than once, you have to use a loop!!!!!!
	task type Encapsulated_Buffer_Task_Type is
		entry Insert (An_Item : in Item);
		entry Remove (An_Item : out Item);
	end Encapsulated_Buffer_Task_Type;
	...
	Buffer_Pool : array (0 .. 15) of Encapsulated_Buffer_Task_Type;
	This_Item:Item;
	...
	task body Encapsulated_Buffer_Task_Type is
		Datum : Item;
	begin
		loop
			accept Insert (An_Item : in Item) do
			Datum := An_Item;
			end Insert;

			accept Remove (An_Item : out Item) do
			An_Item := Datum;
			end Remove;
		end loop;
	end Encapsulated_Buffer_Task_Type;
	...
	Buffer_Pool(1).Remove (This_Item);
	Buffer_Pool(2).Insert (This_Item);

	-- EXAMPLE:
	with Ada.Text_IO; use Ada.Text_IO;

	procedure Show_Rendezvous is

		task T is
			entry Start;
		end T;

		task body T is
		begin
			accept Start;
			--     ^ Waiting for somebody
			--       to call the entry

			Put_Line ("In T");
		end T;

	begin
		Put_Line ("In Main");

		--  Calling T's entry:
		T.Start;
	end Show_Rendezvous;