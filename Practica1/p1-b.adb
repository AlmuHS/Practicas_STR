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
      v_pointer: PVector;
      p_table: vector(1 .. size);
   begin

      for i in p_table'range loop

         --Creates float vector
         v_pointer := new float_vector(1 .. size);

         --Insert values in vector
         for j in v_pointer'range loop
            v_pointer(j) := float(i*j);
         end loop;

         --Assign vector to pointers vector
         p_table(i) := v_pointer;

      end loop;

      --Shows vector contents
      for i in p_table'range loop

         --Get float vector from pointers vector
         v_pointer := p_table(i);

         --Shows values of vector
         for j in v_pointer'range loop
           put_line("vector " & i'img & ", position " & j'img & ":" & v_pointer(j)'img);
         end loop;

      end loop;


   end;
end p1;
