defmodule Day01.Rotation do
  def parse(binary) do
    {direction, quantity} = String.split_at(binary, 1)
    {direction_atom(direction), String.to_integer(quantity)}
  end

  defp direction_atom("L"), do: :left
  defp direction_atom("R"), do: :right
  defp direction_atom(value), do: raise(ArgumentError, "Unexpected direction value: #{value}")
end
