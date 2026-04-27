defmodule Day09.Main do
  def largest_red_tiles_rectangle_with(file_lines_stream) do
    parsed =
      file_lines_stream
      |> Enum.map(fn str ->
        str
        |> String.split(",")
        |> Enum.map(&String.to_integer/1)
        |> List.to_tuple()
      end)

    {largest_rectagle, _} =
      Enum.reduce(parsed, {0, Enum.drop(parsed, 1)}, fn
        _, {max, []} ->
          {max, []}

        point, {max, rest} ->
          current_max =
            rest
            |> Enum.map(fn other -> rectangle_area_with(point, other) end)
            |> Enum.max()

          if(current_max > max) do
            {current_max, Enum.drop(rest, 1)}
          else
            {max, Enum.drop(rest, 1)}
          end
      end)

    largest_rectagle
  end

  defp rectangle_area_with({x1, y1}, {x2, y2}) do
    abs(x1 - x2 + 1) * abs(y1 - y2 + 1)
  end
end
