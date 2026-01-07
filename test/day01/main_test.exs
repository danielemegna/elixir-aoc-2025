defmodule Day01.MainTest do
  use ExUnit.Case

  @provided_example_input """
  L68
  L30
  R48
  L5
  R60
  L55
  L1
  L99
  R14
  L82
  """

  test "solve first part with provided example" do
    actual = Day01.Main.find_password_for(@provided_example_input)
    assert actual == 3
  end
end
