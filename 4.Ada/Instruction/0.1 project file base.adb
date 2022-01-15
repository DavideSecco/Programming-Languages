project Default is
   for Source_Dirs use ("src");
   for Object_Dir use "obj";
   for Main use ("main.adb");
   for Exec-Dir use ".";

   package Compiler is
      for Switches ("ada") use ("-g", "-gnato");
   end Compiler;

end Default;