-- Goal: create a system to keep track of quantities and prices of products.
-- Steps:
-- 1. Implement the Product_Info_Pkg package.
-- 1. Declare the array type Product_Infos.
-- 2. Declare the array type Currency_Array.
-- 3. Implement the Total procedure.
-- 4. Implement the Total function returning an array of Currency_Array type.
-- 5. Implement the Total function returning a single value of Currency type.

-- Requirements:
-- 1. Quantity of an individual product is represented by the Quantity subtype.
-- 2. Price of an individual product is represented by the Currency subtype.
-- 3. Record type Product_Info deals with information for various products.
-- 4. Array type Product_Infos is used to represent a list of products.
-- 5. Array type Currency_Array is used to represent a list of total values of individual products
-- (see more details below).

package Product_Info_Pkg is
	subtype Quantity is Natural;
	subtype Currency is Float;

	type Product_Info is record
		Units : Quantity;
		Price : Currency;
	end record;
	--
	-- Complete The type Declarations:
	type Product_Infos is array (Positive range <>) of Product_Info;
	--
	type Currency_Array is array (Positive range <>) of Currency;

	procedure Total (P	: Product_Infos;
								 Tot : out Currency_Array);

	function Total (P : Product_Infos) return Currency_Array;

	function Total (P : Product_Infos) return Currency;
end Product_Info_Pkg;
