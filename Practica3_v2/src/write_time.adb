with Ada.Real_Time;
with Ada.Dynamic_Priorities;
with Ada.Text_IO; with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Calendar;

procedure Write_Time (Actual_Time : Calendar.Time) is
begin
   Ada.Integer_Text_IO.Put(Integer(Calendar.Year(Actual_Time)),4);
   Ada.Text_IO.Put(":");
   Ada.Integer_Text_IO.Put(Integer(Calendar.Month(Actual_Time)),2);
   Ada.Text_IO.Put(":");
   Ada.Integer_Text_IO.Put(Integer(Calendar.Day(Actual_Time)),2);
   Ada.Text_IO.Put(":");
   Ada.Float_Text_IO.Put(Float(Calendar.Seconds(Actual_Time)));
   Ada.Text_IO.New_Line;
end Write_Time;
