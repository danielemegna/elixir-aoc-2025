alias Day04.MapParser
alias Day04.RoomMap

defmodule Day04.Main do

  def accessible_rolls_of_paper_in(map_lines_stream) do
    map_lines_stream
    |> MapParser.parse()
    |> RoomMap.get_removable()
    |> Enum.count()
  end

  def total_removable_rolls_of_paper_in(map_lines_stream) do
    parsed_map = MapParser.parse(map_lines_stream)
    calc_total_removable_rolls_of_paper(parsed_map)
  end

  defp calc_total_removable_rolls_of_paper(room_map, counter \\ 0) do
    removable_coordinates = RoomMap.get_removable(room_map)
    removable_coordinates_count = Enum.count(removable_coordinates)
    if removable_coordinates_count == 0 do
      counter
    else
      new_map = Enum.reduce(removable_coordinates, room_map, fn coordinate, room_map ->
        RoomMap.remove_paper_roll(room_map, coordinate)
      end)
      calc_total_removable_rolls_of_paper(new_map, counter + removable_coordinates_count)
    end
  end

end
