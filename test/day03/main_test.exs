defmodule Day03.MainTest do
  use ExUnit.Case

  @provided_example_input """
  987654321111111
  811111111111119
  234234234234278
  818181911112111
  """

  test "solve first part with provided example" do
    actual = Day03.Main.sum_of_the_maximum_joltage_for_banks(as_file_stream(@provided_example_input))
    assert actual == 98 + 89 + 78 + 92
  end

  @tag :skip
  test "solve first part with file" do
    actual = Day03.Main.sum_of_the_maximum_joltage_for_banks(read_file_stream())
    assert actual == -1
  end

  defp as_file_stream(file_content) do
    file_content
    |> String.trim()
    |> String.split("\n")
    |> Stream.map(& &1)
  end

  defp read_file_stream() do
    File.stream!("./test/day03/input.txt")
    |> Stream.map(&String.trim/1)
  end
end
