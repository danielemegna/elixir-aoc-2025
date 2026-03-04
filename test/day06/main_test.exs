alias Day06.Main

defmodule Day06.MainTest do
  use ExUnit.Case

  @provided_example_input """
  123 328  51 64
   45 64  387 23
    6 98  215 314
  *   +   *   +
  """

  test "solve first part with provided example" do
    actual = Main.math_worksheet_answers_sum(as_file_stream(@provided_example_input))
    assert actual == 33210 + 490 + 4_243_455 + 401
  end

  @tag :skip
  test "solve first part with file" do
    actual = Main.math_worksheet_answers_sum(read_file_stream())
    assert actual == -1
  end

  defp as_file_stream(file_content) do
    file_content
    |> String.trim()
    |> String.split("\n")
    |> Stream.map(& &1)
  end

  defp read_file_stream() do
    File.stream!("./test/day06/input.txt")
    |> Stream.map(&String.trim/1)
  end

end
