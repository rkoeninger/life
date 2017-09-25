package World is

   type Boolean_Matrix is array (Natural range <>, Natural range <>) of Boolean;

   type World_Grid is record
      Width, Height : Integer;
      Grid : Boolean_Matrix (0 .. 15, 0 .. 15);
   end record;

   function Get_Spot
     (W : World_Grid;
      X, Y : Integer)
      return Boolean;

end World;
