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

end
