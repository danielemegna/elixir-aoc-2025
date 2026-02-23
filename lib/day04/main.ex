alias Day04.MapParser

defmodule Day04.Main do

  def accessible_rolls_of_paper_in(map_lines_stream) do
    parsed_map = MapParser.parse(map_lines_stream)

    parsed_map
    |> Enum.flat_map(fn {y, map_row} ->
      map_row
      |> Enum.map(fn {x, value} ->
        case value do
          :empty -> false
          :paper_roll -> adjacent_paper_rolls_in(parsed_map, {x, y}) < 4
        end
      end)
    end)
    |> Enum.count(fn value -> value end)
  end

  def total_removable_rolls_of_paper_in(map_lines_stream) do
    _parsed_map = MapParser.parse(map_lines_stream)
    43
  end


  defp adjacent_paper_rolls_in(map, {x, y}) do
    [
      map[y-1][x-1],
      map[y-1][x],
      map[y-1][x+1],
      map[y][x-1],
      map[y][x+1],
      map[y+1][x-1],
      map[y+1][x],
      map[y+1][x+1],
    ]
    |> Enum.count(fn value -> value == :paper_roll end)
  end

end
