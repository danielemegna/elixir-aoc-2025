alias Day01.SafeDial

defmodule Day01.SafeDialTest do
  use ExUnit.Case

  test "new safedeal point to 50" do
    safe_dial = %SafeDial{}
    assert safe_dial.pointing == 50
  end

  test "handle right turn" do
    safe_dial = %SafeDial{}

    updated_safe_dial = SafeDial.turn(safe_dial, {:right, 10})

    assert updated_safe_dial.pointing == 50 + 10
    assert safe_dial.pointing == 50
  end

  test "handle more right turn" do
    safe_dial =
      %SafeDial{}
      |> SafeDial.turn({:right, 15})
      |> SafeDial.turn({:right, 5})

    assert safe_dial.pointing == 50 + 15 + 5
  end

  test "handle left turn" do
    safe_dial = %SafeDial{}

    updated_safe_dial = SafeDial.turn(safe_dial, {:left, 20})

    assert updated_safe_dial.pointing == 50 - 20
    assert safe_dial.pointing == 50
  end

  test "right turn after 99 goes back to zero" do
    safe_dial = %SafeDial{pointing: 90}

    updated_safe_dial = SafeDial.turn(safe_dial, {:right, 10})

    assert updated_safe_dial.pointing == 0
  end

  test "handle more right turn over 99" do
    safe_dial =
      %SafeDial{}
      |> SafeDial.turn({:right, 40})
      |> SafeDial.turn({:right, 25})
      |> SafeDial.turn({:right, 20})

    assert safe_dial.pointing == 35
  end

  test "left turn after 0 goes back to 99" do
    safe_dial = %SafeDial{pointing: 10}

    updated_safe_dial = SafeDial.turn(safe_dial, {:left, 11})

    assert updated_safe_dial.pointing == 99
  end

  test "handle more left turn under 0" do
    safe_dial =
      %SafeDial{}
      |> SafeDial.turn({:left, 40})
      |> SafeDial.turn({:left, 15})
      |> SafeDial.turn({:left, 25})

    assert safe_dial.pointing == 70
  end
end
