defmodule Day02.InvalidIDs do

  def find_for({from, to}) do
    from_str = from |> Integer.to_string()
    to_str = to |> Integer.to_string()
    to_str_length = String.length(to_str)

    half = ceil(to_str_length / 2)

    padded_from_str = from_str |> String.pad_leading(to_str_length, "0")
    Enum.reduce(1..half, [], fn chunk_size, invalid_ids ->
      chunk = padded_from_str |> String.split_at(chunk_size) |> elem(0) |> String.to_integer()
      limit = to_str |> String.split_at(chunk_size) |> elem(0) |> String.to_integer()
      invalid_ids ++ find_with(chunk, 2, limit, {from, to})
    end)

  end

  defp find_with(chunk, repetition, limit, {from, to}) do
    candidate = chunk
      |> Integer.to_string()
      |> String.duplicate(repetition)
      |> String.to_integer()

    cond do
      candidate == 0 ->
        find_with(chunk+1, 2, limit, {from, to})
      candidate < from ->
        find_with(chunk, repetition+1, limit, {from, to})
      in_range(candidate, {from, to}) ->
        [candidate | find_with(chunk, repetition+1, limit, {from, to})]
      chunk < limit ->
        find_with(chunk+1, 2, limit, {from, to})
      true ->
        []
    end
  end

  defp in_range(value, {from, to}), do: value >= from and value <= to

end
