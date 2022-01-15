-- IF:
	if Boolean expression then
		statements
	elsif Boolean expression then
		statements
	else
		statements
	end if;

-- CASE: OCCHIO CHE DEVI COMPRENDERE TUTTI I CASI!!!
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

-- WHILE:
	while Boolean expression loop
		statements
	end loop;

-- FOR:
	for variable in range loop
		statements
	end loop;

	For_Loop :
	for I in Integer range 1 .. 10 loop
		Do_Something (I)
	end loop For_Loop;

-- ??
	declare
	   declarations
	begin
	   statements
	exception
	   handlers
	end;

-- PROCEDURE:
	procedure P (parameters : in out type) is
	   declarations
	begin
	   statements
	exception
	   handlers
	end P;

-- FUNCTION:
	function F (parameters : in type) return type is
		declarations
	begin
		statements
	exception
		handlers
	end F;

-- PACKAGE
	package P is
		declarations
	private
		declarations
	end P;

-- GENERIC
	generic
		declarations
	package P is
		declarations
	private
		declarations
	end P;

-- GENERIC
	generic
		declarations
	procedure P (parameters : in out type);

