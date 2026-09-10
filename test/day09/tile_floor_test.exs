alias Day09.TileFloor

defmodule Day09.TileFloorTest do
  use ExUnit.Case

  describe "build and check color" do

    test "non-green tile" do
      tile_floor = TileFloor.new([
        {7, 1}, {11, 1}, {11, 7}, {9, 7},
        {9, 5}, {2, 5}, {2, 3}, {7, 3}
      ])
      assert TileFloor.is_green(tile_floor, {0,0}) == false
    end

  end

end
