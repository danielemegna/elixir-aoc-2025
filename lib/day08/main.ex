alias Day08.JunctionBoxes
alias Day08.Circuits

defmodule Day08.Main do

  def three_largest_circuits_product(file_lines_stream, junction_boxes_to_connect) do
    junction_boxes_distances = junction_boxes_distances_from(file_lines_stream)

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

  def last_connected_junction_boxes_x_product(file_lines_stream) do
    junction_boxes_distances = junction_boxes_distances_from(file_lines_stream)

    junction_boxes_sorted_by_greater_distance =
      junction_boxes_distances
      |> Enum.sort(:desc)
      |> Enum.map(fn {_distance, pair} -> pair end)

    latest_pair_of_connected_boxes = first_never_appearing(junction_boxes_sorted_by_greater_distance)

    latest_pair_of_connected_boxes
    |> Enum.map(fn {x, _y, _z} -> x end)
    |> Enum.product()
  end

  defp first_never_appearing([pair | rest]) do
    if !both_already_present?(rest, pair) do
      pair
    else
      first_never_appearing(rest)
    end
  end

  defp both_already_present?(rest_junction_boxes, [first, second]) do
    first_found = Enum.any?(rest_junction_boxes, fn [a, b] -> a == first || b == first end)
    second_found = Enum.any?(rest_junction_boxes, fn [a, b] -> a == second || b == second end)
    first_found and second_found
  end

  defp junction_boxes_distances_from(file_lines_stream) do
    file_lines_stream
    |> Enum.map(&parse_line(&1))
    |> Enum.reduce({[], []}, fn junction_box, {distances, computed} ->
      new_distances =
        computed
        |> Enum.map(fn other ->
          distance = JunctionBoxes.euclidean_distance(junction_box, other)
          {distance, [junction_box, other]}
        end)

      {new_distances ++ distances, [junction_box | computed]}
    end)
    |> elem(0)
  end

  defp create_circuits([], circuits), do: circuits

  defp create_circuits([ {_distance, [first, second]} | distances_rest ], circuits) do
    first_already_in_circuit = Enum.find_index(circuits, &(MapSet.member?(&1, first)))
    second_already_in_circuit = Enum.find_index(circuits, &(MapSet.member?(&1, second)))

    new_circuits = cond do
      !first_already_in_circuit and !second_already_in_circuit ->
        circuits |> Circuits.add_new_with(first, second)
      first_already_in_circuit == second_already_in_circuit ->
        circuits
      !first_already_in_circuit ->
        circuits |> Circuits.add_box_to(first, second_already_in_circuit)
      !second_already_in_circuit ->
        circuits |> Circuits.add_box_to(second, first_already_in_circuit)
      true -> # => first_already_in_circuit and second_already_in_circuit
        circuits |> Circuits.join_at(first_already_in_circuit, second_already_in_circuit)
    end

    create_circuits(distances_rest, new_circuits)
  end

  defp parse_line(file_line) do
    file_line
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end

end
