-- 4.1.3 case
case X is
	when 1 => 
		Walk_The_Dog;
	when 5 => 
		Launch_Nuke;
	when 8 | 10 => 
		Sell_All_Stock;
	when others => 
		Self_Destruct;
end case;