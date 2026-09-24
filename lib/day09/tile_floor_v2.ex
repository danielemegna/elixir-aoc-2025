alias Day09.TileFloorV2

defmodule Day09.TileFloorV2 do
  @enforce_keys [:red_tiles, :corners]
  defstruct @enforce_keys

  def new(red_tiles) do
    [first_red_tile | red_tiles_tail] = red_tiles

    {green_tiles_on_borders, corners} = red_tiles
    |> Enum.zip(red_tiles_tail ++ [first_red_tile])
    |> Enum.reduce(
      {MapSet.new(), MapSet.new()},
      fn {current = {x1, y1}, next}, {green_tiles_on_borders, corners} ->
      new_corners = MapSet.new([
          {x1-1, y1},
          {x1-1, y1-1},
          {x1, y1-1},
          {x1+1, y1-1},
          {x1+1, y1},
          {x1+1, y1+1},
          {x1, y1+1},
          {x1-1, y1+1},
      ])

      new_green_tiles_on_borders = tiles_between(current, next)

     {
      green_tiles_on_borders |> MapSet.union(MapSet.new(new_green_tiles_on_borders)),
      corners |> MapSet.union(new_corners)
     }
    end)

    corners = MapSet.difference(corners, green_tiles_on_borders)
    %TileFloorV2{ red_tiles: red_tiles, corners: corners }
  end

  #defp direction_for({x1, y}, {x2, y}) when x2 > x1, do: :east
  #defp direction_for({_x1, y}, {_x2, y}), do: :west
  #defp direction_for({x, y1}, {x, y2}) when y2 > y1, do: :south
  #defp direction_for({x, _y1}, {x, _y2}), do: :north

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
