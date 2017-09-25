with Ada.Text_IO; use Ada.Text_IO;

with World; use World;

procedure Main is
   WG : World_Grid;
   B : Boolean;
begin
   WG := World_Grid'(Grid => (others => (others => False)), Width => 16, Height => 16);
   B := Get_Spot (WG, 0, 0);
   Put_Line ("Hello Ada!");
end Main;
