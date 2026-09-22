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

  def is_on_borders(%TileFloor{} = floor, subject) do
    Enum.member?(floor.red_tiles, subject) ||
      Enum.member?(floor.green_tiles, subject)
  end

  def is_inside_borders(%TileFloor{} = floor, {x, y}) do
    Enum.reduce(0..y, false, fn current_y, is_inside ->
      if(is_on_borders(floor, {x, current_y})) do
        !is_inside
      else
        is_inside
      end
    end)
  end

  defp tiles_between({x, y1}, {x, y2}) do
    cond do
      y1 < y2 -> Enum.map(y1+1..y2-1, fn y -> {x, y} end)
      y1 > y2 -> Enum.map(y2+1..y1-1, fn y -> {x, y} end)
    end
  end

  defp tiles_between({x1, y}, {x2, y}) do
    cond do
      x1 < x2 -> Enum.map(x1+1..x2-1, fn x -> {x, y} end)
      x1 > x2 -> Enum.map(x2+1..x1-1, fn x -> {x, y} end)
    end
  end

end
