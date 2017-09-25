package body World is

   --------------
   -- Get_Spot --
   --------------

   function Get_Spot
     (W : World_Grid;
      X, Y : Integer)
      return Boolean
   is
      Index : Integer;
   begin
      Index := Y * W.Width + X;
      return W.Grid (Index);
   end Get_Spot;

end World;
