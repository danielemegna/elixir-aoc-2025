alias Day07.TachyonDiagram
alias Day07.BeamStateV2

defmodule Day07.TachyonDiagramTest do
  use ExUnit.Case

  test "init beam state from starting point line" do
    assert TachyonDiagram.init_beam_state_from("...S...") == %BeamStateV2{beams: %{3 => 1}, splits: 0}
    assert TachyonDiagram.init_beam_state_from(".......S.......") == %BeamStateV2{beams: %{7 => 1}, splits: 0}
    assert TachyonDiagram.init_beam_state_from("...........S...........") == %BeamStateV2{beams: %{11 => 1}, splits: 0}
  end

  test "consume splitter line should not change beams if no beam match any splitter" do
    assert TachyonDiagram.consume(
      "......^......",
      %BeamStateV2{beams: %{2 => 1}, splits: 0}
    ) == %BeamStateV2{beams: %{2 => 1}, splits: 0}
    assert TachyonDiagram.consume(
      "....^.^.^....",
       %BeamStateV2{beams: %{1 => 2, 3 => 1}, splits: 1}
    ) == %BeamStateV2{beams: %{1 => 2, 3 => 1}, splits: 1}
    assert TachyonDiagram.consume(
      "....^.^...^....",
      %BeamStateV2{beams: %{5 => 3}, splits: 0}
    ) == %BeamStateV2{beams: %{5 => 3}, splits: 0}
    assert TachyonDiagram.consume(
      "....^.^...^....",
      %BeamStateV2{beams: %{5 => 1, 8 => 2, 12 => 1}, splits: 2}
    ) == %BeamStateV2{beams: %{5 => 1, 8 => 2, 12 => 1}, splits: 2}
  end

  test "consume splitter line should produce new beams if a beam match a splitter" do
    assert TachyonDiagram.consume(
      "......^......",
      %BeamStateV2{beams: %{6 => 1}, splits: 0}
    ) == %BeamStateV2{beams: %{5 => 1, 7 => 1}, splits: 0 + 1}

    assert TachyonDiagram.consume(
      "......^......",
      %BeamStateV2{beams: %{6 => 3}, splits: 0}
    ) == %BeamStateV2{beams: %{5 => 3, 7 => 3}, splits: 0 + 1}

    assert TachyonDiagram.consume(
      "....^.^.^....",
      %BeamStateV2{beams: %{4 => 1, 7 => 3}, splits: 1}
    ) == %BeamStateV2{beams: %{3 => 1, 5 => 1, 7 => 3}, splits: 1 + 1}

    assert TachyonDiagram.consume(
      "..^...^.....^..",
      %BeamStateV2{beams: %{2 => 2, 6 => 1, 12 => 3}, splits: 2}
    ) == %BeamStateV2{beams: %{1 => 2, 3 => 2, 5 => 1, 7 => 1, 11 => 3, 13 => 3}, splits: 2 + 3}
  end

  test "beams on same position should sum the value and not be duplicated" do
    assert TachyonDiagram.consume(
      "...^.^.^...",
      %BeamStateV2{beams: %{3 => 1, 5 => 1, 10 => 1}, splits: 2}
    ) == %BeamStateV2{beams: %{2 => 1, 4 => (1 + 1), 6 => 1, 10 => 1}, splits: 2 + 2}

    assert TachyonDiagram.consume(
      "...^.^.^...",
      %BeamStateV2{beams: %{5 => 2, 6 => 3}, splits: 1}
    ) == %BeamStateV2{beams: %{4 => 2, 6 => (2 + 3)}, splits: 1 + 1}

    assert TachyonDiagram.consume(
      ".^.^.^.^.^...^.",
      %BeamStateV2{beams: %{1 => 1, 3 => 1, 4 => 1, 5 => 1, 7 => 1, 8 => 1, 10 => 1, 11 => 1, 13 => 1}, splits: 5}
    ) == %BeamStateV2{beams: %{0 => 1, 2 => 2, 4 => 3, 6 => 2, 8 => 2, 10 => 1, 11 => 1, 12 => 1, 14 => 1}, splits: 5 + 5}
  end

end
