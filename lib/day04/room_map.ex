defmodule Day04.RoomMap do

  def new(args \\ %{}), do: Map.new(args)

  def get_removable(map) do
    map
    |> Enum.flat_map(fn {y, map_row} ->
      map_row
      |> Enum.map(fn {x, value} -> {{x, y}, value} end)
      |> Enum.filter(fn {coordinates, value} ->
        case value do
          :empty -> false
          :paper_roll -> adjacent_paper_rolls_in(map, coordinates) < 4
        end
      end)
      |> Enum.map(fn {coordinates, _value} -> coordinates end)
    end)
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
