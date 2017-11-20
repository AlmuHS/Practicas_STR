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

   type register is tagged
      record
         data: Elementos;
         next: access register;
      end record;

   type Cola is tagged
      record
         first: access register;
         last: access register;
      end record;

end Colas;