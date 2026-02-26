alias Day04.RoomMapParser
alias Day04.MainTest

defmodule Day04.RoomMapParserTest do
  use ExUnit.Case

  test "parse provided example map" do
    parsed = RoomMapParser.parse(MainTest.provided_example_input_stream())
    assert parsed |> Map.keys() |> Enum.count() == 10
    assert parsed[0] |> Map.keys() |> Enum.count() == 10
    assert parsed[0][0] == :empty
    assert parsed[0][2] == :paper_roll
    assert parsed[1][0] == :paper_roll
    assert parsed[1][3] == :empty
    assert parsed[9][0] == :paper_roll
    assert parsed[9][9] == :empty
    assert parsed[-1][0] == nil
    assert parsed[0][-10] == nil
    assert parsed[42][12] == nil
  end

end
