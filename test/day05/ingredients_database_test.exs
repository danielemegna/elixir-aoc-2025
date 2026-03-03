alias Day05.IngredientsDatabase

defmodule Day05.IngredientsDatabaseTest do
  use ExUnit.Case

  @provided_example [
    "3-5",
    "10-14",
    "16-20",
    "12-18",
  ]

  test "parse small database" do
    database = IngredientsDatabase.parse(@provided_example)

    expected = [
      {3, 5},
      {10, 14},
      {12, 18},
      {16, 20}
    ]
    assert database == expected
  end

  test "query small database" do
    database = [
      {3, 5},
      {10, 14},
      {12, 18},
      {16, 20}
    ]

    assert IngredientsDatabase.is_fresh(database, 1) == false
    assert IngredientsDatabase.is_fresh(database, 5) == true
    assert IngredientsDatabase.is_fresh(database, 8) == false
    assert IngredientsDatabase.is_fresh(database, 11) == true
    assert IngredientsDatabase.is_fresh(database, 17) == true
    assert IngredientsDatabase.is_fresh(database, 32) == false
  end

  test "fresh ids count on small database" do
    database = [
      {3, 5},
      {10, 14},
      {12, 18},
      {16, 20},
      {10, 12}, # extra element
      {18, 20}, # extra element
    ]

    assert IngredientsDatabase.fresh_ids_count(database) == 14
  end

end
