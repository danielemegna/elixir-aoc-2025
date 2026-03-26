alias Day07.BeamState
alias Day07.TachyonDiagram

defmodule Day07.Main do

  def beam_split_count(file_lines_stream) do
    final_state = file_lines_stream
    |> Enum.take_every(2)
    |> Enum.reduce(%BeamState{}, fn line, beam_state ->
      TachyonDiagram.consume(line, beam_state)
    end)

    final_state.splits
  end

  def different_timelines_count(file_lines_stream) do
    first_line = file_lines_stream
    |> Stream.take(1)
    |> Enum.at(0)

    splitters_lines = file_lines_stream
    |> Stream.drop(2)
    |> Stream.take_every(2)

    initial_state = TachyonDiagram.init_beam_state_from(first_line)
    final_state = splitters_lines
    |> Enum.reduce(initial_state, fn line, beam_state ->
      TachyonDiagram.consume(line, beam_state)
    end)

    final_state.beams |> Map.values() |> Enum.sum()
  end

end
