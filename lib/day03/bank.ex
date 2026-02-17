defmodule Day03.Bank do

  def calculate_largest_joltage(batteries, number_of_batteries_to_turn_on \\ 2) do

    {batteries_to_turn_on, _} = Enum.reduce(
      Range.new(number_of_batteries_to_turn_on-1, 0, -1),
      {[], batteries},
      fn(number_of_batteries_to_exclude, {batteries_to_turn_on, remaining_batteries}) ->
        {battery_to_turn_on, battery_to_turn_on_index} = remaining_batteries
        |> Enum.drop(-number_of_batteries_to_exclude)
        |> max_with_index()

        {
          [battery_to_turn_on | batteries_to_turn_on],
          Enum.drop(remaining_batteries, battery_to_turn_on_index + 1)
        }
      end
    )

    batteries_to_turn_on
    |> Enum.reverse()
    |> to_int()
  end

  defp to_int(digits) do
    digits
    |> Enum.reduce("", fn(digit, str) -> str <> Integer.to_string(digit) end)
    |> String.to_integer()
  end

  defp max_with_index(enum) do
    enum
    |> Enum.with_index()
    |> Enum.max_by(fn {value, _index} -> value end)
  end

end
