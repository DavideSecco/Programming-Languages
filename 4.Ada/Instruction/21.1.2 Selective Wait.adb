-- 21.1.2 Selective Wait
	-- If only one of the alternatives in a selective wait statement has a pending entry call, then
	-- that one is accepted.
	task type Encapsulated_Variable_Task_Type is
		entry Store (An_Item : in Item);
		entry Fetch (An_Item : out Item);
	end Encapsulated_Variable_Task_Type;
	...
	task body Encapsulated_Variable_Task_Type is
		Datum : Item;
		begin
		accept Store (An_Item : in Item) do
			Datum := An_Item;
		end Store;

	loop
		select
			accept Store (An_Item : in Item) do
				Datum := An_Item;
			end Store;
			or
			accept Fetch (An_Item : out Item) do
				An_Item := Datum;
			end Fetch;
		end select;
	end loop;
	end Encapsulated_Variable_Task_Type;

	-- ANOTHER EXAMPLE:
	-- When you use select and "or terminate", if the main is finished and the task no (maybe it has a infinite loop) 
	-- the main finish anyway (doesn0t wait the task) 
	with Ada.Text_IO; use Ada.Text_IO;

	procedure Show_Rendezvous_Loop is

		task T is
			entry Reset;
			entry Increment;
		end T;

		task body T is
			Cnt : Integer := 0;
		begin
			loop
				select
					accept Reset do
						Cnt := 0;
					end Reset;
					Put_Line ("Reset");
				or
					accept Increment do
						Cnt := Cnt + 1;
					end Increment;
					Put_Line ("In T's loop ("
								& Integer'Image (Cnt)
								& ")");
				or
					terminate;
				end select;
			end loop;
		end T;

	begin
		Put_Line ("In Main");

		for I in 1 .. 4 loop
			--  Calling T's entry multiple times
			T.Increment;
		end loop;

		T.Reset;
		for I in 1 .. 4 loop
			--  Calling T's entry multiple times
			T.Increment;
		end loop;

	end Show_Rendezvous_Loop;