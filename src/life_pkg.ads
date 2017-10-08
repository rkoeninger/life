with Gtk.Window;     use Gtk.Window;
with Gtk.Box;        use Gtk.Box;
with Gtk.Menu;       use Gtk.Menu;
with Gtk.Menu_Bar;   use Gtk.Menu_Bar;
with Gtk.Menu_Item;  use Gtk.Menu_Item;
with Gtk.Table;      use Gtk.Table;
with Gtk.Button;     use Gtk.Button;
with Gtk.Status_Bar; use Gtk.Status_Bar;

package Life_Pkg is

   type Life_Record is new Gtk_Window_Record with record
      Vbox1       : Gtk_Vbox;
      Menubar1    : Gtk_Menu_Bar;
      Life1       : Gtk_Menu_Item;
      Life1_Menu  : Gtk_Menu;
      Exit1       : Gtk_Menu_Item;
   end record;

   type Life_Access is access all Life_Record'Class;

   procedure Gtk_New (Life_Value : out Life_Access);

   procedure Initialize (Life_Value : out Life_Record'Class);

   Life_Value : Life_Access;

end;
