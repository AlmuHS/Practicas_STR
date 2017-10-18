with Text_IO; use Text_IO;

procedure p1 is

   size: Integer;

   package IIO is new Integer_IO(Integer);
   use IIO;

   type fixed_point is delta 0.01 range -25.00 .. 75.00;

   type date is tagged
      record
         Day: Integer range 1 .. 31;
         Month: Integer range 1 .. 12;
         Year: Integer range 1900 .. 2100;
      end record;

   type register is tagged
      record
         temperature: fixed_point;
         day: date;
      end record;

   type vector is array(integer range <>) of register;

begin

   Put_Line ("Set size: ");
   IIO.get(size);

   declare
      reg_list: vector(1 .. size);
      counter: Integer;
      max_temperature: fixed_point;
      min_temperature: fixed_point;
   begin

      for i in reg_list'range loop
         Put_Line("Write temperature: ");
         reg_list(i).temperature := fixed_point'value(Get_Line);
         Put_Line("Write day: ");
         reg_list(i).day.day := Integer'value(Get_Line);
         Put_Line("Write month: ");
         reg_list(i).day.month := Integer'value(Get_Line);
         Put_Line("Write year: ");
         reg_list(i).day.year := Integer'value(Get_Line);
      end loop;

      --max_temperature := reg_list'temperature


   end;


end p1;
