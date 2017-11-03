with Text_IO; use Text_IO;

procedure p1 is
begin
   Put_Line("Littlest Integer number: " & Integer'first'img);
   Put_Line("Biggest Integer number: " & Integer'last'img);
   Put_Line("Littlest Natural number: " & Natural'first'img);
   Put_Line("Littlest Positive number: " & Positive'first'img);
   Put_Line("Float significative numbers: " & Float'digits'img);

end p1;
