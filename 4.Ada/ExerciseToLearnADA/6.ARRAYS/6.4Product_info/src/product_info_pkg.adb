-- 6. Procedure Total receives an input array of products.
--    1. It outputs an array with the total value of each product using the Currency_Array type.
--    2. The total value of an individual product is calculated by multiplying the quantity for this product by its price.

-- 7. Function Total returns an array of Currency_Array type.
--    1. This function has the same purpose as the procedure Total.
--    2. The difference is that the function returns an array instead of providing this array as an output parameter.

-- 8. The second function Total returns a single value of Currency type.
--    1. This function receives an array of products.
--    2. It returns a single value corresponding to the total value for all products in the system.

package body Product_Info_Pkg is
	-- Complete The Subprogram Implementations:

	procedure Total (P: Product_Infos;
								 Tot : out Currency_Array) is
	begin
		for I in P'Range loop
			Tot(I):= (P(I).Price)*Currency(P(I).Units);
		end loop;
	end Total;

	function Total (P : Product_Infos) return Currency_Array is
		Tot: Currency_Array (P'Range);
	begin
		Total(P, Tot);
		return Tot;
	end Total;

	function Total (P : Product_Infos) return Currency is
		Total: Currency:= 0.0;
	begin
		for I in P'Range loop
			Total:= Total + Currency(P(I).Units)*P(I).Price;
		end loop;
		return Total;
	end Total;
end Product_Info_Pkg;
