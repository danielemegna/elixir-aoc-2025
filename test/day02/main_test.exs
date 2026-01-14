defmodule Day02.MainTest do
  use ExUnit.Case

  @provided_example_input "11-22,95-115,998-1012,1188511880-1188511890,222220-222224," <>
                            "1698522-1698528,446443-446449,38593856-38593862,565653-565659," <>
                            "824824821-824824827,2121212118-2121212124"

  test "solve first part with provided example" do
    actual = Day02.Main.invalid_ids_sum(as_file_stream(@provided_example_input))
    assert actual == 1227775554
  end

  @tag :skip
  test "solve first part with file" do
    actual = Day02.Main.invalid_ids_sum(read_file_stream())
    assert actual == -1
  end

  defp as_file_stream(file_content) do
    file_content
    |> String.trim()
    |> String.split("\n")
    |> Stream.map(& &1)
  end

  defp read_file_stream() do
    File.stream!("./test/day02/input.txt")
    |> Stream.map(&String.trim/1)
  end
end
