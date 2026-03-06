alias Day06.Main

defmodule Day06.MainTest do
  use ExUnit.Case

  @provided_example_input [
    "123 328  51 64 ",
    " 45 64  387 23 ",
    "  6 98  215 314",
    "*   +   *   +  "
  ]

  test "solve first part with provided example" do
    actual = Main.math_worksheet_answers_sum(as_file_stream(@provided_example_input), :common_vertical)
    assert actual == (123 * 45 * 6) + (328 + 64 + 98) + 4_243_455 + (64 + 23 + 314)
  end

  test "solve first part with file" do
    actual = Main.math_worksheet_answers_sum(read_file_stream(), :common_vertical)
    assert actual == 3_968_933_219_902
  end

  @tag :skip
  test "solve second part with provided example" do
    actual = Main.math_worksheet_answers_sum(as_file_stream(@provided_example_input), :right_to_left_columns)
    assert actual == (356 * 24 * 1) + (8 + 248 + 369) + 3_253_600 + (4 + 431 + 623)
  end

  @tag :skip
  test "solve second part with file" do
    actual = Main.math_worksheet_answers_sum(read_file_stream(), :right_to_left_columns)
    assert actual == -1
  end

  defp as_file_stream(file_content) do
    file_content
    |> Stream.map(&Function.identity/1)
  end

  defp read_file_stream() do
    File.stream!("./test/day06/input.txt")
  end

end
