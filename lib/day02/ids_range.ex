defmodule Day02.IDsRange do
  def invalid_in({from, to}) do
    from_str = Integer.to_string(from)
    from_digits = String.length(from_str)

    if(rem(from_digits, 2) == 0) do
      {first_half, _} = from_str |> String.split_at(div(from_digits, 2))
      candidate = String.to_integer(first_half <> first_half)

      if candidate > from and candidate < to do
        [candidate]
      else
        []
      end
    else
      []
    end
  end
end
