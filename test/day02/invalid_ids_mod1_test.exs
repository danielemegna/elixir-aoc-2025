alias Day02.InvalidIDsMod1

defmodule Day02.InvalidIDsMod1Test do
  use ExUnit.Case
  import TestHelper

  test "few digits" do
    assert_lists_equal(InvalidIDsMod1.find_for({123, 234}), [222])
  end

end
