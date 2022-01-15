-- 21.1 Tasks
	-- A single task is declared as follows:
		task Single is
			declarations of exported identifiers
		end Single;
		...
		task body Single is
			local declarations and statements
		end Single

	-- EXAMPLE 1:
		procedure Housekeeping is
			task Check_CPU;
			task Backup_Disk;
			task body Check_CPU is
			...
			end Check_CPU;
			
			task body Backup_Disk is
			...
			end Backup_Disk;
			--the two tasks are automatically created and begin execution
			begin --Housekeeping
			null;
			--Housekeeping waits here for them to terminate
		end Housekeeping;