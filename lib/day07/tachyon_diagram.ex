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

    {new_positions, additional_splits} =
      beam_state.positions
      |> Enum.reduce(
        {MapSet.new(), 0},
        fn beam_position, {positions, splits} ->
          if Enum.member?(splitters, beam_position) do
            updated_positions = positions |> MapSet.put(beam_position - 1) |> MapSet.put(beam_position + 1)
            {updated_positions, splits + 1}
          else
            {MapSet.put(positions, beam_position), splits}
          end
        end
      )

    %BeamState{
      positions: MapSet.to_list(new_positions),
      splits: beam_state.splits + additional_splits
    }
  end

end
