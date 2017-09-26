with Ada.Text_IO; use Ada.Text_IO;
with World; use World;

procedure Main is
   WG : World_Grid (16);
   B : Boolean;
begin
   WG := New_World (16);
   B := Get_Spot (WG, 1, 1);
   Put_Line ("World Size: " & Integer'Image(WG.Size));
   Put_Line ("Hello Ada!");
end;
