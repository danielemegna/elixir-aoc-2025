alias Day07.BeamState

defmodule Day07.BeamState do
  @enforce_keys [:beams, :splits]
  defstruct @enforce_keys

  def put(%BeamState{} = beam_state, position, count) do
    already_present_count = Map.get(beam_state.beams, position, 0)
    updated_beams = Map.put(beam_state.beams, position, already_present_count + count)
    %BeamState{ beam_state | beams: updated_beams }
  end

  def increase_splits(%BeamState{} = beam_state) do
    %BeamState{ beam_state |
      splits: beam_state.splits + 1
    }
  end

end
