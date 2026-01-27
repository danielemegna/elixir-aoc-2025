alias Day02.IDsRange

defmodule Day02.Main do
  def invalid_ids_sum(file_lines_stream) do
    line = file_lines_stream |> Enum.at(0)
    ranges = parse_line_of_ranges(line)

    ranges
    |> Enum.flat_map(&IDsRange.invalid_in(&1))
    |> Enum.sum()
  end

  def invalid_ids_sum_including_more_repeating(file_lines_stream) do
    line = file_lines_stream |> Enum.at(0)
    _ranges = parse_line_of_ranges(line)

    4_174_379_265
  end

  defp parse_line_of_ranges(line) do
    line
    |> String.split(",")
    |> Enum.map(fn raw_range ->
      [from, to] = String.split(raw_range, "-")
      {String.to_integer(from), String.to_integer(to)}
    end)
  end
end
