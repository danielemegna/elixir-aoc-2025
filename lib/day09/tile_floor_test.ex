alias Day09.TileFloor

defmodule Day09.TileFloor do
  @enforce_keys [:red_tiles, :green_tiles]
  defstruct @enforce_keys

  def new(red_tiles) do
    green_tiles = red_tiles
    |> Enum.zip(tl(red_tiles))
    |> Enum.reduce([], fn {current, next}, green_tiles ->
      green_tiles_to_add = tiles_between(current, next)
      Enum.concat(green_tiles, green_tiles_to_add)
    end)

    %TileFloor{ red_tiles: red_tiles, green_tiles: green_tiles }
  end

  def is_colorful(%TileFloor{} = floor, subject) do
    Enum.member?(floor.red_tiles, subject) ||
      Enum.member?(floor.green_tiles, subject)
  end

  defp tiles_between({x, y1}, {x, y2}) do
    cond do
      y1 < y2 -> Enum.map(y1+1..y2-1, fn y -> {x, y} end)
      y1 > y2 -> [{x, y1-1}]
    end
  end

  defp tiles_between({x1, y}, {x2, y}) do
    []
  end

end
