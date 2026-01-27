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
    half_integer = value_str
      |> half_string_of()
      |> String.to_integer()

    find_invalid_ids_with_half(half_integer, {from, to}, direction)
  end

  defp find_invalid_ids_with_half(half_integer, {from, to}, direction) do
    candidate = integer_doubling(half_integer)

    case direction do
      :forward when candidate > to -> []
      :backward when candidate < from -> []
      _ ->
        found = if in_range(candidate, {from, to}), do: [candidate], else: []
        next_half = case direction do
          :forward -> half_integer + 1
          :backward -> half_integer - 1
        end
        found ++ find_invalid_ids_with_half(next_half, {from, to}, direction)
    end
  end

  defp in_range(value, {from, to}), do: value >= from and value <= to

  defp half_string_of(string) do
    digits = String.length(string)
    half_index = div(digits, 2)
    {half_string, _} = String.split_at(string, half_index)
    half_string
  end

  defp integer_doubling(int) do
    str = Integer.to_string(int)
    String.to_integer(str <> str)
  end

end
