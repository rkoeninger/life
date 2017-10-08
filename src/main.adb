with Ada.Text_IO;     use Ada.Text_IO;
with Gtk;             use Gtk;
with Gtk.Box;         use Gtk.Box;
with Gtk.Button;      use Gtk.Button;
with Gtk.Enums;       use Gtk.Enums;
with Gtk.Image;       use Gtk.Image;
with Gtk.Label;       use Gtk.Label;
with Gtk.Main;
with Gtk.Menu;        use Gtk.Menu;
with Gtk.Menu_Bar;    use Gtk.Menu_Bar;
with Gtk.Menu_Item;   use Gtk.Menu_Item;
with Gtk.Status_Bar;  use Gtk.Status_Bar;
with Gtk.Table;       use Gtk.Table;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Window;      use Gtk.Window;
with Gtkada.Intl;     use Gtkada.Intl;
with Gtkada.Pixmaps;  use Gtkada.Pixmaps;
with Main_Operations; use Main_Operations;
with World;           use World;

procedure Main is
--   WG : World_Grid (16);
--   B : Boolean;
   Win : Gtk_Window;
begin
--   WG := New_World (16);
--   B := Get_Spot (WG, 1, 1);
--   Put_Line ("World Size: " & Integer'Image(WG.Size));
--   Put_Line ("Hello Ada!");
   Gtk.Main.Init;
   Gtk_New (Win);
   Win.Set_Title ("Window");
   Set_Position (Win, Win_Pos_None);
   Set_Default_Size (Win, 400, 400);
   Win.On_Destroy (Main_Exit'Access);
   Win.Show_All;
   Gtk.Main.Main;
end;
