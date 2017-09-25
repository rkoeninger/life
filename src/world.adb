package body World is

   --------------
   -- Get_Spot --
   --------------

   function Get_Spot (W : World_Grid; X, Y : Positive) return Boolean is
   begin
      if W.Step mod 2 = 1 then
         return W.Grid1 (X, Y);
      else
         return W.Grid2 (X, Y);
      end if;
   end Get_Spot;

   procedure Run_Step (W : in out World_Grid) is
      Source_Grid : Boolean_Matrix (1 .. W.Size, 1 .. W.Size);
      Dest_Grid : Boolean_Matrix (1 .. W.Size, 1 .. W.Size);
   begin
      if W.Step mod 2 = 1 then
         Source_Grid := W.Grid1;
         Dest_Grid := W.Grid2;
      else
         Source_Grid := W.Grid1;
         Dest_Grid := W.Grid2;
      end if;

      -- Run Population Step

      W.Step := W.Step + 1;
   end Run_Step;

end World;
