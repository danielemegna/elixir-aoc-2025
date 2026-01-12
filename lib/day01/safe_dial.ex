alias Day01.SafeDial

defmodule Day01.SafeDial do
  defstruct pointing: 50

  def turn(safe_dial = %SafeDial{}, rotation) do
    {new_safe_dial, _zero_clicks} = turn_getting_zero_clicks(safe_dial, rotation)
    new_safe_dial
  end

  def turn_getting_zero_clicks(safe_dial = %SafeDial{}, {:right, distance}) do
    new_pointing = safe_dial.pointing + distance
    zero_clicks = div(new_pointing, 100)
    new_pointing = rem(new_pointing, 100)

    {
      %SafeDial{safe_dial | pointing: new_pointing},
      zero_clicks
    }
  end

  def turn_getting_zero_clicks(safe_dial = %SafeDial{}, {:left, distance}) do
    mirrored = mirror(safe_dial)
    {new_mirrored, zero_clicks} = turn_getting_zero_clicks(mirrored, {:right, distance})

    {mirror(new_mirrored), zero_clicks}
  end

  defp mirror(safe_dial = %SafeDial{}) do
    %SafeDial{safe_dial | pointing: rem(100 - safe_dial.pointing, 100)}
  end
end
