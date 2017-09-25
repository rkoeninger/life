package body World is

   --------------
   -- Get_Spot --
   --------------

   function Get_Spot (W : World_Grid; X, Y : Natural) return Boolean is
   begin
      return W.Grid (X, Y);
   end Get_Spot;

end World;
