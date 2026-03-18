defmodule Day07.TachyonDiagram do

  def consume(line, []) do
    [_, {starting_x, _}] = Regex.run(~r/\.+(S)\.+/, line, return: :index)
    [starting_x]
  end

  def consume(line, already_present_beams) do
    splitters =
      Regex.scan(~r/\^/, line, return: :index)
      |> Enum.map(fn [{splitter_x, _}] -> splitter_x end)

    already_present_beams
    |> Enum.flat_map(fn beam ->
      case Enum.member?(splitters, beam) do
        true -> [beam - 1, beam + 1]
        false -> [beam]
      end
    end)
  end

end
