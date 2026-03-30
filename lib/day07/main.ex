alias Day07.TachyonDiagram

defmodule Day07.Main do

  def beam_split_count(file_lines_stream) do
    final_state = consume(file_lines_stream)
    final_state.splits
  end

  def different_timelines_count(file_lines_stream) do
    final_state = consume(file_lines_stream)
    final_state.beams |> Map.values() |> Enum.sum()
  end

  defp consume(file_lines_stream) do
    {first_line, splitters_lines} = split_input_file_lines(file_lines_stream)
    initial_state = TachyonDiagram.init_beam_state_from(first_line)
    TachyonDiagram.consume_stream(initial_state, splitters_lines)
  end

  defp split_input_file_lines(file_lines_stream) do
    first_line = file_lines_stream
    |> Stream.take(1)
    |> Enum.at(0)

    splitters_lines = file_lines_stream
    |> Stream.drop(2)
    |> Stream.take_every(2)

    {first_line, splitters_lines}
  end

end
