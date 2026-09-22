alias Day09.TileFloor

defmodule Day09.TileFloorTest do
  use ExUnit.Case

  describe "build and check colorful tiles" do
    @tile_floor TileFloor.new([
      {7, 1}, {11, 1}, {11, 7}, {9, 7},
      {9, 5}, {2, 5}, {2, 3}, {7, 3}
    ])

    test "non on borders tiles" do
      assert TileFloor.is_on_borders(@tile_floor, {0, 0}) == false
      assert TileFloor.is_on_borders(@tile_floor, {1, 2}) == false
      assert TileFloor.is_on_borders(@tile_floor, {5, 6}) == false
      assert TileFloor.is_on_borders(@tile_floor, {5, 7}) == false
      assert TileFloor.is_on_borders(@tile_floor, {12, 9}) == false
      assert TileFloor.is_on_borders(@tile_floor, {2, 6}) == false
      assert TileFloor.is_on_borders(@tile_floor, {12, 5}) == false
      assert TileFloor.is_on_borders(@tile_floor, {11, 8}) == false

      assert TileFloor.is_on_borders(@tile_floor, {9, 3}) == false
      assert TileFloor.is_on_borders(@tile_floor, {7, 4}) == false
      assert TileFloor.is_on_borders(@tile_floor, {4, 4}) == false
      assert TileFloor.is_on_borders(@tile_floor, {4, 4}) == false
      assert TileFloor.is_on_borders(@tile_floor, {10, 5}) == false
      assert TileFloor.is_on_borders(@tile_floor, {10, 6}) == false
    end

    test "non inside borders tiles" do
      assert TileFloor.is_inside_borders(@tile_floor, {0, 0}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {1, 2}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {5, 6}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {5, 7}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {12, 9}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {12, 5}) == false
    end

    test "red tiles are on borders" do
      assert TileFloor.is_on_borders(@tile_floor, {7, 1}) == true
      assert TileFloor.is_on_borders(@tile_floor, {11, 1}) == true
      assert TileFloor.is_on_borders(@tile_floor, {2, 3}) == true
      assert TileFloor.is_on_borders(@tile_floor, {7, 3}) == true
      assert TileFloor.is_on_borders(@tile_floor, {11, 7}) == true
    end

    test "green tiles on borders" do
      assert TileFloor.is_on_borders(@tile_floor, {9, 1}) == true
      assert TileFloor.is_on_borders(@tile_floor, {11, 2}) == true
      assert TileFloor.is_on_borders(@tile_floor, {11, 3}) == true
      assert TileFloor.is_on_borders(@tile_floor, {11, 4}) == true
      assert TileFloor.is_on_borders(@tile_floor, {10, 7}) == true
      assert TileFloor.is_on_borders(@tile_floor, {3, 5}) == true
      assert TileFloor.is_on_borders(@tile_floor, {4, 5}) == true
      assert TileFloor.is_on_borders(@tile_floor, {5, 5}) == true
      assert TileFloor.is_on_borders(@tile_floor, {6, 5}) == true
      assert TileFloor.is_on_borders(@tile_floor, {2, 4}) == true
      assert TileFloor.is_on_borders(@tile_floor, {7, 2}) == true
      assert TileFloor.is_on_borders(@tile_floor, {7, 3}) == true
    end

    test "green tile inside the borders" do
      assert TileFloor.is_inside_borders(@tile_floor, {9, 3}) == true
      assert TileFloor.is_inside_borders(@tile_floor, {7, 4}) == true
      assert TileFloor.is_inside_borders(@tile_floor, {4, 4}) == true
      assert TileFloor.is_inside_borders(@tile_floor, {4, 4}) == true
      assert TileFloor.is_inside_borders(@tile_floor, {10, 5}) == true
      assert TileFloor.is_inside_borders(@tile_floor, {10, 6}) == true
    end

    # TODO decide if green and red borders should be considered inside the borders
    test "tiles on borders are not inside the borders" do
      assert TileFloor.is_inside_borders(@tile_floor, {9, 1}) == true
      assert TileFloor.is_inside_borders(@tile_floor, {11, 2}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {11, 3}) == true
      assert TileFloor.is_inside_borders(@tile_floor, {11, 4}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {11, 7}) == true
      assert TileFloor.is_inside_borders(@tile_floor, {10, 7}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {3, 5}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {4, 5}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {5, 5}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {6, 5}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {2, 4}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {7, 2}) == false
      assert TileFloor.is_inside_borders(@tile_floor, {7, 3}) == true
    end

  end

end
