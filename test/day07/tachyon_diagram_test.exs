alias Day07.TachyonDiagram

defmodule Day07.TachyonDiagramTest do
  use ExUnit.Case

  test "consume starting point line should produce the single beam" do
    assert TachyonDiagram.consume("...S...", []) == [3]
    assert TachyonDiagram.consume(".......S.......", []) == [7]
    assert TachyonDiagram.consume("...........S...........", []) == [11]
  end

  test "consume splitter line should not change beams if no beam match any splitter" do
    assert TachyonDiagram.consume("......^......", [2]) == [2]
    assert TachyonDiagram.consume("....^.^.^....", [1, 3]) == [1, 3]
    assert TachyonDiagram.consume("....^.^...^....", [5]) == [5]
    assert TachyonDiagram.consume("....^.^...^....", [5, 8, 12]) == [5, 8, 12]
  end

  test "consume splitter line should produce new beams if a beam match a splitter" do
    assert TachyonDiagram.consume("......^......", [6]) == [5, 7]
    assert TachyonDiagram.consume("....^.^.^....", [4, 7]) == [3, 5, 7]
    assert TachyonDiagram.consume("..^...^.....^..", [2, 6, 12]) == [1, 3, 5, 7, 11, 13]
  end

  @tag :skip
  test "beams on same position should not be duplicated" do
    # .. some easier example
    assert TachyonDiagram.consume(".^.^.^.^.^...^.", [1, 3, 4, 5, 7, 8, 10, 11, 13]) == [0, 2, 4, 6, 8, 10, 11, 12, 14]
  end

end
