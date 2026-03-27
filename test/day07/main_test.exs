alias Day07.Main

defmodule Day07.MainTest do
  use ExUnit.Case

  @provided_example_input """
  .......S.......
  ...............
  .......^.......
  ...............
  ......^.^......
  ...............
  .....^.^.^.....
  ...............
  ....^.^...^....
  ...............
  ...^.^...^.^...
  ...............
  ..^...^.....^..
  ...............
  .^.^.^.^.^...^.
  ...............
  """

  test "solve first part with provided example" do
    actual = Main.beam_split_count(as_file_stream(@provided_example_input))
    assert actual == 21
  end

  test "solve first part with file" do
    actual = Main.beam_split_count(read_file_stream())
    assert actual == 1658
  end

  test "solve second part with provided example" do
    actual = Main.different_timelines_count(as_file_stream(@provided_example_input))
    assert actual == 40
  end

  test "solve second part with file" do
    actual = Main.different_timelines_count(read_file_stream())
    assert actual == 53916299384254
  end

  defp as_file_stream(file_content) do
    file_content
    |> String.trim()
    |> String.split("\n")
    |> Stream.map(& &1)
  end

  defp read_file_stream() do
    File.stream!("./test/day07/input.txt")
    |> Stream.map(&String.trim/1)
  end

end
