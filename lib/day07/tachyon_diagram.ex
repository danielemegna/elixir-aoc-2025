alias Day07.BeamState

defmodule Day07.TachyonDiagram do

  def consume(line, %BeamState{positions: []}) do
    [_, {starting_x, _}] = Regex.run(~r/\.+(S)\.+/, line, return: :index)
    %BeamState{positions: [starting_x], splits: 0}
  end

  def consume(line, beam_state) do
    splitters =
      Regex.scan(~r/\^/, line, return: :index)
      |> Enum.map(fn [{splitter_x, _}] -> splitter_x end)

    new_positions = beam_state.positions
    |> Enum.flat_map(fn beam ->
      case Enum.member?(splitters, beam) do
        true -> [beam - 1, beam + 1]
        false -> [beam]
      end
    end)

    %BeamState{beam_state | positions: new_positions}
  end

end
