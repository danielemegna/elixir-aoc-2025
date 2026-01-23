alias Day02.IDsRange

defmodule Day02.IDsRangeTest do
  use ExUnit.Case
  import TestHelper

  test "no invalid ids" do
    assert IDsRange.invalid_in({11_238, 11_896}) == []
    assert IDsRange.invalid_in({565_653, 565_659}) == []
    assert IDsRange.invalid_in({698_522, 698_697}) == []
    assert IDsRange.invalid_in({1_698_522, 1_698_528}) == []
  end

  test "single invalid id" do
    assert IDsRange.invalid_in({95, 115}) == [99]
    assert IDsRange.invalid_in({998, 1012}) == [1010]
    assert IDsRange.invalid_in({222_220, 222_224}) == [222_222]
  end

  test "two invalid ids" do
    assert_lists_equal IDsRange.invalid_in({11, 22}), [11, 22]
    assert_lists_equal IDsRange.invalid_in({374_100, 375_900}), [374_374, 375_375]
    assert_lists_equal IDsRange.invalid_in({373_900, 376_100}), [374_374, 375_375]
  end

  test "five invalid ids" do
    assert_lists_equal(
      IDsRange.invalid_in({900, 1500}),
      [ 1010, 1111, 1212, 1313, 1414 ]
    )
    assert_lists_equal(
      IDsRange.invalid_in({374_000, 378_900}),
      [ 374_374, 375_375, 376_376, 377_377, 378_378 ]
    )
  end

  @tag :skip
  test "lot of invalid ids" do
    expected_subset = [
      229229, 330330, 331331, 332332, 333333, 334334,
      335335, 336336, 337337, 338338, 339339, 340340,
      # more ..
      351351, 352352, 353353, 354354, 355355, 356356
    ]

    actual = IDsRange.invalid_in({229453, 357173})

    assert_list_contains(actual, expected_subset)
  end
end
