defmodule Day02.IDsRange do

  def invalid_in({from, to}, mode) do
    from_str = Integer.to_string(from)
    to_str = Integer.to_string(to)
    to_str_length = String.length(to_str)
    padded_from_str = String.pad_leading(from_str, to_str_length, "0")

    half_length = ceil(to_str_length / 2)
    max_repetitions = case mode do
      :more_repetitions -> to_str_length
      :single_repetition -> 2
    end

    invalid_ids = Enum.reduce(1..half_length, [], fn chunk_size, invalid_ids ->
      number_to_repeat = padded_from_str |> take_integer_at(chunk_size)
      number_to_repeat_limit = to_str |> take_integer_at(chunk_size)
      invalid_ids ++ find_with(number_to_repeat, number_to_repeat_limit, 2, max_repetitions, {from, to})
    end)

    Enum.uniq(invalid_ids)
  end

  defp find_with(number_to_repeat, number_to_repeat_limit, repetitions, max_repetitions, {from, to}) do
    candidate = number_to_repeat
      |> Integer.to_string()
      |> String.duplicate(repetitions)
      |> String.to_integer()

    invalid_ids = if in_range(candidate, {from, to}), do: [candidate], else: []

    cond do
      number_to_repeat > number_to_repeat_limit ->
        invalid_ids
      repetitions < max_repetitions ->
        invalid_ids ++ find_with(number_to_repeat, number_to_repeat_limit, repetitions+1, max_repetitions, {from, to})
      true ->
        invalid_ids ++ find_with(number_to_repeat+1, number_to_repeat_limit, 2, max_repetitions, {from, to})
    end
  end

  defp take_integer_at(str, size) do
    str
    |> String.split_at(size)
    |> elem(0)
    |> String.to_integer()
  end

  defp in_range(value, {from, to}), do: value >= from and value <= to

end
