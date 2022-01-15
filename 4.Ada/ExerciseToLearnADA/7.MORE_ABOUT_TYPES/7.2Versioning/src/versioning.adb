with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

package body Versioning is
	function Image_Trim (N : Natural) return String is
		S_N : constant String := Trim (Natural'Image (N), Left);
	begin
		return S_N;
	end Image_Trim;

	function Convert (V: Version) return String is
		S_Major : constant String := Image_Trim (V.Major);
		S_Minor : constant String := Image_Trim (V.Minor);
		S_Maint : constant String := Image_Trim (V.Maintenance);
  begin
		return (S_Major & "." & S_Minor & "." & S_Maint);
  end Convert;

	function Convert (V: Version) return Float is
		F_Major : Float := Float(V.Major);
		F_Minor : Float := Float(V.Minor);
	begin
		return Float(F_Major) + (Float(F_Minor/Float(10.0)));
	end Convert;

end Versioning;
