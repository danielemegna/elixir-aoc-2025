defmodule Day06.MathWorksheet do

  def parse_lines(lines) do
    {numbers_lines, [operators_line]} = lines |> Enum.split(-1)

    operators = Regex.scan(~r/\S/, operators_line)
    |> List.flatten()
    |> Enum.map(&operator_atom/1)

    numbers = numbers_lines
    |> Enum.map(fn line ->
      Regex.scan(~r/\d+/, line)
      |> List.flatten()
      |> Enum.map(&String.to_integer/1)
    end)
    |> transpose()

    Enum.zip(operators, numbers)
  end

  defp operator_atom("*"), do: :mult
  defp operator_atom("+"), do: :sum

  defp transpose(enum), do: Enum.zip_with(enum, &Function.identity/1)

end
