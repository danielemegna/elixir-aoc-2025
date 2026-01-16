alias Day03.Bank

defmodule Day03.BankTest do
  use ExUnit.Case

  describe "calculate largest joltage" do

    test "with two batteries is just their concatenation" do
      assert Bank.calculate_largest_joltage([1, 1]) == 11
      assert Bank.calculate_largest_joltage([3, 1]) == 31
      assert Bank.calculate_largest_joltage([2, 8]) == 28
    end

    test "with three batteries with same joltage" do
      assert Bank.calculate_largest_joltage([1, 1, 1]) == 11
      assert Bank.calculate_largest_joltage([3, 3, 3]) == 33
    end

    test "with three batteries with descending joltage" do
      assert Bank.calculate_largest_joltage([5, 3, 2]) == 53
    end

    test "with three batteries with ascending joltage" do
      assert Bank.calculate_largest_joltage([2, 3, 7]) == 37
    end

    test "with mixed orders" do
      assert Bank.calculate_largest_joltage([7, 3, 5]) == 75
    end

    test "with provided examples" do
      assert Bank.calculate_largest_joltage([9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 1]) == 98
      assert Bank.calculate_largest_joltage([8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9]) == 89
      assert Bank.calculate_largest_joltage([2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 7, 8]) == 78
      assert Bank.calculate_largest_joltage([8, 1, 8, 1, 8, 1, 9, 1, 1, 1, 1, 2, 1, 1, 1]) == 92
    end

  end

end
