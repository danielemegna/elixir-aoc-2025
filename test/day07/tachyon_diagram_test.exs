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
    assert TachyonDiagram.consume("......^......", state([2], 0)) == state([2], 0)
    assert TachyonDiagram.consume("....^.^.^....", state([1, 3], 1)) == state([1, 3], 1)
    assert TachyonDiagram.consume("....^.^...^....", state([5], 0)) == state([5], 0)
    assert TachyonDiagram.consume("....^.^...^....", state([5, 8, 12], 2)) == state([5, 8, 12], 2)
  end

  test "consume splitter line should produce new beams if a beam match a splitter" do
    assert TachyonDiagram.consume("......^......", state([6], 0)) == state([5, 7], 0 + 1)
    assert TachyonDiagram.consume("....^.^.^....", state([4, 7], 1)) == state([3, 5, 7], 1 + 1)
    assert TachyonDiagram.consume("..^...^.....^..", state([2, 6, 12], 2)) == state([1, 3, 5, 7, 11, 13], 2 + 3)
  end

  @tag :skip
  test "beams on same position should not be duplicated" do
    # .. some easier example
    assert TachyonDiagram.consume(".^.^.^.^.^...^.", [1, 3, 4, 5, 7, 8, 10, 11, 13]) == [0, 2, 4, 6, 8, 10, 11, 12, 14]
  end

  defp state(positions, splits), do: %BeamState{positions: positions, splits: splits}

end
