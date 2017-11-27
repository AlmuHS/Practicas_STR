
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

with Ada.Unchecked_Deallocation;

generic
   type Elementos is private;

package Colas is
   type Cola is limited private;
   procedure Poner(el_Elemento: Elementos; en_la_Cola: in out Cola);
   procedure Quitar(un_Elemento: out Elementos;de_la_Cola:in out Cola);
   function Esta_Vacia (La_Cola: Cola) return Boolean;
   function Esta_Llena (La_Cola: Cola) return Boolean;
   procedure Copiar (Origen: Cola; Destino:in out Cola);
   function "="(La_Cola, Con_La_Cola: Cola) return Boolean;

private

   type register;

   type link is access register;
   type register is tagged
      record
         data: Elementos;
         next: link;
      end record;

   type Cola is tagged
      record
         first: link;
         last: link;
      end record;

   procedure Liberar_Register is new Ada.Unchecked_Deallocation
     (register, link);

end Colas;
