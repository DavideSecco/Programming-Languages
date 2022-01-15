-- 4.3.1 Endless Loop
	Endless_Loop:
		loop
			Do_Something;
	end loop Endless_Loop;

-- 4.3.2 Loop with condition at the beginning
	While_Loop :
		while X <= 5 loop
			X := Calculate_Something;
		end loop While_Loop;

-- 4.3.3 Loop with condition at the end
	Until_Loop :
		loop
			X := Calculate_Something;
			exit Until_Loop when X > 5;
		end loop Until_Loop;

-- 4.3.4 Loop with condition in the middle
	Exit_Loop :
		loop
			X := Calculate_Something;
			exit Exit_Loop when X > 5;
			Do_Something (X);
		end loop Exit_Loop;

























