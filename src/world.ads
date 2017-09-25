package World is

   type Boolean_Matrix is array (Positive range <>, Positive range <>) of Boolean;

   type World_Grid (Size : Positive) is record
      Grid1 : Boolean_Matrix (1 .. Size, 1 .. Size);
      Grid2 : Boolean_Matrix (1 .. Size, 1 .. Size);
      Step : Positive;
   end record;

   function Get_Spot (W : World_Grid; X, Y : Positive) return Boolean;

   procedure Run_Step (W : in out World_Grid);

private

   -- private members

end World;
