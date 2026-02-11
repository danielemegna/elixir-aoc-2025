defmodule Day02.IDsRange do

  def invalid_in({from, to}, mode) do
    from_str = from |> Integer.to_string()
    to_str = to |> Integer.to_string()
    to_str_length = String.length(to_str)

    half_length = ceil(to_str_length / 2)
    max_repetitions = case mode do
      :more_repetitions -> to_str_length
      :single_repetition -> 2
    end

    padded_from_str = from_str |> String.pad_leading(to_str_length, "0")
    invalid_ids = Enum.reduce(1..half_length, [], fn chunk_size, invalid_ids ->
      number_to_repeat = padded_from_str |> String.split_at(chunk_size) |> elem(0) |> String.to_integer()
      max_number = to_str |> String.split_at(chunk_size) |> elem(0) |> String.to_integer()
      invalid_ids ++ find_with(number_to_repeat, max_number, 2, max_repetitions, {from, to})
    end)

    Enum.uniq(invalid_ids)
  end

  defp find_with(number_to_repeat, max_number, repetitions, max_repetitions, {from, to}) do
    candidate = number_to_repeat
      |> Integer.to_string()
      |> String.duplicate(repetitions)
      |> String.to_integer()

    invalid_ids = if in_range(candidate, {from, to}), do: [candidate], else: []

    cond do
      number_to_repeat > max_number ->
        invalid_ids
      repetitions < max_repetitions ->
        invalid_ids ++ find_with(number_to_repeat, max_number, repetitions+1, max_repetitions, {from, to})
      true ->
        invalid_ids ++ find_with(number_to_repeat+1, max_number, 2, max_repetitions, {from, to})
    end
  end

  defp in_range(value, {from, to}), do: value >= from and value <= to

end
