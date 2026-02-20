alias Day04.Main

defmodule Day04.MainTest do
  use ExUnit.Case

  @provided_example_input """
  ..@@.@@@@.
  @@@.@.@.@@
  @@@@@.@.@@
  @.@@@@..@.
  @@.@@@@.@@
  .@@@@@@@.@
  .@.@.@.@@@
  @.@@@.@@@@
  .@@@@@@@@.
  @.@.@@@.@.
  """

  test "solve first part with provided example" do
    actual = Main.accessible_rolls_of_paper_in(provided_example_input_stream())
    assert actual == 13
  end

  test "solve first part with file" do
    actual = Main.accessible_rolls_of_paper_in(read_file_stream())
    assert actual == 1587
  end

  def provided_example_input_stream(), do: as_file_stream(@provided_example_input)

  defp as_file_stream(file_content) do
    file_content
    |> String.trim()
    |> String.split("\n")
    |> Stream.map(& &1)
  end

  defp read_file_stream() do
    File.stream!("./test/day04/input.txt")
    |> Stream.map(&String.trim/1)
  end

end
