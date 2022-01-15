-- Goal: implement a simple package for source-code versioning.
-- Steps:
-- 1. Implement the Versioning package.
-- 1. Declare the record type Version.
-- 2. Implement the Convert function that returns a string.
-- 3. Implement the Convert function that returns a floating-point number.

-- Requirements:
-- 1. Record type Version has the following components of Natural type:
--    1. Major,
--    2. Minor, and
--    3. Maintenance.

package Versioning is
	type Version is record
		Major: Natural;
		Minor: Natural;
		Maintenance: Natural;
	end record;

	function Convert (V: Version) return String;
	function Convert (V: Version) return Float;
end Versioning;
