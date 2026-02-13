defmodule Day03.Bank do

  def calculate_largest_joltage(batteries, number_of_batteries_to_turn_on \\ 2) do
    number_of_batteries_to_exclude = number_of_batteries_to_turn_on - 1
    first_digit_candidates = batteries
      |> Enum.drop(0)
      |> Enum.drop(-number_of_batteries_to_exclude)
    {first_digit, first_digit_index} = max_with_index(first_digit_candidates)

    second_digit_candidates = batteries
      |> Enum.drop(first_digit_index + 1)
      |> Enum.drop(-(number_of_batteries_to_exclude-1))
    {second_digit, _second_digit_index} = max_with_index(second_digit_candidates)

    # batteries_to_turn_on = Enum.reduce(
    #   number_of_batteries_to_turn_on-1..1,
    #   {batteries, []},
    #   fn(number_of_batteries_to_exclude, {remaining_batteries, batteries_to_turn_on}) ->
    #     {value, index} = batteries
    #     |> Enum.drop(-number_of_batteries_to_exclude)
    #     |> max_with_index()
    #   end
    # )

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
