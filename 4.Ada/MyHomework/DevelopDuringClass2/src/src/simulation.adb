-- Skeletal program for Ada assignment at Programming Languages course
-- Students should rename tasks of producers, consumers, and the buffer
-- They should change them so that they will suit their own assignments
-- They should also supplement the code with missing constructions
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

with Kitchenn; use Kitchenn;

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


	
	begin
		for I in 1 .. Number_Of_Ingredients loop
			P(I).Start(I, 10);
		end loop;

		for J in 1 .. Number_Of_Customers loop
			K(J).Start(J,12);
		end loop;
end Simulation;
