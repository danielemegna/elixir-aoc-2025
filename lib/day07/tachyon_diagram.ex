alias Day07.BeamState
alias Day07.BeamStateV2

defmodule Day07.TachyonDiagram do

  def init_beam_state_from(line) do
    [_, {starting_x, _}] = Regex.run(~r/\.+(S)\.+/, line, return: :index)
    %BeamStateV2{beams: %{starting_x => 1}, splits: 0}
  end

  def consume_stream(%BeamStateV2{} = beam_state, stream) do
    stream
    |> Enum.reduce(beam_state, fn line, beam_state ->
      consume(line, beam_state)
    end)
  end

  def consume(line, %BeamStateV2{} = beam_state) do
    splitters = Regex.scan(~r/\^/, line, return: :index)
    |> Enum.map(fn [{splitter_x, _}] -> splitter_x end)

    beam_state.beams
    |> Enum.reduce(
      %BeamStateV2{beams: %{}, splits: beam_state.splits},
      fn {beam_position, beam_count}, %BeamStateV2{} = new_beam_state ->
          if Enum.member?(splitters, beam_position) do
            new_beam_state
            |> BeamStateV2.put(beam_position-1, beam_count)
            |> BeamStateV2.put(beam_position+1, beam_count)
            |> BeamStateV2.increase_splits()
          else
            BeamStateV2.put(new_beam_state, beam_position, beam_count)
          end
      end
    )
  end

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
