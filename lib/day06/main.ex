alias Day06.MathWorksheet

defmodule Day06.Main do

  def math_worksheet_answers_sum(file_lines_stream) do
    file_lines_stream
    |> MathWorksheet.parse_lines()
    |> Enum.map(fn {operator, numbers} ->
      case operator do
        :sum -> Enum.sum(numbers)
        :mult -> Enum.reduce(numbers, fn a, b -> a * b end)
      end
    end)
    |> Enum.sum()
  end

end
