-- 1. Implement the Color_Types package.
-- 1. Declare the HTML_Color enumeration
-- 2. Declare the Basic_HTML_Color enumeration.
-- 3. Implement the To_Integer function.
-- 4. Implement the To_HTML_Color function.

-- Requirements:
-- 1. Enumeration HTML_Color has the following colors:
-- 2. Enumeration Basic_HTML_Color has the following colors: Red, Green, Blue.
-- 3. Function To_Integer converts from the HTML_Color type to the HTML color code

-- - You can find the HTML color codes in the table below.
-- 4. Function To_HTML_Color converts from Basic_HTML_Color to HTML_Color.
-- 5. This is the table to convert from an HTML color to a HTML color code in hexadecimal notation:

package Color_Types is

type HTML_Color is (Salmon, Firebrick, Red, Darkred, Lime, Forestgreen, Green, Darkgreen, Blue, Mediumblue, Darkblue);
type Basic_HTML_Color is (Red, Green, Blue);

function To_Integer (C: HTML_Color) return Integer;
function To_HTML_Color (C: Basic_HTML_Color) return HTML_Color;

end Color_Types;
