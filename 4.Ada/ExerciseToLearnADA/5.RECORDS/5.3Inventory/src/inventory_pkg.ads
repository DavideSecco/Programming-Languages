-- Goal: create a simplified inventory system for a store to enter items and keep track of assets.
-- Steps:
-- 1. Implement the Inventory_Pkg package.
-- 1. Declare the Item record.
-- 2. Implement the Init function.
-- 3. Implement the Add procedure.

-- Requirements:
-- 1. Record Item collects information about products from the store.
-- 1. To keep it simple, this record only contains the name, quantity and price of each item.
-- 2. The record components are:
-- - Name of Item_Name type;
-- - Quantity of Natural type;
-- - Price of Float type.
package Inventory_Pkg is
	type Item_Name is (Ballpoint_Pen, Oil_Based_Pen_Marker, Feather_Quill_Pen);
	function To_String (I : Item_Name) return String;

	-- Replace type declaration for Item record:
	type Item is record
		Name: Item_Name;
		Quantity : Natural;
		Price: Float;
	end record;

	function Init (Name     : Item_Name;
								Quantity : Natural;
								Price    : Float) return Item;

	procedure Add (Assets : in out Float;
								I      : Item);
end Inventory_Pkg;
