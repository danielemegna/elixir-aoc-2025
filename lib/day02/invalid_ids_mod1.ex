defmodule Day02.InvalidIDsMod1 do
  def find_for({from, to}) do
    from_digits_str = from |> Integer.to_string() |> String.graphemes()
    from_digits_count = Enum.count(from_digits_str)
    to_digits_count = from |> Integer.to_string() |> String.graphemes() |> Enum.count()

    first_digit = from_digits_str |> Enum.at(0) |> String.to_integer()
    find_with(first_digit, from_digits_count, to_digits_count, {from, to})
  end

  defp find_with(digit, from_digits_count, to_digits_count, {from, to}) do
    digit_str = Integer.to_string(digit)

    invalid_ids =
      Enum.reduce(from_digits_count..to_digits_count, [], fn length, acc ->
        candidate = digit_str |> String.duplicate(length) |> String.to_integer()
        if in_range(candidate, {from, to}), do: [candidate | acc], else: acc
      end)

    if digit > 8 do
      invalid_ids
    else
      invalid_ids ++ find_with(digit + 1, from_digits_count, to_digits_count, {from, to})
    end
  end

  defp in_range(value, {from, to}), do: value >= from and value <= to
end
