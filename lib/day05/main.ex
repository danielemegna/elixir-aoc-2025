alias Day05.IngredientsDatabase

defmodule Day05.Main do

  def fresh_ingredients_count(file_lines_stream) do
    {database_lines, [_ | ingredients_to_check]} = file_lines_stream
    |> Enum.split_while(fn line -> line != "" end)

    ingredients_database = IngredientsDatabase.parse(database_lines)

    ingredients_to_check
    |> Enum.count(fn ingredient_id_str ->
      ingredient_id = String.to_integer(ingredient_id_str)
      IngredientsDatabase.is_fresh(ingredients_database, ingredient_id)
    end)
  end

end
