-- Skeletal program for Ada assignment at Programming Languages course
-- Students should rename tasks of producers, consumers, and the buffer
-- They should change them so that they will suit their own assignments
-- They should also supplement the code with missing constructions
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

-- I prepared simulation of a resturant, 5 ingrediants 3 dish and 2 clients

procedure Simulation is
	Number_Of_Ingredients: constant Integer := 5;									-- number of Parts in the system		(5)
	Number_Of_Meals: constant Integer := 3;								-- number of Products in the system (3)
	Number_Of_Customers: constant Integer := 3;								-- number of Consumer in the system	(2)

	subtype Ingredient_Type is Integer range 1 .. Number_Of_Ingredients;				-- part type is a integer type from 1 to 5
	subtype Product_Type is Integer range 1 .. Number_Of_Meals;		-- part type is a integer type from 1 to 3
   subtype Consumer_Type is Integer range 1 .. Number_Of_Customers;        -- part type is a integer type from 1 to 2

	Ingredient_Name: constant array (Ingredient_Type) of String(1 .. 6):= ("Water ", "Flour ", "Salt  ", "Yeast ", "Tomato");		-- it's a array composed of 5 string[5]
	Meal_Name: constant array (Product_Type) of String(1 .. 8):= ("Pizza   ", "Tigelle ", "Pasta   ");			-- it's a array composed of 3 string[8]

	-- to calculate random value
	package Random_Product is new Ada.Numerics.Discrete_Random(Product_Type);
	
	-- Producer produces specified part (part number, production time)
	task type IngredientsProducer is
			-- Set up producer's identity, i.e. part type
			entry Start(Ingredient: in Ingredient_Type; Production_Time: in Integer);
	end IngredientsProducer;

   -- Customer gets a product consisting of parts from the Kitchen (comsumer number, consumption time)
   task type Customer is
		-- Set Customer identity
		entry Start(Custumer_Number: in Consumer_Type; Consumption_Time: in Integer);
	end Customer;

  	-- In the Kitchen, parts are assembled into products
	task type Kitchen is
		-- Accept part into the warehouse (part number, number(?))
		entry Take(Ingredient: in Ingredient_Type; Number: in Integer; Took: out Integer);
		-- Give out the product from the warehouse if there are enough parts (product number, number(?))
		entry Give(Meal: in Product_Type; Number: out Integer; Took: out Integer);
	end Kitchen;

  P: array ( 1 .. Number_Of_Ingredients ) of IngredientsProducer;
  K: array ( 1 .. Number_Of_Customers ) of Customer;
  B: Kitchen;


	task body IngredientsProducer is
      subtype Production_Time_Range is Integer range 3 ..  6;                          -- time to produce is from 3 to 6?
      package Random_Production is new Ada.Numerics.Discrete_Random (Production_Time_Range);
		G: Random_Production.Generator;	--  random number generator
		Ingredient_Type_No: Integer;
		Ingredient_Number: Integer;
		Production: Integer;
		Took: Integer;

	begin
		accept Start(Ingredient: in Ingredient_Type; Production_Time: in Integer) do
			Random_Production.Reset(G);	--  start random number generator
			Ingredient_Number := 1;
			Ingredient_Type_No := Ingredient;
			Production := Production_Time;
		end Start;
		
		Put_Line("Producer of ingredient " & Ingredient_Name(Ingredient_Type_No) & " started");

		loop
			delay Duration(Random_Production.Random(G)); --  simulate production
			Put_Line("Produced ingredient " & Ingredient_Name(Ingredient_Type_No) & " number "  & Integer'Image(Ingredient_Number));
			-- Put into the warehouse
			
			loop
				select	
					delay 4.0;
					Put_Line("Sorry, you must wait a bit");

				then abort
					B.Take(Ingredient_Type_No, Ingredient_Number, Took); 			-- "Part_type_No" is "Ingredient" = the part (number) pass to the function -- "Ingredient Number" is the number of part this particular "Part_type_No"				
																			
					if Took = 0 then
						delay 3.0; 
					end if;

					Ingredient_Number := Ingredient_Number + 1;
					exit;
				end select;
			end loop;
		end loop;
	end IngredientsProducer;



	-- CONSUMER --
   task body Customer is
      subtype Consumption_Time_Range is Integer range 4 .. 8;                         -- time to consume is from 4 to 8?
      package Random_Consumption is new Ada.Numerics.Discrete_Random (Consumption_Time_Range);
      G : Random_Consumption.Generator;  --  random number generator (time)
      G2: Random_Product.Generator;		--  random number generator (products)
      Custumer_no: Consumer_Type;
      Meal_Number: Integer;
      Consumption: Integer;
      Meal_Type: Integer;
      Customer_Name: constant array (1 .. Number_Of_Customers) of String(1 .. 9):= ("Customer1", "Customer2", "Customer3");
      Took: Integer;

	begin
      accept Start(Custumer_Number: in Consumer_Type;	Consumption_Time: in Integer) do
			Random_Consumption.Reset(G);			--  set generator
			Random_Product.Reset(G2);				--  also
			Custumer_no := Custumer_Number;		-- set the consumer number (1 or 2)
			Consumption := Consumption_Time;		-- set the consumption time
      end Start;

      Put_Line("Started Customer " & Customer_Name(Custumer_no));

   	--[FIXED THIS PART]
		loop		
			delay Duration(Random_Consumption.Random(G)); --  simulate consumption
			Meal_Type := Random_Product.Random(G2); 
			
			loop
				select 
					delay 4.0; -- 	YOU CAN DECREASE THIS TIME IF YOU WANT MORE MESSAGE!!
					Put_Line("Please wait until we will have your meal");

				then abort
				-- Get product for consumption
					B.Give(Meal_Type, Meal_Number, Took);
					
					if Took = 1 then
						Put_Line(Customer_Name(Custumer_no) & ": got meal " &	Meal_Name(Meal_Type) & " number " &	Integer'Image(Meal_Number));
					elsif Took = 0 then
						delay 3.0;
					end if;
					exit;
				end select;
			end loop;

		end loop;			
   end Customer;


	-- BUFFER --
   task body Kitchen is
      Pantry_Capacity: constant Integer := 30;
      type Pantry_Type is array (Ingredient_Type) of Integer; 	-- how many part i have for each part in the pantry
      Pantry: Pantry_Type:= (0, 0, 0, 0, 0);				-- Inizialize: warehouse is empty 

		-- Each product (the product are 3) is composed from 5 part: here there is the declaration of how many
		-- parts must to be in Pantry to produce a product
      Meal_Contents: array(Product_Type, Ingredient_Type) of Integer	
		:= ((1, 3, 1, 1, 2),
			(1, 4, 1, 1, 0),
			(1, 0, 1, 0, 1));

      Max_Meal_Contents: array(Ingredient_Type) of Integer;
      Meal_Number: array(Product_Type) of Integer:= (1, 1, 1);
      In_Pantry: Integer := 0;
	
		-- Setto semplicemente quante parti mi servono per ogni prodotto
      procedure Setup_Variables is
      begin
			for W in Ingredient_Type loop
				Max_Meal_Contents(W) := 0;
				for Z in Product_Type loop
					if Meal_Contents(Z, W) > Max_Meal_Contents(W) then
						Max_Meal_Contents(W) := Meal_Contents(Z, W);
					end if;
				end loop;
			end loop;
      end Setup_Variables;

      function Can_Take(Ingredient: Ingredient_Type) return Boolean is
			FreeSpace: Integer;		--  free space in the warehouse
			-- how many parts in the warehouse are missing for a product
			Missing: array(Ingredient_Type) of Integer;
			-- how much space in the warehouse is needed to produce any product
			Number_Missing: Integer;
			CT: Boolean;			--  can take
				
		begin
			-- not free space In_warehouse
			if In_Pantry >= Pantry_Capacity then
				for W of Pantry loop
					In_Pantry:= In_Pantry - (W/2);
					W:= W - (W/2);
				end loop;
				return False;  
			end if;

			-- There is free space in the warehouse
			FreeSpace := Pantry_Capacity - In_Pantry;
			CT := True; 	-- Inizialize CT to True

			for W in Ingredient_Type loop
				-- if One part miss I can't produce product --> set CT = False
				if Pantry(W) < Max_Meal_Contents(W) then
					CT := False;
				end if;
			end loop;

			if CT then
				return True;		--  there are sufficient parts for a product in the warehouse
			end if;

			if Integer'Max(0, Max_Meal_Contents(Ingredient) - Pantry(Ingredient)) > 0 then
            return True;      -- that exact part is missing
         end if;

			Number_Missing := 1;			--  current part is added

			for W in Ingredient_Type loop
				Missing(W) := Integer'Max(0, Max_Meal_Contents(W) - Pantry(W));
				Number_Missing := Number_Missing + Missing(W);
			end loop;

			if FreeSpace >= Number_Missing then
				-- there is enough room (spazio) in the warehouse to complete any product
				return True; 		
			else
				-- no space for such part
				return False;   	
      	end if;
		end Can_Take;

      function Can_Give(Meal: Product_Type) return Boolean is
      begin
			for W in Ingredient_Type loop
				if Pantry(W) < Meal_Contents(Meal, W) then
					return False;
				end if;
			end loop;
			return True;
      end Can_Give;

      procedure Warehouse_Contents is
      begin
			for W in Ingredient_Type loop
				Put_Line("|| Pantry contents: " & Integer'Image(Pantry(W)) & " " & Ingredient_Name(W));
			end loop;
      end Warehouse_Contents;

   begin
      Put_Line("Kitchen started");
      Setup_Variables;

      loop
			select
				accept Take(Ingredient: in Ingredient_Type; Number: in Integer; Took: out Integer) do
					if Can_Take(Ingredient) then
						Put_Line("Ingredient accepted " & Ingredient_Name(Ingredient) & " number " & Integer'Image(Number));
						Pantry(Ingredient) := Pantry(Ingredient) + 1;
						In_Pantry := In_Pantry + 1;
						Took:= 1;
					else
						Put_Line("Rejected ingredient " & Ingredient_Name(Ingredient) & " number " & Integer'Image(Number));
						Took:= 0;
					end if;
				end Take;

				Warehouse_Contents;
			or
				accept Give(Meal: in Product_Type; Number: out Integer; Took: out Integer) do
					if Can_Give(Meal) then
						Put_Line("Delivered " & Meal_Name(Meal) & " number " & Integer'Image(Meal_Number(Meal)));
						
						for W in Ingredient_Type loop
							Pantry(W) := Pantry(W) - Meal_Contents(Meal, W);
							In_Pantry := In_Pantry - Meal_Contents(Meal, W);
						end loop;
						
						Number := Meal_Number(Meal);
						Meal_Number(Meal) := Meal_Number(Meal) + 1;
						Took:= 1;
					else
						Put_Line("Ingredients missing for maels " & Meal_Name(Meal));
						Number:= 0;
						Took:= 0;
					end if;
				end Give;
			end select;

			Warehouse_Contents;

		end loop;
   end Kitchen;

	begin
		for I in 1 .. Number_Of_Ingredients loop
			P(I).Start(I, 10);
		end loop;

		for J in 1 .. Number_Of_Customers loop
			K(J).Start(J,12);
		end loop;
end Simulation;
