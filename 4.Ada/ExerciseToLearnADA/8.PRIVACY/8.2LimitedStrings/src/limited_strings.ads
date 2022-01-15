-- Goal: work with limited private types.
-- Steps:
-- 1. Implement the Limited_Strings package.
-- 1. Implement the Copy function.
-- 2. Implement the = operator.

package Limited_Strings is
	type Lim_String is limited private;

	function Init (S : String) return Lim_String;

	function Init (Max : Positive) return Lim_String;

	procedure Put_Line (LS : Lim_String);

	procedure Copy (From: Lim_String;
								 To: in out Lim_String);

	function "=" (Ref, Dut : Lim_String) return Boolean;

private
	type Lim_String is access String;

end Limited_Strings;
