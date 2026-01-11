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

        case safe_dial.pointing do
          0 -> {zeros_counter + 1, safe_dial}
          _ -> {zeros_counter, safe_dial}
        end
      end)

    zeros_counter
  end

  def find_password_with_click_method_for(file_lines_stream) do
    rotations =
      file_lines_stream
      |> Enum.map(fn line -> Rotation.parse(line) end)

    {zeros_counter, _final_safe_dial} =
      Enum.reduce(rotations, {0, %SafeDial{}}, fn rotation, {total_zero_clicks, safe_dial} ->
        {safe_dial, zero_clicks} = SafeDial.turn_getting_zero_clicks(safe_dial, rotation)
        {total_zero_clicks + zero_clicks, safe_dial}
      end)

    zeros_counter
  end
end
