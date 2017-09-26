package body World is

   ---------------
   -- New_World --
   ---------------

   function New_World (Size : Positive) return World_Grid is
   begin
      return World_Grid'(Size => Size,
                         Grid1 => (others => (others => False)),
                         Grid2 => (others => (others => False)),
                         Step => 0);
   end;

   --------------
   -- Get_Spot --
   --------------

   function Get_Spot (W : World_Grid; X, Y : Positive) return Boolean is
   begin
      if X not in 1 .. W.Size or Y not in 1 .. W.Size then
         return False;
      elsif W.Size mod 2 = 1 then
         return W.Grid1 (X, Y);
      else
         return W.Grid2 (X, Y);
      end if;
   end;

   --------------
   -- Set_Spot --
   --------------

   procedure Set_Spot (W : in out World_Grid; X, Y : Positive; B : Boolean) is
   begin
      if W.Size mod 2 = 1 then
         W.Grid2 (X, Y) := B;
      else
         W.Grid1 (X, Y) := B;
      end if;
   end;

   --------------
   -- Run_Step --
   --------------

   procedure Run_Step (W : in out World_Grid) is
      Count : Natural;
   begin
      W.Step := W.Step + 1;

      for X in Positive range 1 .. W.Size loop
         for Y in Positive range 1 .. W.Size loop
            Count := Live_Neighbors (W, X, Y);

            if Count < 2 then
               Set_Spot (W, X, Y, False);              -- Underpopulation
            elsif Count = 2 then
               Set_Spot (W, X, Y, Get_Spot (W, X, Y)); -- Survival
            elsif Count = 3 then
               Set_Spot (W, X, Y, True);               -- Reproduction
            elsif Count > 3 then
               Set_Spot (W, X, Y, False);              -- Overpopulation
            end if;
         end loop;
      end loop;
   end;

   --------------------
   -- Live_Neighbors --
   --------------------

   function Live_Neighbors (W : World_Grid; X, Y : Positive) return Natural is
      Count : Natural := 0;

      procedure Count_Neighbor (W : World_Grid; Count : in out Natural; X, Y : Positive) is
      begin
         if Get_Spot (W, X, Y) then
            Count := Count + 1;
         end if;
      end Count_Neighbor;
   begin
      Count_Neighbor (W, Count, X - 1, Y - 1);
      Count_Neighbor (W, Count, X,     Y - 1);
      Count_Neighbor (W, Count, X + 1, Y - 1);
      Count_Neighbor (W, Count, X - 1, Y);
      Count_Neighbor (W, Count, X + 1, Y);
      Count_Neighbor (W, Count, X - 1, Y + 1);
      Count_Neighbor (W, Count, X,     Y + 1);
      Count_Neighbor (W, Count, X + 1, Y + 1);
      return Count;
   end;

end World;
