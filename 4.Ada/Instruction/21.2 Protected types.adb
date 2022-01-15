-- 21.2 Protected types
	protected type Protected_Buffer_Type is
		entry Insert (An_Item : in Item);
		entry Remove (An_Item : out Item);
	private
		Buffer : Item;
		Empty : Boolean := True;
	end Protected_Buffer_Type;
	...
	protected body Protected_Buffer_Type is
		entry Insert (An_Item : in Item)
			when Empty is
		begin
			Buffer := An_Item;
			Empty := False;
		end Insert;

		entry Remove (An_Item : out Item)
			when not Empty is
		begin
			An_Item := Buffer;
			Empty := True;
		end Remove;
	end Protected_Buffer_Type;

	-- Another Example:
	protected Counter is
		function Get return Integer;
		procedure Increment;
		procedure Decrement	;
	private
   	Value : Integer := 0;
	end Counter;

	protected body Counter is
   	function Get return Integer is
   	begin
      	return Value;
   	end Get;

		procedure Increment is
		begin
		Value := Value + 1;
		end Increment;

		procedure Decrement is
		begin
			Value := Value - 1;
		end Decrement;
end Counter;
