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
    |> Enum.sort()
    |> Enum.take(junction_boxes_to_connect)

    # seems that an already present connection should not be
    # considered counting the junction_boxes_to_connect
    # so, we should remove the take limit above and
    # replace the reduce operation below to a recursion
    # in order to early return when needed

    junction_boxes_distances
    |> Enum.reduce([], fn {_distance, [first, second]}, groups ->
      found_index = Enum.find_index(groups, fn group ->
        MapSet.member?(group, first) or MapSet.member?(group, second)
      end)

      if found_index == nil  do
        [MapSet.new([first, second]) | groups]
      else
        List.update_at(groups, found_index, fn group ->
          group |> MapSet.put(first) |> MapSet.put(second)
        end)
      end
    end)

    40
  end

  defp parse_line(file_line) do
    file_line
    |> String.split(",")
    |> Enum.map(&(String.to_integer(&1)))
    |> List.to_tuple()
  end

end
