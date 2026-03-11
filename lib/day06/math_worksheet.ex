defmodule Day06.MathWorksheet do

  def parse_lines(lines, :common_vertical) do
    {numbers_lines, [operators_line]} = lines |> Enum.split(-1)

    operators = parse_operators_line(operators_line)

    numbers = numbers_lines
    |> Stream.map(fn line ->
      Regex.scan(~r/\d+/, line)
      |> List.flatten()
      |> Enum.map(&String.to_integer/1)
    end)
    |> transpose()

    Enum.zip(operators, numbers)
  end

  def parse_lines(lines, :right_to_left_columns) do
    {numbers_lines, [operators_line]} = lines |> Enum.split(-1)
    operators = parse_operators_line(operators_line)

    numbers = numbers_lines
    |> Stream.map(&String.graphemes/1)
    |> transpose()
    |> Stream.map(fn line -> line |> Enum.join() |> String.trim() end)
    |> Enum.reduce([[]], fn elem, [parsing | rest] = acc ->
      case elem do
        "" -> [[] | acc]
        number -> [[String.to_integer(number) | parsing] | rest]
      end
    end)
    |> Enum.reverse()

    Enum.zip(operators, numbers)
  end

  defp parse_operators_line(line) do
    Regex.scan(~r/\S/, line)
    |> List.flatten()
    |> Enum.map(&operator_atom/1)
  end

  defp operator_atom("*"), do: :mult
  defp operator_atom("+"), do: :sum

  defp transpose(enum), do: Stream.zip_with(enum, &Function.identity/1)

end
