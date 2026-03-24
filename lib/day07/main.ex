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

  def different_timelines_count(_file_lines_stream) do
    40
  end

end
