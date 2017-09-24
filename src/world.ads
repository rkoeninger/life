package World is
   
--   type World_Grid_Array is array (Integer range <>) of Boolean;

   type World_Grid is record
--      Grid : World_Grid_Array;
      Width : Integer;
      Height: Integer;
   end record;

   procedure Get_Spot (W : World_Grid; X : in out Integer; Y : in out Integer);

end World;
