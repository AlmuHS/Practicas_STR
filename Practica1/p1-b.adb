-- Copyright (C) 2017 Almudena García Jurado-Centurión

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.


with Text_IO; use Text_IO;

procedure p1 is
   size: Integer;

   package IIO is new Integer_IO(Integer);
   use IIO;

   --define float vector
   type float_vector is array(integer range<>) of float;

   --define pointer to float vector
   type PVector is access float_vector;

   --define vector of pointers to float vector
   type vector is array(integer range <>) of PVector;
begin

   size := 0;

   --Ask vector size to user
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
