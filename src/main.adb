with Ada.Text_IO; use Ada.Text_IO;
with Gtk;         use Gtk;
with Gtk.Main;
with Gtk.Widget;  use Gtk.Widget;
with Life_Pkg;    use Life_Pkg;
with World;       use World;

procedure Main is
   WG : World_Grid (16);
   B : Boolean;
begin
   WG := New_World (16);
   B := Get_Spot (WG, 1, 1);
   Put_Line ("World Size: " & Integer'Image(WG.Size));
   Put_Line ("Hello Ada!");
   --Gtk.Main.Init;
   --Gtk_New (Life_Value);
   --Gtk.Main.Main;
end;
