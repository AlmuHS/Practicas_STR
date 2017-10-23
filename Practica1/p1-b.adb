with Text_IO; use Text_IO;

procedure p1 is
   size: Integer;

   package IIO is new Integer_IO(Integer);
   use IIO;

   type float_vector is array(integer range<>) of float;
   type PVector is access float_vector;
   type vector is array(integer range <>) of PVector;
begin

   size := 0;
   Put_Line ("Set vector size: ");
   IIO.get(size);

   declare
      --fvector: float_vector(1 .. size);
      v_pointer: PVector;
      p_table: vector(1 .. size);
   begin
      v_pointer := new float_vector(1 .. size);

      for i in p_table'range loop
         v_pointer := p_table(i);

         for j in v_pointer'range loop
            v_pointer(j) := float(i*j);
         end loop;

      end loop;

      for i in p_table'range loop
         v_pointer := p_table(i);

         for j in v_pointer'range loop
           put_line(v_pointer(j)'img);
         end loop;

      end loop;


   end;
end p1;
