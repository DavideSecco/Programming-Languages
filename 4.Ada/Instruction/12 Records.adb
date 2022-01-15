-- 12.1 Basic record
	type Basic_Record is record
		A : Integer;
	end record;

-- 12.2 Null record
	type Null_Record is record
		null;
	end record;

	type Null_Record is null record;

-- 12.3 Record Values
	A_Basic_Record : Basic_Record := Basic_Record' ( A => 42) ;
	Another_Basic_Record: Basic_Record := ( A => 42) ;
	Nix: constant Null_Record := ( null record) ;

	BMW : Car := (2007_752_83992434,5,Blue,190.0,10.1);
	BMW : Car := (	Identity				=> 2007_752_83992434,
						Number_Wheels 		=> 5,
						Horse_Power_kW 	=> 190. 0,
						Consumption 		=> 10. 1,
						Paint 				=> Blue);





