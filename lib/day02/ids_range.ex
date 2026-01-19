defmodule Day02.IDsRange do
  def invalid_in({from, to}) do
    from_str = Integer.to_string(from)
    from_digits = String.length(from_str)
    from_invalid_ids = if(rem(from_digits, 2) == 0) do
      {half_str, _} = from_str |> String.split_at(div(from_digits, 2))
      invalid_from(half_str, {from, to})
    else
      []
    end

    to_str = Integer.to_string(to)
    to_digits = String.length(to_str)
    to_invalid_ids = if(rem(to_digits, 2) == 0) do
      {half_str, _} = to_str |> String.split_at(div(to_digits, 2))
      invalid_from(half_str, {from, to})
    else
      []
    end

    Enum.concat(from_invalid_ids, to_invalid_ids) |> Enum.uniq()
  end

  defp invalid_from(half_str, {from, to}) do
    candidate = String.to_integer(half_str <> half_str)

    cond do
      candidate < from -> []
      candidate > to -> []
      true -> [candidate]
    end
  end
end
