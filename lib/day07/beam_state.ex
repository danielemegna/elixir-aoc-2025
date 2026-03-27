alias Day07.BeamStateV2

defmodule Day07.BeamStateV2 do
  @enforce_keys [:beams, :splits]
  defstruct @enforce_keys

  def put(%BeamStateV2{} = beam_state, position, count) do
    already_present_count = Map.get(beam_state.beams, position, 0)
    updated_beams = Map.put(beam_state.beams, position, already_present_count + count)
    %BeamStateV2{ beam_state | beams: updated_beams }
  end

  def increase_splits(%BeamStateV2{} = beam_state) do
    %BeamStateV2{ beam_state |
      splits: beam_state.splits + 1
    }
  end

end
