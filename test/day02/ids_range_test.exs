alias Day02.IDsRange

defmodule Day02.IDsRangeTest do
  use ExUnit.Case

  test "no invalid ids" do
    assert IDsRange.invalid_in({11_238, 11_896}) == []
    assert IDsRange.invalid_in({565_653, 565_659}) == []
    assert IDsRange.invalid_in({698_522, 698_697}) == []
    assert IDsRange.invalid_in({1_698_522, 1_698_528}) == []
  end

  test "single invalid id" do
    assert IDsRange.invalid_in({95, 115}) == [99]
    #assert IDsRange.invalid_in({998, 1012}) == [1010]
    assert IDsRange.invalid_in({222_220, 222_224}) == [222_222]
  end
end
