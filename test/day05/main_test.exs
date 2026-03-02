alias Day05.Main

defmodule Day05.MainTest do
  use ExUnit.Case

  @provided_example_input """
  3-5
  10-14
  16-20
  12-18

  1
  5
  8
  11
  17
  32
  """

  test "solve first part with provided example" do
    actual = Main.fresh_ingredients_count(provided_example_input_stream())
    assert actual == 3
  end

  @tag :skip
  test "solve first part with file" do
    actual = Main.fresh_ingredients_count(read_file_stream())
    assert actual == -1
  end

  def provided_example_input_stream(), do: as_file_stream(@provided_example_input)

  defp as_file_stream(file_content) do
    file_content
    |> String.trim()
    |> String.split("\n")
    |> Stream.map(& &1)
  end

  defp read_file_stream() do
    File.stream!("./test/day05/input.txt")
    |> Stream.map(&String.trim/1)
  end

end
