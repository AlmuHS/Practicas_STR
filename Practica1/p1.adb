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
   begin

      for i in reg_list'range loop
         Put_Line("Write temperature: ");
         reg_list(i).temperature := fixed_point'value(Get_Line);
      end loop;

      counter := 1;

      while counter <= size loop
         --Put(reg_list(counter).temperature);
         counter := counter + 1;
      end loop;

   end;


end p1;
