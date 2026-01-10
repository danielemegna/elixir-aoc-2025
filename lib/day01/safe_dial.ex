alias Day01.SafeDial

defmodule Day01.SafeDial do
  defstruct pointing: 50

  def turn(safe_dial = %SafeDial{}, {direction, distance}) do
    distance_rem = rem(distance, 100)

    new_pointing =
      case direction do
        :right -> rem(safe_dial.pointing + distance_rem, 100)
        :left -> rem(safe_dial.pointing + 100 - distance_rem, 100)
      end

    %{safe_dial | pointing: new_pointing}
  end
end
