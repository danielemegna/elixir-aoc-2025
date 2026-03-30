alias Day07.BeamState

defmodule Day07.TachyonDiagram do

  def init_beam_state_from(line) do
    [_, {starting_x, _}] = Regex.run(~r/\.+(S)\.+/, line, return: :index)
    %BeamState{beams: %{starting_x => 1}, splits: 0}
  end

  def consume_stream(%BeamState{} = beam_state, stream) do
    stream
    |> Enum.reduce(beam_state, fn line, beam_state ->
      consume(beam_state, line)
    end)
  end

  def consume(%BeamState{} = beam_state, line) do
    splitters = Regex.scan(~r/\^/, line, return: :index)
    |> Enum.map(fn [{splitter_x, _}] -> splitter_x end)

    beam_state.beams
    |> Enum.reduce(
      %BeamState{beams: %{}, splits: beam_state.splits},
      fn {beam_position, beam_count}, %BeamState{} = new_beam_state ->
          if Enum.member?(splitters, beam_position) do
            new_beam_state
            |> BeamState.add_beam(beam_position-1, beam_count)
            |> BeamState.add_beam(beam_position+1, beam_count)
            |> BeamState.increase_splits()
          else
            BeamState.add_beam(new_beam_state, beam_position, beam_count)
          end
      end
    )
  end

end
