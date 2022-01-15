package Tests is
	type Test_ID is (Test_1, Test_2);

	Custom_Exception : exception;
	
	procedure Num_Exception_Test (ID : Test_ID);
end Tests;