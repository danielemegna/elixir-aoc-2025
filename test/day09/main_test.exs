alias Day09.Main

defmodule Day09.MainTest do
  use ExUnit.Case

  @provided_example_input """
  7,1
  11,1
  11,7
  9,7
  9,5
  2,5
  2,3
  7,3
  """

  test "solve first part with provided example" do
    actual = Main.largest_red_tiles_rectangle_with(as_file_stream(@provided_example_input))
    assert actual == 5 * 10
  end

  @tag :skip
  test "solve first part with file" do
    actual = Main.largest_red_tiles_rectangle_with(read_file_stream())
    assert actual == -1
  end

  defp as_file_stream(file_content) do
    file_content
    |> String.trim()
    |> String.split("\n")
    |> Stream.map(& &1)
  end

  defp read_file_stream() do
    File.stream!("./test/day09/input.txt")
    |> Stream.map(&String.trim/1)
  end

end
