-- 2. Function Init returns an initialized item (of Item type).
-- 1. Function Init must also display the item name by calling the To_String function for
-- the Item_Name type.
-- - This is already implemented in the code below.
-- 3. Procedure Add adds an item to the assets.
-- 1. Since we want to keep track of the assets, the implementation must accumulate the total
-- value of each item's inventory, the result of multiplying the item quantity and its price.

with Ada.Text_IO; use Ada.Text_IO;

package body Inventory_Pkg is

	function To_String (I : Item_Name) return String is
	begin
		case I is
			when Ballpoint_Pen => return "Ballpoint Pen";
			when Oil_Based_Pen_Marker => return "Oil-based Pen Marker";
			when Feather_Quill_Pen	=> return "Feather Quill Pen";
		end case;
	end To_String;

	function Init (Name: Item_Name;
								Quantity: Natural;
								Price: Float) return Item is
	begin
		Put_Line ("Item: " & To_String (Name) & ".");
		-- Replace return statement with the actual record initialization!
		return (Name => Name, Quantity => Quantity, Price => Price);
	end Init;

	procedure Add (Assets: in out Float;
      						I : Item) is
	begin
		-- Implement the function that adds an item to the inventory here!

		Assets:= Assets + I.Price*(Float(I.Quantity));
	end Add;
end Inventory_Pkg;
