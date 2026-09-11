defmodule Day09.TileFloor do

  def new(red_tiles), do: red_tiles

  def is_colorful(red_tiles, subject) do
    Enum.member?(red_tiles, subject)
  end

end
