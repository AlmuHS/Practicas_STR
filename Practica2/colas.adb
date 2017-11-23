
package body Colas is

   procedure Poner(el_Elemento: Elementos; en_la_Cola: in out Cola) is
   begin
      en_la_Cola.last.next := new register'(data => el_Elemento, next => en_la_Cola.last.next);
   end Poner;

   procedure Quitar(un_Elemento: out Elementos;de_la_Cola:in out Cola) is
   begin
      if de_la_Cola.first /= null then
         un_Elemento := de_la_Cola.first.data;
         --de_la_Cola.first := de_la_Cola.first.next;
         de_la_Cola.first := new register'(data => de_la_Cola.first.next.data, next => de_la_Cola.first.next);
      end if;

   end Quitar;

   function Esta_Vacia (La_Cola: Cola) return Boolean is
   begin
      return (La_Cola.first = null);

   end Esta_Vacia;


   function Esta_Llena (La_Cola: Cola) return Boolean is
   begin
      return (La_Cola.first /= null);
   end Esta_Llena;

   procedure Copiar (Origen: Cola; Destino:in out Cola) is
   begin
      Destino := Origen;
   end Copiar;

   function "="(La_Cola, Con_La_Cola: Cola) return Boolean is
      aux1: link;
      aux2: link;

   begin

      if not Esta_Vacia(La_Cola) and not Esta_Vacia(Con_La_Cola) then
         aux1 := new register'(data => La_Cola.first.data, next => La_Cola.first.next);
         aux2 := new register'(data => Con_La_Cola.first.data, next => Con_La_Cola.first.next);
      end if;

      while aux1 /= null and aux2 /= null and aux1.data = aux2.data loop
         aux1 := new register'(data => aux1.data, next => aux1.next);
         aux2 := new register'(data => aux2.data, next => aux2.next);
      end loop;

      if aux1 = La_Cola.last then
         return true;
      else
         return false;
      end if;

   end "=";

   lacola: Cola;

   begin

   lacola.first := new register'(data => lacola.first.data, next => null);
   lacola.last := new register'(data => lacola.last.data, next => null);

end Colas;
