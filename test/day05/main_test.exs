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
    actual = Main.fresh_ingredients_count(as_file_stream(@provided_example_input))
    assert actual == 3
  end

  test "solve first part with file" do
    actual = Main.fresh_ingredients_count(read_file_stream())
    assert actual == 520
  end

  test "solve second part with provided example" do
    actual = Main.total_fresh_ingredients_in_database(as_file_stream(@provided_example_input))
    assert actual == 14
  end

  test "solve second part with file" do
    actual = Main.total_fresh_ingredients_in_database(read_file_stream())
    assert actual == 347338785050515
  end

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
