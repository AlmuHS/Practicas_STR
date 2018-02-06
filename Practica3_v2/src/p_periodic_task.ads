with System;
with Ada.Real_Time;

package P_Periodic_Task is
   task type Periodic_Task(Period: Integer; --Period
                           Phase: Integer; --Phase
                           Priority: System.Priority; --Priority
                           DeadLine: Integer; --DeadLine
                           id: Integer); --Name
end P_Periodic_Task;
