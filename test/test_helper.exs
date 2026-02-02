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
    assert_list_contains(second, first)
  end
end
