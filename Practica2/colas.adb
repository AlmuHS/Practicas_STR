package body Colas is

   procedure Poner(el_Elemento: Elementos; en_la_Cola: in out Cola) is
   begin
      if Esta_Vacia(en_la_Cola) then
        en_la_Cola.first := new register'(data => el_Elemento, next => en_la_Cola.last);
        en_la_Cola.last := en_la_Cola.first.next;
      else
         en_la_Cola.last := new register'(data => el_Elemento, next => null);
         en_la_Cola.last := en_la_Cola.last.next;
      end if;
   end Poner;

   procedure Quitar(un_Elemento: out Elementos;de_la_Cola:in out Cola) is
      aux : link;
   begin
      if Esta_Llena(de_la_Cola) then
         un_Elemento := de_la_Cola.first.data;
         aux := de_la_Cola.first;
         Liberar_Register(de_la_Cola.first);
         de_la_Cola.first := aux.next;
      end if;

   end Quitar;

   function Esta_Vacia (La_Cola: Cola) return Boolean is
   begin
      return (La_Cola.first = La_Cola.last);
   end Esta_Vacia;


   function Esta_Llena (La_Cola: Cola) return Boolean is
   begin
      return (La_Cola.first /= La_Cola.last);
   end Esta_Llena;


   procedure Copiar (Origen: Cola; Destino:in out Cola) is
   begin
      Destino.first := Origen.first;
      Destino.last := Origen.last;
   end Copiar;


   function "="(La_Cola, Con_La_Cola: Cola) return Boolean is
      aux1: link;
      aux2: link;

   begin

      if Esta_Vacia(La_Cola) and Esta_Vacia(Con_La_Cola) then
         return true;

      elsif (Esta_Llena(La_Cola) and Esta_Vacia(Con_La_Cola))
        or   (Esta_Vacia(La_Cola) and Esta_Llena(Con_La_Cola)) then
         return false;

      elsif Esta_Llena(La_Cola) and Esta_Llena(Con_La_Cola) then
         aux1 := La_Cola.first;
         aux2 := Con_La_Cola.first;

         while aux1 /= null and aux2 /= null loop
            if aux1.data = aux2.data then
               aux1 := aux1.next;
               aux2 := aux2.next;
            else return false;
            end if;
         end loop;

         return (aux1 = La_Cola.last and aux2 = Con_La_Cola.last);

      end if;

   return false;

   end "=";

   lacola: Cola;

   begin

   lacola.first := lacola.last;


end Colas;
