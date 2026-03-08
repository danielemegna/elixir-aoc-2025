alias Day06.MathWorksheet

defmodule Day06.MathWorksheetTest do
  use ExUnit.Case

  test "parse provided math worksheet example in common vertical" do
    math_worksheet_input_lines = [
      "123 328  51 64 ",
      " 45 64  387 23 ",
      "  6 98  215 314",
      "*   +   *   +  "
    ]

    math_worksheet = MathWorksheet.parse_lines(math_worksheet_input_lines, :common_vertical)

    assert math_worksheet == [
      {:mult, [123, 45, 6]},
      {:sum, [328, 64, 98]},
      {:mult, [51, 387, 215]},
      {:sum, [64, 23, 314]},
    ]
  end

  test "parse provided math worksheet example in right-to-left columns" do
    math_worksheet_input_lines = [
      "123 328  51 64 ",
      " 45 64  387 23 ",
      "  6 98  215 314",
      "*   +   *   +  "
    ]

    math_worksheet = MathWorksheet.parse_lines(math_worksheet_input_lines, :right_to_left_columns)

    assert math_worksheet == [
      {:mult, [356, 24, 1]},
      {:sum, [8, 248, 369]},
      {:mult, [175, 581, 32]},
      {:sum, [4, 431, 623]},
    ]
  end

end
