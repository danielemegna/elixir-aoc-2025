defmodule Day08.Main do
alias Day08.JunctionBoxes

  def three_largest_circuits_product(file_lines_stream, junction_boxes_to_connect) do
    junction_boxes_distances = file_lines_stream
    |> Enum.map(&(parse_line(&1)))
    |> Enum.reduce({[], []}, fn junction_box, {distances, computed} ->
      new_distances = computed
      |> Enum.map(fn other ->
        distance = JunctionBoxes.euclidean_distance(junction_box, other)
        {distance, [junction_box, other]}
      end)
      {new_distances ++ distances, [junction_box | computed]}
    end)
    |> elem(0)

    shortest_junction_boxes_distances = junction_boxes_distances
    |> Enum.sort()
    |> Enum.take(junction_boxes_to_connect)

    circuits = create_circuits(shortest_junction_boxes_distances, [])

    circuits
    |> Enum.map(&MapSet.size/1)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.product()
  end

  defp create_circuits([], circuits), do: circuits

  defp create_circuits([ {_distance, [first, second]} | distances_rest ], circuits) do
    first_already_in_circuit = Enum.find_index(circuits, &(MapSet.member?(&1, first)))
    second_already_in_circuit = Enum.find_index(circuits, &(MapSet.member?(&1, second)))

    if first_already_in_circuit != nil do
      if second_already_in_circuit != nil do
        if first_already_in_circuit == second_already_in_circuit do
          create_circuits(distances_rest, circuits)
        else
          new_circuits = circuits
          |> List.update_at(first_already_in_circuit, fn first_circuit ->
            MapSet.union(first_circuit, Enum.at(circuits, second_already_in_circuit))
          end)
          |> List.delete_at(second_already_in_circuit)
          create_circuits(distances_rest, new_circuits)
        end
      else
        new_circuits = List.update_at(circuits, first_already_in_circuit, fn circuit ->
          MapSet.put(circuit, second)
        end)
        create_circuits(distances_rest, new_circuits)
      end
    else
      if second_already_in_circuit != nil do
        new_circuits = List.update_at(circuits, second_already_in_circuit, fn circuit ->
          MapSet.put(circuit, first)
        end)
        create_circuits(distances_rest, new_circuits)
      else
        new_circuits = [MapSet.new([first, second]) | circuits]
        create_circuits(distances_rest, new_circuits)
      end
    end
  end

  defp parse_line(file_line) do
    file_line
    |> String.split(",")
    |> Enum.map(&(String.to_integer(&1)))
    |> List.to_tuple()
  end

end
