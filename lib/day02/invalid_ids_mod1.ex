defmodule Day02.InvalidIDsMod1 do
  def find_for({from, to}) do
    from_digits_str = from |> Integer.to_string() |> String.graphemes()
    from_digits_count = Enum.count(from_digits_str)
    to_digits_count = to |> Integer.to_string() |> String.graphemes() |> Enum.count()

    first_digit = from_digits_str |> Enum.at(0) |> String.to_integer()
    find_with(first_digit, from_digits_count, to_digits_count, {from, to})
  end

  defp find_with(current_digit, current_digits_count, limit_digits_count, {from, to}, invalid_ids \\ []) do
    candidate = current_digit
      |> Integer.to_string()
      |> String.duplicate(current_digits_count)
      |> String.to_integer()

    invalid_ids = if in_range(candidate, {from, to}), do: [candidate | invalid_ids], else: invalid_ids

    cond do
      candidate > to or (current_digit == 9 and current_digits_count == limit_digits_count) ->
        invalid_ids
      current_digit < 9 ->
        find_with(current_digit + 1, current_digits_count, limit_digits_count, {from, to}, invalid_ids)
      true ->
        find_with(1, current_digits_count + 1, limit_digits_count, {from, to}, invalid_ids)
    end
  end

  defp in_range(value, {from, to}), do: value >= from and value <= to
end
