with Ada.Text_IO; use Ada.Text_IO;

with Gen_Queues;

package body Queue_Tests is
	Max : constant := 10;
	type Queue_Mod is mod Max;

	procedure Simple_Test is
		package Queues_Float is new Gen_Queues (Queue_Mod, Float);
		Q_F : Queues_Float.Queue;
		V: Float;

	begin
		V := 10.0;
		while not Q_F.Full loop
			Q_F.Push (V);
			V := V + 1.5;
		end loop;

		while not Q_F.Empty loop
			Q_F.Pop (V);
			Put_Line ("Value from queue: " & Float'Image (V));
		end loop;
	end Simple_Test;

	procedure Concurrent_Test is

		package Queues_Integer is new Gen_Queues (Queue_Mod, Integer);
		Q_I : Queues_Integer.Queue;
		task T_Producer;
		task T_Consumer;

		task body T_Producer is
			V : Integer := 100;
		begin
			for I in 1 .. 2 * Max loop
				Q_I.Push (V);
				V := V + 1;
			end loop;
		end T_Producer;

		task body T_Consumer is
			V : Integer;
		begin
			delay 1.5;
			while not Q_I.Empty loop
				Q_I.Pop (V);
				Put_Line ("Value from queue: " & Integer'Image (V));
				delay 0.2;
			end loop;
		end T_Consumer;

	begin
		null;
	end Concurrent_Test;
end Queue_Tests;
