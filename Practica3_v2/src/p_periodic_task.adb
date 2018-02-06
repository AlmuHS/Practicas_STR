pragma Task_Dispatching_Policy (FIFO_Within_Priorities);
pragma Queuing_Policy (Priority_Queuing);
pragma Locking_Policy (Ceiling_Locking);

with Global;
with Write_Time;
with Ada.Real_Time;
with Ada.Calendar;
with Ada.Text_IO;

package body P_Periodic_Task is

   task view_task is
      entry ex_Handle_Failure(Fail : Global.Execution_Type; id: Integer);
      entry ex_Periodic_Activity(id: Integer);
   end view_task;


   procedure Handle_Failure (Fail : Global.Execution_Type) is
   begin
      Ada.Text_IO.Put("Deadline reached. Task with delay: ");
      Write_Time(Ada.Calendar.Clock);
   end Handle_Failure;

   procedure Periodic_Activity(id: Integer) is
   begin
      Ada.Text_IO.Put("I'm the task " & id'img & " the time is ");
      Write_Time(Ada.Calendar.Clock);
   end Periodic_Activity;


   task body view_task is
   begin
      loop
         select
            --Task without delay
            accept ex_Periodic_Activity(id: Integer) do
               Periodic_Activity(id);
            end ex_Periodic_Activity;
         or
            accept ex_Handle_Failure (Fail : Global.Execution_Type ; id: Integer) do
               --DeadLine reached
               Handle_Failure(Fail);
            end ex_Handle_Failure;
         end select;
      end loop;
   end ;

   task body Periodic_Task is
      use type Ada.Real_Time.Time;

      time: Ada.Calendar.Time := Ada.Calendar.Clock;
      Next : Ada.Real_Time.Time := Global.Start_Time + Ada.Real_Time.Milliseconds(Phase);
      End_deadline : Ada.Real_Time.Time := Global.Start_Time + Ada.Real_Time.Milliseconds(Deadline);
      deadline_off:Exception; --Exception declare

      begin
      -- Periodic_Task
      loop
         delay until Next;
           select
             view_task.ex_Handle_Failure(Global.Internal_Error,id);
           else
              if Ada.Real_Time.Clock > Next then
                 view_task.ex_Periodic_Activity(id);
              end if;
           end select;
           Next := Next + Ada.Real_Time.Milliseconds(Period);
      end loop;

      --exception
   exception
         when deadline_off => view_task.ex_Handle_Failure(Global.Internal_Error, id);

   end Periodic_Task;
end P_Periodic_Task;
