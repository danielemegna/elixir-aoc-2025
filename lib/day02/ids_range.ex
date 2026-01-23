defmodule Day02.IDsRange do
  def invalid_in({from, to}) do
    (invalid_ids_from_the_start({from, to})
    ++ invalid_ids_from_the_end({from, to}))
    |> Enum.uniq()
  end

  defp invalid_ids_from_the_start({from, to}) do
    from_str = Integer.to_string(from)
    from_digits = String.length(from_str)

    if(rem(from_digits, 2) != 0) do
      []
    else
      half_index = div(from_digits, 2)
      {half_str, _} = String.split_at(from_str, half_index)
      invalid_with_half_from_start(half_str, {from, to})
    end
  end

  defp invalid_ids_from_the_end({from, to}) do
    to_str = Integer.to_string(to)
    to_digits = String.length(to_str)

    if(rem(to_digits, 2) != 0) do
      []
    else
      half_index = div(to_digits, 2)
      {half_str, _} = String.split_at(to_str, half_index)
      invalid_with_half_from_end(half_str, {from, to})
    end
  end

  defp invalid_with_half_from_start(half_str, {from, to}) do
    candidate = String.to_integer(half_str <> half_str)

    if candidate > to do
      []
    else
      found = if candidate > from, do: [candidate], else: []
      half_int = String.to_integer(half_str)
      next_half = Integer.to_string(half_int + 1)
      found ++ invalid_with_half_from_start(next_half, {from, to})
    end
  end

  defp invalid_with_half_from_end(half_str, {from, to}) do
    candidate = String.to_integer(half_str <> half_str)

    if candidate < from do
      []
    else
      found = if candidate < to, do: [candidate], else: []
      half_int = String.to_integer(half_str)
      next_half = Integer.to_string(half_int - 1)
      found ++ invalid_with_half_from_end(next_half, {from, to})
    end
  end
end
