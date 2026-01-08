defmodule Day01.Main do
  alias Day01.SafeDial
  alias Day01.Rotation

  def find_password_for(file_lines_stream) do
    rotations =
      file_lines_stream
      |> Enum.map(fn line -> Rotation.parse(line) end)

    {zeros_counter, _final_safe_dial} =
      Enum.reduce(rotations, {0, %SafeDial{}}, fn rotation, {zeros_counter, safe_dial} ->
        safe_dial = SafeDial.turn(safe_dial, rotation)
        zeros_counter = if safe_dial.pointing == 0, do: zeros_counter + 1, else: zeros_counter
        {zeros_counter, safe_dial}
      end)

    zeros_counter
  end
end
