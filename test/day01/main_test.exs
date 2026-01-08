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
    actual = Day01.Main.find_password_for(as_file_stream(@provided_example_input))
    assert actual == 3
  end

  test "solve first part with file" do
    actual = Day01.Main.find_password_for(read_file_stream())
    assert actual == 969
  end

  defp as_file_stream(file_content) do
    file_content
    |> String.trim()
    |> String.split("\n")
    |> Stream.map(&(&1))
  end

  defp read_file_stream() do
    File.stream!("./test/day01/input.txt")
    |> Stream.map(&String.trim/1)
  end

end
