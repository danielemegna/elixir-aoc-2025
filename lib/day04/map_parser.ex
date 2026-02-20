defmodule Day04.MapParser do

  def parse(map_lines_stream) do
    map_lines_stream
    |> Enum.with_index(fn line, y_index -> {y_index, parse_map_line(line)} end)
    |> Map.new()
  end

  defp parse_map_line(map_line) do
    map_line
    |> String.graphemes()
    |> Enum.with_index(fn value, x_index -> {x_index, coordinate_value(value)} end)
    |> Map.new()
  end

  defp coordinate_value("."), do: :empty
  defp coordinate_value("@"), do: :paper_roll

end
