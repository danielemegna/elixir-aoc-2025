alias Day01.SafeDial

defmodule Day01.SafeDial do
  defstruct pointing: 50

  def turn(safe_dial = %SafeDial{pointing: p}, {:right, distance}) do
    new_pointing = rem(p + distance, 100)
    %{safe_dial | pointing: new_pointing}
  end

  def turn(safe_dial = %SafeDial{pointing: p}, {:left, distance}) do
    new_pointing = rem(p - rem(distance, 100) + 100, 100)
    %{safe_dial | pointing: new_pointing}
  end
end
