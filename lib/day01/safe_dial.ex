alias Day01.SafeDial

defmodule Day01.SafeDial do
  defstruct pointing: 50

  def turn(safe_dial = %SafeDial{}, rotation) do
    {updated_safe_dial, _zero_clicks} = turn_getting_zero_clicks(safe_dial, rotation)
    updated_safe_dial
  end

  def turn_getting_zero_clicks(safe_dial = %SafeDial{}, {direction, distance}) do
    new_pointing =
      case direction do
        :right -> rem(safe_dial.pointing + distance, 100)
        :left -> rem(safe_dial.pointing + 100 - distance, 100)
      end

    zero_clicks =
      case direction do
        :right -> div(safe_dial.pointing + distance, 100)
        :left -> 0
      end

    updated_safe_dial = %{safe_dial | pointing: new_pointing}
    {updated_safe_dial, zero_clicks}
  end
end
