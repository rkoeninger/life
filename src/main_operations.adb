with Gtk.Widget; use Gtk.Widget;
with Gtk.Main;

package body Main_Operations is

   ---------------
   -- Main_Exit --
   ---------------

   procedure Main_Exit (Self : access Gtk_Widget_Record'Class) is
   begin
      Gtk.Main.Main_Quit;
   end;

end;
