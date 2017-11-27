
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

with Ada.Text_Io, Colas; use Ada.Text_Io;


procedure Practica2 is
   package Colas_de_Integer is new Colas(Integer);
   use Colas_de_Integer;
   Practica_no_Funciona: exception;
   C1, C2, C3: Cola;
   E: Integer;
begin

         Put_Line("Insertando elementos en cola C1");
         for I in 1..10 loop
            Poner(I, C1);
         end loop;

         Put_Line("Insertando elementos en cola C2");
         for I in 11..20 loop
            Poner(I, C2);
         end loop;

         Put_Line("Probando funcion Esta_Vacia");
         if Esta_Vacia(C1) then raise Practica_No_Funciona;
         end if;

         Put_Line("Probando operador /=");
         if C1 /= C1 then raise Practica_no_Funciona;
         end if;

         Put_Line("Probando operador =");
         if C1 = C2 then raise Practica_no_Funciona;
         end if;

         Put_Line("Probando Copia C1 -> C3");
         Poner(1, C3); Copiar (C2, C3);

         if C2 /= C3 then raise Practica_no_Funciona;
         end if;

         Put_Line("Probando funciones Poner y Quitar");
         while not Esta_Vacia (C3) loop
            Quitar(E, C3); Poner(E, C1);
         end loop;

         if C3 = C1 then raise Practica_no_Funciona;
         end if;

         while not Esta_Vacia (C2) loop
            Quitar(E, C2);
         end loop;

         for I in 1..20 loop
            Poner(I, C2);
         end loop;

         if C1 /= C2 then raise Practica_no_Funciona;
         end if;

         for I in 1..17 loop
            begin
               Poner(1, C1); Quitar(E, C1);
            exception
               when Storage_Error =>
                  Put_Line("Practica no Funciona.");
                  Put_Line ("La funcion Quitar no libera memoria");
            end;
         end loop;
         Put_Line ("Practica correcta");


   exception
         when Practica_no_Funciona =>
            Put_Line ("Practica no Funciona");
         when Storage_Error =>
            Put_Line ("Práctica no Funciona.");
            Put_Line ("Posible recursión infinita");

end Practica2;
