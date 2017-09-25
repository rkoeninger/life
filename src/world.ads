package World is

   type Boolean_Matrix is array (Natural range <>, Natural range <>) of Boolean;

   type World_Grid (Size : Natural) is record
      Grid : Boolean_Matrix (0 .. Size, 0 .. Size);
   end record;

   function Get_Spot
     (W : World_Grid;
      X, Y : Natural)
      return Boolean;

private

   -- private members

end World;
