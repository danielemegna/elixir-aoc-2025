alias Day04.MapParser

defmodule Day04.Main do

  def accessible_rolls_of_paper_in(map_lines_stream) do
    _parsed_map = MapParser.parse(map_lines_stream)
    13
  end

end
