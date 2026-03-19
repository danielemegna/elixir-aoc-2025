alias Day07.TachyonDiagram
alias Day07.BeamState

defmodule Day07.TachyonDiagramTest do
  use ExUnit.Case

  test "consume starting point line should produce the single beam" do
    assert TachyonDiagram.consume("...S...", %BeamState{}) == %BeamState{positions: [3], splits: 0}
    assert TachyonDiagram.consume(".......S.......", %BeamState{}) == %BeamState{positions: [7], splits: 0}
    assert TachyonDiagram.consume("...........S...........", %BeamState{}) == %BeamState{positions: [11], splits: 0}
  end

  test "consume splitter line should not change beams if no beam match any splitter" do
    assert TachyonDiagram.consume(
      "......^......", %BeamState{positions: [2], splits: 0}
    ) == %BeamState{positions: [2], splits: 0}
    assert TachyonDiagram.consume(
      "....^.^.^....", %BeamState{positions: [1, 3], splits: 1}
    ) == %BeamState{positions: [1, 3], splits: 1}
    assert TachyonDiagram.consume(
      "....^.^...^....", %BeamState{positions: [5], splits: 0}
    ) == %BeamState{positions: [5], splits: 0}
    assert TachyonDiagram.consume(
      "....^.^...^....", %BeamState{positions: [5, 8, 12], splits: 2}
    ) == %BeamState{positions: [5, 8, 12], splits: 2}
  end

  @tag :skip
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
