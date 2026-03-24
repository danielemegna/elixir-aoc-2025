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
    [first_line | rest] = Enum.take_every(file_lines_stream, 2)
    [_, {starting_x, _}] = Regex.run(~r/\.+(S)\.+/, first_line, return: :index)
    different_timelines_with(starting_x, rest)
  end

  defp different_timelines_with(beam_position, [line | rest]) do
    splitters =
      Regex.scan(~r/\^/, line, return: :index)
      |> Enum.map(fn [{splitter_x, _}] -> splitter_x end)

    if Enum.member?(splitters, beam_position) do
      different_timelines_with(beam_position + 1, rest) +
        different_timelines_with(beam_position - 1, rest)
    else
      different_timelines_with(beam_position, rest)
    end
  end

  defp different_timelines_with(_beam_position, []), do: 1

end
