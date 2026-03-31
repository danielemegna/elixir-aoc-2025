alias Day08.Main

defmodule Day08.MainTest do
  use ExUnit.Case

  @provided_example_input """
  162,817,812
  57,618,57
  906,360,560
  592,479,940
  352,342,300
  466,668,158
  542,29,236
  431,825,988
  739,650,466
  52,470,668
  216,146,977
  819,987,18
  117,168,530
  805,96,715
  346,949,466
  970,615,88
  941,993,340
  862,61,35
  984,92,344
  425,690,689
  """

  test "solve first part with provided example" do
    actual = Main.three_largest_circuits_product(as_file_stream(@provided_example_input), 10)
    assert actual == 5 * 4 * 2
  end

  @tag :skip
  test "solve first part with file" do
    actual = Main.three_largest_circuits_product(read_file_stream(), 1000)
    assert actual == -1
  end

  defp as_file_stream(file_content) do
    file_content
    |> String.trim()
    |> String.split("\n")
    |> Stream.map(& &1)
  end

  defp read_file_stream() do
    File.stream!("./test/day08/input.txt")
    |> Stream.map(&String.trim/1)
  end

end
