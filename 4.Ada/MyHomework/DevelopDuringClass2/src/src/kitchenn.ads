with Ada.Text_IO;
use Ada.Text_IO;

package Kitchenn is 
	Number_Of_Ingredients: constant Integer := 5;									-- number of Parts in the system		(5)
	Number_Of_Meals: constant Integer := 3;								-- number of Products in the system (3)
	Number_Of_Customers: constant Integer := 3;								-- number of Consumer in the system	(2)

	subtype Ingredient_Type is Integer range 1 .. Number_Of_Ingredients;				-- part type is a integer type from 1 to 5
	subtype Product_Type is Integer range 1 .. Number_Of_Meals;		-- part type is a integer type from 1 to 3
   subtype Consumer_Type is Integer range 1 .. Number_Of_Customers;        -- part type is a integer type from 1 to 2

	Ingredient_Name: constant array (Ingredient_Type) of String(1 .. 6):= ("Water ", "Flour ", "Salt  ", "Yeast ", "Tomato");		-- it's a array composed of 5 string[5]
	Meal_Name: constant array (Product_Type) of String(1 .. 8):= ("Pizza   ", "Tigelle ", "Pasta   ");			-- it's a array composed of 3 string[8]
	
	-- In the Kitchen, parts are assembled into products
	task type Kitchen is
		-- Accept part into the warehouse (part number, number(?))
		entry Take(Ingredient: in Ingredient_Type; Number: in Integer; Took: out Integer);
		-- Give out the product from the warehouse if there are enough parts (product number, number(?))
		entry Give(Meal: in Product_Type; Number: out Integer; Took: out Integer);
	end Kitchen;

	

end Kitchenn;