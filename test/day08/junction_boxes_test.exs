alias Day08.JunctionBoxes

defmodule Day08.JunctionBoxesTest do
  use ExUnit.Case

  test "euclidean distance between two boxes" do
    assert 316.90219311326956 == JunctionBoxes.euclidean_distance({162, 817, 812}, {425, 690, 689})
    assert 321.560258738545 == JunctionBoxes.euclidean_distance({162, 817, 812}, {431, 825, 988})
    assert 322.36935338211043 == JunctionBoxes.euclidean_distance({906, 360, 560}, {805, 96, 715})
    assert 328.11888089532425 == JunctionBoxes.euclidean_distance({431, 825, 988}, {425, 690, 689})
  end

end
