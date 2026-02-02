alias Day02.InvalidIDsMod1

defmodule Day02.InvalidIDsMod1Test do
  use ExUnit.Case
  import TestHelper

  test "few digits" do
    assert_lists_equal(InvalidIDsMod1.find_for({123, 234}), [222])
    assert_lists_equal(InvalidIDsMod1.find_for({100, 400}), [111, 222, 333])
    assert_lists_equal(InvalidIDsMod1.find_for({78, 99}), [88, 99])
  end

  test "different number of digits in range" do
    assert_lists_equal(InvalidIDsMod1.find_for({90, 150}), [99, 111])
    assert_lists_equal(InvalidIDsMod1.find_for({880, 12000}), [
      888, 999, 1111, 2222, 3333, 4444, 5555, 6666, 7777, 8888, 9999, 11111
    ])
  end

end
