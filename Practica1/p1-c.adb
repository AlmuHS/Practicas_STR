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
begin
   Put_Line("Littlest Integer number: " & Integer'first'img);
   Put_Line("Biggest Integer number: " & Integer'last'img);
   Put_Line("Littlest Natural number: " & Natural'first'img);
   Put_Line("Littlest Positive number: " & Positive'first'img);
   Put_Line("Float significative numbers: " & Float'digits'img);

end p1;
