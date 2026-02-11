defmodule Day02.InvalidIDs do

  def find_for({from, to}) do
    from_str = from |> Integer.to_string()
    to_str = to |> Integer.to_string()
    to_str_length = String.length(to_str)

    half_length = ceil(to_str_length / 2)

    padded_from_str = from_str |> String.pad_leading(to_str_length, "0")
    invalid_ids = Enum.reduce(1..half_length, [], fn chunk_size, invalid_ids ->
      number_to_repeat = padded_from_str |> String.split_at(chunk_size) |> elem(0) |> String.to_integer()
      max_number = to_str |> String.split_at(chunk_size) |> elem(0) |> String.to_integer()
      invalid_ids ++ find_with(number_to_repeat, max_number, 2, {from, to})
    end)

    Enum.uniq(invalid_ids)
  end

  defp find_with(number_to_repeat, max_number, repetitions, {from, to}) do
    candidate = number_to_repeat
      |> Integer.to_string()
      |> String.duplicate(repetitions)
      |> String.to_integer()

    cond do
      candidate == 0 ->
        find_with(number_to_repeat+1, max_number, 2, {from, to})
      candidate < from ->
        find_with(number_to_repeat, max_number, repetitions+1, {from, to})
      in_range(candidate, {from, to}) ->
        [candidate | find_with(number_to_repeat, max_number, repetitions+1, {from, to})]
      number_to_repeat < max_number ->
        find_with(number_to_repeat+1, max_number, 2, {from, to})
      true ->
        []
    end
  end

  defp in_range(value, {from, to}), do: value >= from and value <= to

end
