defmodule Day03.Bank do

  def calculate_largest_joltage(batteries, number_of_batteries_to_turn_on \\ 2) do
    batteries_to_turn_on = batteries_to_turn_on(batteries, number_of_batteries_to_turn_on)
    to_int(batteries_to_turn_on)
  end

  defp batteries_to_turn_on(remaining_batteries, remaining_batteries_to_turn_on, batteries_to_turn_on \\ []) do
    number_of_batteries_to_exclude = remaining_batteries_to_turn_on - 1
    candidates = remaining_batteries |> Enum.drop(-number_of_batteries_to_exclude)
    {battery_to_turn_on, battery_to_turn_on_index} = max_with_index(candidates)
    new_batteries_to_turn_on = [battery_to_turn_on | batteries_to_turn_on]

    if(remaining_batteries_to_turn_on == 1) do
      new_batteries_to_turn_on |> Enum.reverse()
    else
      batteries_to_turn_on(
        Enum.drop(remaining_batteries, battery_to_turn_on_index + 1),
        remaining_batteries_to_turn_on - 1,
        new_batteries_to_turn_on
      )
    end
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
