alias Day02.InvalidIDs

defmodule Day02.InvalidIDsTest do
  use ExUnit.Case
  import TestHelper

  test "few digits" do
    assert_lists_equal(InvalidIDs.find_for({78, 99}), [88, 99])
    assert_lists_equal(InvalidIDs.find_for({100, 400}), [111, 222, 333])
    assert_lists_equal(InvalidIDs.find_for({1000, 1012}), [1010])
    assert_lists_equal(InvalidIDs.find_for({1234, 1499}), [1313, 1414])
    assert_lists_equal(InvalidIDs.find_for({1234, 1550}), [1313, 1414, 1515])
  end

  test "different number of digits in range" do
    assert_lists_equal(InvalidIDs.find_for({998, 1012}), [999, 1010])
    assert_lists_equal(InvalidIDs.find_for({90, 150}), [99, 111])
    assert_list_contains(InvalidIDs.find_for({880, 12000}), [
      888, 999, 1111, 2222, 3333, 4444, 5555, 6666, 7777, 8888, 9999, 11111
    ])
    assert_list_contains(InvalidIDs.find_for({880, 12000}), [
      1010, 1111, 1212, 1313, 1414, 1515, 1616, 2020, 2121
    ])
  end

  test "some provided example" do
    assert_lists_equal(InvalidIDs.find_for({1188511880, 1188511890}), [1188511885])
    assert_lists_equal(InvalidIDs.find_for({565653, 565659}), [565656])
    assert_lists_equal(InvalidIDs.find_for({824824821, 824824827}), [824824824])
    assert_lists_equal(InvalidIDs.find_for({2121212118, 2121212124}), [2121212121])
  end

  test "do not return duplicated ids" do
    assert_lists_equal(InvalidIDs.find_for({784, 1207}), [888, 999, 1010, 1111])
    assert_lists_equal(InvalidIDs.find_for({3095, 4389}), [
      3131, 3232, 3333, 3434, 3535, 3636, 3737, 3838, 3939, 4040, 4141, 4242, 4343
    ])
  end

end
