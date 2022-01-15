with Ada.Text_IO;
use Ada.Text_IO;
-- BUFFER --

package body Kitchenn is
   
	
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
end Kitchenn;
