package body World is

   --------------
   -- Get_Spot --
   --------------

   function Get_Spot (W : World_Grid; X, Y : Positive) return Boolean is
   begin
      if X < 1 or Y < 1 or X > W.Size or Y > W.Size then
         return False;
      elsif W.Step mod 2 = 1 then
         return W.Grid1 (X, Y);
      else
         return W.Grid2 (X, Y);
      end if;
   end Get_Spot;

   --------------
   -- Set_Spot --
   --------------

   procedure Set_Spot (W : in out World_Grid; X, Y: Positive; B: Boolean) is
   begin
      if W.Step mod 2 = 1 then
         W.Grid1 (X, Y) := B;
      else
         W.Grid2 (X, Y) := B;
      end if;
   end Set_Spot;

   --------------
   -- Run_Step --
   --------------

   procedure Run_Step (W : in out World_Grid) is
      Source_Grid : Boolean_Matrix (1 .. W.Size, 1 .. W.Size);
      Dest_Grid : Boolean_Matrix (1 .. W.Size, 1 .. W.Size);
      Count : Natural;
   begin
      if W.Step mod 2 = 1 then
         Source_Grid := W.Grid1;
         Dest_Grid := W.Grid2;
      else
         Source_Grid := W.Grid1;
         Dest_Grid := W.Grid2;
      end if;

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

      W.Step := W.Step + 1;
   end Run_Step;

   --------------------
   -- Live_Neighbors --
   --------------------

   function Live_Neighbors (W : World_Grid; X, Y : Positive) return Natural is
      Count : Natural := 0;
   begin
      if Get_Spot (W, X - 1, Y - 1) then
         Count := Count + 1;
      end if;

      if Get_Spot (W, X, Y - 1) then
         Count := Count + 1;
      end if;

      if Get_Spot (W, X + 1, Y - 1) then
         Count := Count + 1;
      end if;

      if Get_Spot (W, X - 1, Y) then
         Count := Count + 1;
      end if;

      if Get_Spot (W, X + 1, Y) then
         Count := Count + 1;
      end if;

      if Get_Spot (W, X - 1, Y + 1) then
         Count := Count + 1;
      end if;

      if Get_Spot (W, X, Y + 1) then
         Count := Count + 1;
      end if;

      if Get_Spot (W, X + 1, Y + 1) then
         Count := Count + 1;
      end if;

      return Count;
   end;

end World;
