defmodule Day03.Bank do

  def calculate_largest_joltage(batteries) do
    {first_digit, first_digit_index} = max_with_index(Enum.drop(batteries, -1))

    second_digit =
      batteries
      |> Enum.drop(first_digit_index + 1)
      |> Enum.max()

    to_int(first_digit, second_digit)
  end

  defp to_int(first_digit, second_digit) do
    result_string = Integer.to_string(first_digit) <> Integer.to_string(second_digit)
    String.to_integer(result_string)
  end

  defp max_with_index(enum) do
    enum
    |> Enum.with_index()
    |> Enum.max_by(fn {value, _index} -> value end)
  end

end
