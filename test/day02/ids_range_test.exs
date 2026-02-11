alias Day02.IDsRange

defmodule Day02.IDsRangeTest do
  use ExUnit.Case
  import TestHelper

  describe "find invalid ids with single repetition" do

    test "no invalid ids" do
      assert IDsRange.invalid_in({11_238, 11_896}, :single_repetition) == []
      assert IDsRange.invalid_in({565_653, 565_659}, :single_repetition) == []
      assert IDsRange.invalid_in({698_522, 698_697}, :single_repetition) == []
      assert IDsRange.invalid_in({1_698_522, 1_698_528}, :single_repetition) == []
    end

    test "single invalid id" do
      assert IDsRange.invalid_in({95, 115}, :single_repetition) == [99]
      assert IDsRange.invalid_in({998, 1012}, :single_repetition) == [1010]
      assert IDsRange.invalid_in({222_220, 222_224}, :single_repetition) == [222_222]
    end

    test "two invalid ids" do
      assert_lists_equal IDsRange.invalid_in({11, 22}, :single_repetition), [11, 22]
      assert_lists_equal IDsRange.invalid_in({374_100, 375_900}, :single_repetition), [374_374, 375_375]
      assert_lists_equal IDsRange.invalid_in({373_900, 376_100}, :single_repetition), [374_374, 375_375]
    end

    test "five invalid ids" do
      assert_lists_equal(
        IDsRange.invalid_in({900, 1500}, :single_repetition),
        [ 1010, 1111, 1212, 1313, 1414 ]
      )
      assert_lists_equal(
        IDsRange.invalid_in({374_000, 378_900}, :single_repetition),
        [ 374_374, 375_375, 376_376, 377_377, 378_378 ]
      )
    end

    test "lot of invalid ids" do
      assert_list_contains(
        IDsRange.invalid_in({229453, 357173}, :single_repetition),
        [
          330330, 331331, 332332, 333333, 334334,
          335335, 336336, 337337, 338338, 339339, 340340,
          # more ..
          351351, 352352, 353353, 354354, 355355, 356356,
        ]
      )
      assert_list_contains(
        IDsRange.invalid_in({4526, 8370}, :single_repetition),
        [
          4545, 4646, 4747, 4848, 4949,
          5050, 5151, 5252, 5353, 5454,
          # more ..
          7878, 7979, 8080, 8181, 8282,
        ]
      )
    end

  end

  describe "find invalid ids with more repetitions" do

    test "few digits" do
      assert_lists_equal(IDsRange.invalid_in({78, 99}, :more_repetitions), [88, 99])
      assert_lists_equal(IDsRange.invalid_in({100, 400}, :more_repetitions), [111, 222, 333])
      assert_lists_equal(IDsRange.invalid_in({1000, 1012}, :more_repetitions), [1010])
      assert_lists_equal(IDsRange.invalid_in({1234, 1499}, :more_repetitions), [1313, 1414])
      assert_lists_equal(IDsRange.invalid_in({1234, 1550}, :more_repetitions), [1313, 1414, 1515])
    end

    test "different number of digits in range" do
      assert_lists_equal(IDsRange.invalid_in({998, 1012}, :more_repetitions), [999, 1010])
      assert_lists_equal(IDsRange.invalid_in({90, 150}, :more_repetitions), [99, 111])
      assert_list_contains(IDsRange.invalid_in({880, 12000}, :more_repetitions), [
        888, 999, 1111, 2222, 3333, 4444, 5555, 6666, 7777, 8888, 9999, 11111
      ])
      assert_list_contains(IDsRange.invalid_in({880, 12000}, :more_repetitions), [
        1010, 1111, 1212, 1313, 1414, 1515, 1616, 2020, 2121
      ])
    end

    test "some provided example" do
      assert_lists_equal(IDsRange.invalid_in({1188511880, 1188511890}, :more_repetitions), [1188511885])
      assert_lists_equal(IDsRange.invalid_in({565653, 565659}, :more_repetitions), [565656])
      assert_lists_equal(IDsRange.invalid_in({824824821, 824824827}, :more_repetitions), [824824824])
      assert_lists_equal(IDsRange.invalid_in({2121212118, 2121212124}, :more_repetitions), [2121212121])
    end

    test "do not return duplicated ids" do
      assert_lists_equal(IDsRange.invalid_in({784, 1207}, :more_repetitions), [888, 999, 1010, 1111])
      assert_lists_equal(IDsRange.invalid_in({3095, 4389}, :more_repetitions), [
        3131, 3232, 3333, 3434, 3535, 3636, 3737, 3838, 3939, 4040, 4141, 4242, 4343
      ])
    end

  end


end
