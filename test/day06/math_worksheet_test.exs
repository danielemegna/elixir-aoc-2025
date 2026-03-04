alias Day06.MathWorksheet

defmodule Day06.MathWorksheetTest do
  use ExUnit.Case

  test "parse provided math worksheet example" do
    math_worksheet_input_lines = [
      "123 328  51 64 ",
      " 45 64  387 23 ",
      "  6 98  215 314",
      "*   +   *   +  "
    ]

    math_worksheet = MathWorksheet.parse_lines(math_worksheet_input_lines)

    assert math_worksheet == [
      {:mult, [123, 45, 6]},
      {:sum, [328, 64, 98]},
      {:mult, [51, 387, 215]},
      {:sum, [64, 23, 314]},
    ]
  end

end
