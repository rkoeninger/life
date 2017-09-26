package World is

   type Boolean_Matrix is array (Positive range <>, Positive range <>) of Boolean;

   type World_Grid (Size : Positive) is record
      Grid1 : Boolean_Matrix (1 .. Size, 1 .. Size);
      Grid2 : Boolean_Matrix (1 .. Size, 1 .. Size);
      Step : Positive;
   end record;

   function New_World (Size : Positive) return World_Grid;

   function Get_Spot (W : World_Grid; X, Y : Positive) return Boolean;

   procedure Set_Spot (W : in out World_Grid; X, Y : Positive; B : Boolean);

   procedure Run_Step (W : in out World_Grid);

private

   function Is_First_Grid (W : World_Grid) return Boolean;

   function Live_Neighbors (W : World_Grid; X, Y : Positive) return Natural;

end World;
