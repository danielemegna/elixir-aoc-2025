defmodule SafeDial do
  defstruct pointing: 50

  def turn(safe_dial = %SafeDial{pointing: p}, {:right, distance}) do
    new_pointing = rem(p + distance, 100)
    %{safe_dial | pointing: new_pointing}
  end

  def turn(safe_dial = %SafeDial{pointing: p}, {:left, distance}) when p < distance do
    new_pointing = p - distance + 100
    %{safe_dial | pointing: new_pointing}
  end

  def turn(safe_dial = %SafeDial{pointing: p}, {:left, distance}) do
    new_pointing = p - distance
    %{safe_dial | pointing: new_pointing}
  end
end
