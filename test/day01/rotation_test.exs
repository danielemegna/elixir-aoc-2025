alias Day01.Rotation

defmodule Day01.RotationTest do
  alias Day01.Rotation
  use ExUnit.Case

  test "parse a left rotation" do
    assert Rotation.parse("L13") == {:left, 13}
    assert Rotation.parse("L7") == {:left, 7}
    assert Rotation.parse("L587") == {:left, 587}
  end

  test "parse a right rotation" do
    assert Rotation.parse("R26") == {:right, 26}
    assert Rotation.parse("R9") == {:right, 9}
    assert Rotation.parse("R686") == {:right, 686}
  end

  test "raise error message on unexpected string" do
    assert_raise ArgumentError, "Unexpected direction value: F", fn ->
      Rotation.parse("F16")
    end

    assert_raise ArgumentError, "Unexpected direction value: P", fn ->
      Rotation.parse("PANIC")
    end

    assert_raise ArgumentError, fn ->
      Rotation.parse("LBAD")
    end
  end
end
