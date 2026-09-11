alias Day09.TileFloor

defmodule Day09.TileFloorTest do
  use ExUnit.Case

  describe "build and check colorful tiles" do
    @tile_floor TileFloor.new([
      {7, 1}, {11, 1}, {11, 7}, {9, 7},
      {9, 5}, {2, 5}, {2, 3}, {7, 3}
    ])

    test "non-colorful tiles" do
      assert TileFloor.is_colorful(@tile_floor, {0, 0}) == false
      assert TileFloor.is_colorful(@tile_floor, {1, 2}) == false
      assert TileFloor.is_colorful(@tile_floor, {12, 9}) == false
    end

    test "red tiles on border" do
      assert TileFloor.is_colorful(@tile_floor, {7, 1}) == true
      assert TileFloor.is_colorful(@tile_floor, {11, 1}) == true
      assert TileFloor.is_colorful(@tile_floor, {2, 3}) == true
      assert TileFloor.is_colorful(@tile_floor, {7, 3}) == true
    end

    test "green tile" do
      #assert TileFloor.is_colorful(@tile_floor, {9, 1}) == true
      assert TileFloor.is_colorful(@tile_floor, {11, 2}) == true
    end

  end

end
