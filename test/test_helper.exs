ExUnit.start()

defmodule TestHelper do
  use ExUnit.Case

  def assert_list_contains(list, to_contain) do
    missing = to_contain -- list

    assert missing == [],
           "Expected elements #{inspect(missing, charlists: :as_list)} " <>
           "to be present in #{inspect(list, charlists: :as_list)} collection."
  end

  def assert_lists_equal(first, second) do
    assert_list_contains(first, second)
    assert Enum.count(first) == Enum.count(second),
      "Lists have different sizes:\n" <>
      " - #{inspect(first, charlists: :as_list)}\n" <>
      " - #{inspect(second, charlists: :as_list)}"
  end
end
