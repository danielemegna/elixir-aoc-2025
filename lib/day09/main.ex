alias Day09.TileFloor

defmodule Day09.Main do

  def largest_red_tiles_rectangle_with(file_lines_stream) do
    file_lines_stream
    |> parse_red_tiles_locations()
    |> largest_rectangle_area_for()
  end

  def largest_red_green_tiles_rectangle_with(file_lines_stream) do
    red_tiles = file_lines_stream
    |> parse_red_tiles_locations()

    tile_floor = TileFloor.new(red_tiles)
    largest_red_green_rectangle_area_for(tile_floor)
  end

  defp largest_rectangle_area_for(locations, current_max \\ 0)
  defp largest_rectangle_area_for([_ | []], current_max), do: current_max

  defp largest_rectangle_area_for([first_location | other_locations], current_max) do
    this_max = other_locations
      |> Enum.map(fn other -> rectangle_area_with(first_location, other) end)
      |> Enum.max()

    largest_rectangle_area_for(other_locations, max(this_max, current_max))
  end

  defp largest_red_green_rectangle_area_for(tile_floor) do
    largest_red_green_rectangle_area_for(tile_floor.red_tiles, 0, tile_floor)
  end

  defp largest_red_green_rectangle_area_for([_ | []], current_max, _tile_floor), do: current_max
  defp largest_red_green_rectangle_area_for([first_location | other_locations], current_max, tile_floor) do
    this_max = other_locations
      |> Enum.filter(fn other -> is_a_colorful_rectangle(first_location, other, tile_floor) end)
      |> Enum.map(fn other -> rectangle_area_with(first_location, other) end)
      |> Enum.max(&>=/2, fn -> 0 end)

    largest_red_green_rectangle_area_for(other_locations, max(this_max, current_max), tile_floor)
  end

  defp is_a_colorful_rectangle({x1, y1}, {x2, y2}, tile_floor) do
    is_colorful = x1..x2
    |> Range.to_list()
    |> Kernel.tl()
    |> Enum.drop(-1)
    |> Enum.all?(fn x ->
      is_colorful_tile(tile_floor, {x, y1}) &&
        is_colorful_tile(tile_floor, {x, y2})
    end)

    is_colorful = is_colorful && y1..y2
    |> Range.to_list()
    |> Kernel.tl()
    |> Enum.drop(-1)
    |> Enum.all?(fn y ->
      is_colorful_tile(tile_floor, {x1, y}) &&
        is_colorful_tile(tile_floor, {x2, y})
    end)

    is_colorful
  end

  defp is_colorful_tile(%TileFloor{} = floor, coordinates) do
    TileFloor.is_on_borders(floor, coordinates) ||
        TileFloor.is_inside_borders(floor, coordinates)
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
