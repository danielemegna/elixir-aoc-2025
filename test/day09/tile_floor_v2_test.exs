alias Day09.TileFloorV2

defmodule Day09.TileFloorV2Test do
  use ExUnit.Case

  describe "TileFloor" do

    test "exposes external corners" do
      tile_floor = TileFloorV2.new([
        {1, 1}, {3, 1}, {3, 3}, {1, 3}
      ])

      expected = MapSet.new([
        {0, 2}, {0, 1}, {0, 0}, {1, 0} ,{2, 0},
        {3, 0}, {4, 0}, {4, 1}, {4, 2},
        {4, 3}, {4, 4}, {3, 4}, {2, 4},
        {1, 4}, {0, 4}, {0, 3}, {0, 2},
      ])
      assert MapSet.difference(tile_floor.corners, expected) == MapSet.new()
      #assert tile_floor.corners == expected
    end

  end
end
