package body World is

   --------------
   -- Get_Spot --
   --------------

   function Get_Spot (W : World_Grid; X, Y : Positive) return Boolean is
   begin
      if X < 1 or Y < 1 or X > W.Size or Y > W.Size then
         return False;
      elsif Is_First_Grid (W) then
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
      if Is_First_Grid (W) then
         W.Grid1 (X, Y) := B;
      else
         W.Grid2 (X, Y) := B;
      end if;
   end;

   --------------
   -- Run_Step --
   --------------

   procedure Run_Step (W : in out World_Grid) is
      Source_Grid : Boolean_Matrix (1 .. W.Size, 1 .. W.Size);
      Dest_Grid : Boolean_Matrix (1 .. W.Size, 1 .. W.Size);
      Count : Natural;
   begin
      W.Step := W.Step + 1;
      Source_Grid := (if Is_First_Grid (W) then W.Grid1 else W.Grid2);
      Dest_Grid := (if Is_First_Grid (W) then W.Grid2 else W.Grid1);

      for X in Positive range 1 .. W.Size loop
         for Y in Positive range 1 .. W.Size loop
            Count := Live_Neighbors (W, X, Y);

            if Count < 2 then
               Dest_Grid (X, Y) := False;              -- Underpopulation
            elsif Count = 2 then
               Dest_Grid (X, Y) := Source_Grid (X, Y); -- Survival
            elsif Count = 3 then
               Dest_Grid (X, Y) := True;               -- Reproduction
            elsif Count > 3 then
               Dest_Grid (X, Y) := False;              -- Overpopulation
            end if;
         end loop;
      end loop;
   end;

   -------------------
   -- Is_First_Grid --
   -------------------

   function Is_First_Grid (W : World_Grid) return Boolean is
   begin
      return W.Step mod 2 = 1;
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
