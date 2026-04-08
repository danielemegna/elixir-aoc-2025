defmodule Day08.Circuits do

  def add_new_with(circuits, first, second) do
    [MapSet.new([first, second]) | circuits]
  end

  def add_box_to(circuits, elem, index) do
    List.update_at(circuits, index, fn circuit ->
      MapSet.put(circuit, elem)
    end)
  end

  def join_at(circuits, first_index, second_index) do
    circuits
    |> List.update_at(first_index, fn first_circuit ->
      MapSet.union(first_circuit, Enum.at(circuits, second_index))
    end)
    |> List.delete_at(second_index)
  end

end
