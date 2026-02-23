alias Day04.MainTest
alias Day04.MapParser
alias Day04.RoomMap

defmodule Day04.RoomMapTest do
  use ExUnit.Case

  describe "get coordinates of removable paper rolls" do

    test "of empty map" do
      room_map = RoomMap.new()
      actual = RoomMap.get_removable(room_map)
      assert actual == []
    end

    test "of 3x3 map with one removable" do
      room_map = RoomMap.new(%{
        0 => %{0 => :empty, 1 => :empty, 2 => :empty},
        1 => %{0 => :empty, 1 => :empty, 2 => :paper_roll},
        2 => %{0 => :empty, 1 => :empty, 2 => :empty}
      })

      actual = RoomMap.get_removable(room_map)
      assert actual == [{2, 1}]
    end

    test "of provided example parsed map" do
      room_map = MapParser.parse(MainTest.provided_example_input_stream())

      actual = RoomMap.get_removable(room_map)

      assert {2, 0} in actual
      assert {3, 0} in actual
      assert {0, 1} in actual
      assert {6, 2} in actual
      assert {0, 7} in actual
      refute {0, 0} in actual
      refute {7, 0} in actual
      refute {1, 1} in actual
      refute {1, 2} in actual
      refute {1, 7} in actual
      refute {2, 7} in actual
    end

  end

end
