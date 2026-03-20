alias Day07.BeamState

defmodule Day07.TachyonDiagram do

  def consume(line, %BeamState{positions: []}) do
    [_, {starting_x, _}] = Regex.run(~r/\.+(S)\.+/, line, return: :index)
    %BeamState{positions: [starting_x], splits: 0}
  end

  def consume(line, %BeamState{} = beam_state) do
    splitters =
      Regex.scan(~r/\^/, line, return: :index)
      |> Enum.map(fn [{splitter_x, _}] -> splitter_x end)

    beam_state.positions
    |> Enum.reduce(
      %BeamState{beam_state | positions: []},
      fn beam_position, %BeamState{} = new_state ->
        case Enum.member?(splitters, beam_position) do
          true -> %BeamState{
            positions: new_state.positions ++ [beam_position - 1, beam_position + 1],
            splits: new_state.splits + 1
          }
          false -> %BeamState{new_state | positions: new_state.positions ++ [beam_position]}
        end
      end)
  end

end
