
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

   type fixed_point is delta 0.01 range -25.00 .. 75.00;
   package FIO is new Fixed_IO(fixed_point);

   --Month Enum
   type month_enum is (January, February, March, April, May, June, July, August, September, October, November, December);
   package Enum_IO is new Enumeration_IO(month_enum);

   --Date record
   type date is tagged
      record
         Day: Integer range 1 .. 31;
         Month: month_enum;
         Year: Integer range 1900 .. 2100;
      end record;

   --Register record (minimal type in the vector)
   type register is tagged
      record
         temperature: fixed_point;
         day: date;
      end record;

   --vector of register
   type vector is array(integer range <>) of register;

begin

   --Ask vector size
   size := 0;
   Put_Line ("Set vector size: ");
   IIO.get(size);

   declare
      reg_list: vector(1 .. size);
      max_temperature: register;
      min_temperature: register;
      average: fixed_point;
      sum: fixed_point;
   begin

      --Ask values to user
      for i in reg_list'range loop
         Put_Line("Write temperature: ");
         FIO.Get(reg_list(i).temperature);

         Put_Line("Write day: ");
         IIO.Get(reg_list(i).day.day);

         Put_Line("Write month: ");
         Enum_IO.Get(reg_list(i).day.month);

         Put_Line("Write year: ");
         IIO.Get(reg_list(i).day.year);
      end loop;

      --Initialize maximal and minimal temperatures
      max_temperature := reg_list(1);
      min_temperature := reg_list(1);
      sum := 0.0;

      --Search in vector for get the maximal and minimal temperature
      for j in reg_list'range loop

         --Get maximal temperature
         if max_temperature.temperature < reg_list(j).temperature then
            max_temperature := reg_list(j);
         end if;

         --Get minimal temperature
         if min_temperature.temperature > reg_list(j).temperature then
            min_temperature := reg_list(j);
         end if;

         --Sum the values
         sum := sum + reg_list(j).temperature;

      end loop;

      --Calculate temperatures average
      average := sum/size;


      --Print minimal and maximal temperatures with the dates in which were reached
      Put_Line("Minimal Temperature: " & min_temperature.temperature'img & " celsius degree, " & "reached the " & min_temperature.day.day'img & " of " & min_temperature.day.month'img & " of " & min_temperature.day.year'img);
      Put_Line("Maximal Temperature: " & max_temperature.temperature'img & " celsius degree, " & "reached the " & max_temperature.day.day'img & " of " & max_temperature.day.month'img & " of " & max_temperature.day.year'img);
      Put_Line("The average temperature of the period is " & average'img);

   end;


end p1;
