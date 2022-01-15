-- Skeletal program for Ada assignment at Programming Languages course
-- Students should rename tasks of producers, consumers, and the buffer
-- They should change them so that they will suit their own assignments
-- They should also supplement the code with missing constructions
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Simulation is
	Number_Of_Parts: constant Integer := 5;									-- number of Parts in the system		(5)
	Number_of_Products: constant Integer := 3;								-- number of Products in the system (3)
	Number_of_Consumers: constant Integer := 2;								-- number of Consumer in the system	(2)

	subtype Production_Time_Range is Integer range 3 .. 6;				-- time to produce is from 3 to 6?
	subtype Consumption_Time_Range is Integer range 4 .. 8;				-- time to consume is from 4 to 8?

	subtype Part_Type is Integer range 1 .. Number_of_Parts;				-- part type is a integer type from 1 to 5
	subtype Product_Type is Integer range 1 .. Number_of_Products;		-- part type is a integer type from 1 to 3
   subtype Consumer_Type is Integer range 1 .. Number_of_Consumers;        -- part type is a integer type from 1 to 2

	Part_Name: constant array (Part_Type) of String(1 .. 5):= ("Part1", "Part2", "Part3", "Part4", "Part5");		-- it's a array composed of 5 string[5]
	Product_Name: constant array (Product_Type) of String(1 .. 8):= ("Product1", "Product2", "Product3");			-- it's a array composed of 3 string[8]

	-- to calculate random value
	package Random_Consumption is new Ada.Numerics.Discrete_Random(Consumption_Time_Range);
	package Random_Product is new Ada.Numerics.Discrete_Random(Product_Type);
	
	type My_Str is new String(1 ..256);

	-- Producer produces specified part (part number, production time)
	task type Producer is
			-- Set up producer's identity, i.e. part type
			entry Start(Part: in Part_Type; Production_Time: in Integer);
	end Producer;

   -- Consumer gets a product consisting of parts from the Buffer (comsumer number, consumption time)
   task type Consumer is
		-- Set Consumer identity
		entry Start(Consumer_Number: in Consumer_Type; Consumption_Time: in Integer);
	end Consumer;

  	-- In the Buffer, parts are assembled into products
	task type Buffer is
		-- Accept part into the warehouse (part number, number(?))
		entry Take(Part: in Part_Type; Number: in Integer);
		-- Give out the product from the warehouse if there are enough parts (product number, number(?))
		entry Give(Product: in Product_Type; Number: out Integer);
	end Buffer;

  P: array ( 1 .. Number_of_Parts ) of Producer;
  K: array ( 1 .. Number_of_Consumers ) of Consumer;
  B: Buffer;

	task body Producer is
		package Random_Production is new	Ada.Numerics.Discrete_Random(Production_Time_Range);
		G: Random_Production.Generator;	--  random number generator
		Part_Type_No: Integer;
		Part_Number: Integer;
		Production: Integer;

	begin
		accept Start(Part: in Part_Type; Production_Time: in Integer) do
			Random_Production.Reset(G);	--  start random number generator
			Part_Number := 1;
			Part_Type_No := Part;
			Production := Production_Time;
		end Start;
		
		Put_Line("Producer of part " & Part_Name(Part_Type_No) & " started");
		loop
			delay Duration(Random_Production.Random(G)); --  simulate production
			Put_Line("Produced part " & Part_Name(Part_Type_No) & " number "  & Integer'Image(Part_Number));
			-- Put into the warehouse
			B.Take(Part_Type_No, Part_Number); 			-- "Part_type_No" is "Part" = the part (number) pass to the function
																	-- "Part Number" is the number of part this particular "Part_type_No"
			Part_Number := Part_Number + 1;
		end loop;
	end Producer;

   task body Consumer is
      G: Random_Consumption.Generator;	--  random number generator (time)
      G2: Random_Product.Generator;		--  random number generator (products)
      Consumer_no: Consumer_Type;
      Product_Number: Integer;
      Consumption: Integer;
      Product_Kind: Integer;
      Consumer_Name: constant array (1 .. Number_of_Consumers) of String(1 .. 9):= ("Consumer1", "Consumer2");

		begin
      accept Start(Consumer_Number: in Consumer_Type;	Consumption_Time: in Integer) do
			Random_Consumption.Reset(G);	--  set generator
			Random_Product.Reset(G2);	--  also
			Consumer_No := Consumer_Number;		-- set the consumer number (1 or 2)
			Consumption := Consumption_Time;		-- set the consumption time
      end Start;

      Put_Line("Started consumer " & Consumer_Name(Consumer_no));
      loop
			delay Duration(Random_Consumption.Random(G)); --  simulate consumption
			Product_Kind := Random_Product.Random(G2); 
			-- Get product for consumption
			B.Give(Product_Kind, Product_Number);
			Put_Line(Consumer_Name(Consumer_no) & ": got product " &	Product_Name(Product_Kind) & " number " &	Integer'Image(Product_Number));
      end loop;
   end Consumer;

   task body Buffer is
      Warehouse_Capacity: constant Integer := 30;
      type Warehouse_Type is array (Part_Type) of Integer; 	-- how many part i have for each part in the warehouse
      Warehouse: Warehouse_Type:= (0, 0, 0, 0, 0);				-- Inizialize: warehouse is empty 

		-- Each product (the product are 3) is composed from 5 part: here there is the declaration of how many
		-- parts must to be in Warehouse to produce a product
      Product_Contents: array(Product_Type, Part_Type) of Integer	
	:= ((2, 1, 2, 1, 2),
	    (2, 2, 0, 1, 0),
	    (1, 1, 2, 0, 1));

      Max_Product_Contents: array(Part_Type) of Integer;
      Product_Number: array(Product_Type) of Integer:= (1, 1, 1);
      In_Warehouse: Integer := 0;

		-- Setto semplicemente quante parti mi servono per ogni prodotto
      procedure Setup_Variables is
      begin
			for W in Part_Type loop
				Max_Product_Contents(W) := 0;
				for Z in Product_Type loop
					if Product_Contents(Z, W) > Max_Product_Contents(W) then
						Max_Product_Contents(W) := Product_Contents(Z, W);
					end if;
				end loop;
			end loop;
      end Setup_Variables;

      function Can_Take(Part: Part_Type) return Boolean is
			FreeSpace: Integer;		--  free space in the warehouse
			-- how many parts in the warehouse are missing for a product
			Missing: array(Part_Type) of Integer;
			-- how much space in the warehouse is needed to produce any product
			Number_Missing: Integer;
			CT: Boolean;			--  can take
				
		begin
			-- not free space In_warehouse
			if In_Warehouse >= Warehouse_Capacity then
				return False;
			end if;

			-- There is free space in the warehouse
			FreeSpace := Warehouse_Capacity - In_Warehouse;
			-- Inizialize CT to True
			CT := True;


			for W in Part_Type loop
				-- if One part miss I can't produce product --> set CT = False
				if Warehouse(W) < Max_Product_Contents(W) then
					CT := False;
				end if;
			end loop;

			if CT then
				return True;		--  there are sufficient parts for a product in the warehouse
			end if;

			if Integer'Max(0, Max_Product_Contents(Part) - Warehouse(Part)) > 0 then
            return True;      -- that exact part is missing
         end if;

			Number_Missing := 1;			--  current part is added

			for W in Part_Type loop
				Missing(W) := Integer'Max(0, Max_Product_Contents(W) - Warehouse(W));
				Number_Missing := Number_Missing + Missing(W);
			end loop;

			if FreeSpace >= Number_Missing then
				return True; 		-- there is enough room (spazio) in the warehouse to complete any product
			else
				return False;   	-- no space for such part
      end if;
		end Can_Take;

      function Can_Give(Product: Product_Type) return Boolean is
      begin
			for W in Part_Type loop
				if Warehouse(W) < Product_Contents(Product, W) then
					return False;
				end if;
			end loop;
			return True;
      end Can_Give;

      procedure Warehouse_Contents is
      begin
			for W in Part_Type loop
				Put_Line("Warehouse contents: " & Integer'Image(Warehouse(W)) & " " & Part_Name(W));
			end loop;
      end Warehouse_Contents;

   begin
      Put_Line("Buffer started");
      Setup_Variables;

      loop
	 		accept Take(Part: in Part_Type; Number: in Integer) do
				if Can_Take(Part) then
					Put_Line("Part accepted " & Part_Name(Part) & " number " & Integer'Image(Number));
					Warehouse(Part) := Warehouse(Part) + 1;
					In_Warehouse := In_Warehouse + 1;
				else
					Put_Line("Rejected part " & Part_Name(Part) & " number " & Integer'Image(Number));
				end if;
			end Take;

			Warehouse_Contents;

			accept Give(Product: in Product_Type; Number: out Integer) do
				if Can_Give(Product) then
					Put_Line("Gave away " & Product_Name(Product) & " number " & Integer'Image(Product_Number(Product)));
					
					for W in Part_Type loop
						Warehouse(W) := Warehouse(W) - Product_Contents(Product, W);
						In_Warehouse := In_Warehouse - Product_Contents(Product, W);
					end loop;
					
					Number := Product_Number(Product);
					Product_Number(Product) := Product_Number(Product) + 1;
				else
					Put_Line("Parts missing for product " & Product_Name(Product));
					Number := 0;
				end if;
			end Give;

			Warehouse_Contents;
		end loop;
   end Buffer;

	begin
		for I in 1 .. Number_of_Parts loop
			P(I).Start(I, 10);
		end loop;

		for J in 1 .. Number_of_Consumers loop
			K(J).Start(J,12);
		end loop;
end Simulation;
