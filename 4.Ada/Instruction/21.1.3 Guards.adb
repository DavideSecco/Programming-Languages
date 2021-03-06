-- 21.1.3 Guards
	-- The acceptance of any alternative can be made conditional by using a guard, 
	-- which is Boolean 2 precondition for acceptance.

	task Cyclic_Buffer_Task_Type is
		entry Insert (An_Item : in Item);
		entry Remove (An_Item : out Item);
	end Cyclic_Buffer_Task_Type;
	...
	task body Cyclic_Buffer_Task_Type is
		Q_Size : constant := 100;
		subtype Q_Range is Positive range 1 .. Q_Size;
		Length : Natural range 0 .. Q_Size := 0;
		Head, Tail : Q_Range := 1;
		Data : array (Q_Range) of Item;

	begin
		loop
			select
				when Length < Q_Size =>
					accept Insert (An_Item : in Item) do
						Data(Tail) := An_Item;
					end Insert;
					Tail := Tail mod Q_Size + 1;
					Length := Length + 1;
			or
				when Length > 0 =>
					accept Remove (An_Item : out Item) do
						An_Item := Data(Head);
					end Remove;
					Head := Head mod Q_Size + 1;
					Length := Length - 1;
			end select;
		end loop;
	end Cyclic_Buffer_Task_Type;