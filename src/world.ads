package World is

   type Boolean_Array is array (Natural range <>) of Boolean;

   type World_Grid is record
      Grid : Boolean_Array (0 .. 255);
      Width, Height : Integer;
   end record;

   function Get_Spot
     (W : World_Grid;
      X, Y : Integer)
      return Boolean;

end World;
