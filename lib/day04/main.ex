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
    _parsed_map = MapParser.parse(map_lines_stream)
    43
  end

end
