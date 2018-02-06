with P_Periodic_Task;

procedure Main is
   type Periodic is new P_Periodic_Task.Periodic_Task;

   T1: Periodic(1000,0,1,1000, 1); --Task 1
   T2: Periodic(2000,0,1,2000, 2); --Task 2
   T3: Periodic(3000,0,1,3000, 3); --Task 3
   T4: Periodic(4000,0,1,4000, 4); --Task 4
begin
   null;
end Main;
