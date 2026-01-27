defmodule Day02.IDsRange do
  def invalid_in({from, to}) do
    from_str = Integer.to_string(from)
    to_str = Integer.to_string(to)

    cond do
      rem(String.length(from_str), 2) == 0 ->
        find_invalid_ids_with(from_str, {from, to}, :forward)

      rem(String.length(to_str), 2) == 0 ->
        find_invalid_ids_with(to_str, {from, to}, :backward)

      true ->
        []
    end
  end

  defp find_invalid_ids_with(value_str, {from, to}, direction) do
    half_string = half_string_of(value_str)

    case direction do
      :forward -> invalid_with_half_from_start(half_string, {from, to})
      :backward -> invalid_with_half_from_end(half_string, {from, to})
    end
  end

  defp invalid_with_half_from_start(half_str, {from, to}) do
    candidate = String.to_integer(half_str <> half_str)

    if candidate > to do
      []
    else
      found = if candidate >= from, do: [candidate], else: []
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
      found = if candidate <= to, do: [candidate], else: []
      half_int = String.to_integer(half_str)
      next_half = Integer.to_string(half_int - 1)
      found ++ invalid_with_half_from_end(next_half, {from, to})
    end
  end

  defp half_string_of(string) do
    digits = String.length(string)
    half_index = div(digits, 2)
    {half_string, _} = String.split_at(string, half_index)
    half_string
  end
end
