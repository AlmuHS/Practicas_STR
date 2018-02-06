with System;
with Ada.Real_Time;

package Global is
   type Execution_Type is (Correct, Internal_Error, External_Error);

   type Periodic_Profile_Type is record
      Period : Ada.Real_Time.Time_Span;
      Phase : Ada.Real_Time.Time;
      Priority : System.Priority;
      Deadline : Ada.Real_Time.Time_Span;
   end record;


   Start_Time : Ada.Real_Time.Time := Ada.Real_Time.Clock;
end Global;
