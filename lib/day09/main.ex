defmodule Day09.Main do

  def largest_red_tiles_rectangle_with(file_lines_stream) do
    file_lines_stream
    |> parse_red_tiles_locations()
    |> largest_rectangle_area_for()
  end

  defp largest_rectangle_area_for(locations, current_max \\ 0)
  defp largest_rectangle_area_for([_ | []], current_max), do: current_max

  defp largest_rectangle_area_for([first_location | other_locations], current_max) do
    this_max = other_locations
      |> Enum.map(fn other -> rectangle_area_with(first_location, other) end)
      |> Enum.max()

    largest_rectangle_area_for(other_locations, max(this_max, current_max))
  end

  defp rectangle_area_with({x1, y1}, {x2, y2}) do
    (abs(x1 - x2) + 1) * (abs(y1 - y2) + 1)
  end

  defp parse_red_tiles_locations(file_lines_stream) do
    file_lines_stream
    |> Enum.map(fn str ->
      str
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
    end)
  end

end
