defmodule Day05.IngredientsDatabase do

  def parse(lines) do
    lines
    |> Enum.map(fn line ->
      [from_str, to_str] = String.split(line, "-")
      {String.to_integer(from_str), String.to_integer(to_str)}
    end)
    |> Enum.sort()
  end

  def is_fresh([{from, to} | tail], id) do
    cond do
      id < from -> false
      id > to -> is_fresh(tail, id)
      true -> true
    end
  end

  def is_fresh([], _), do: false

end
