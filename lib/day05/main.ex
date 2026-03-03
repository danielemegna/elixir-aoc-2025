alias Day05.IngredientsDatabase

defmodule Day05.Main do

  def fresh_ingredients_count(file_lines_stream) do
    {database_lines, ingredients_to_check_lines} = split_file_lines_stream(file_lines_stream)
    ingredients_database = IngredientsDatabase.parse(database_lines)
    ingredients_to_check = Enum.map(ingredients_to_check_lines, &String.to_integer/1)

    ingredients_to_check
    |> Enum.count(fn ingredient_id ->
      IngredientsDatabase.is_fresh(ingredients_database, ingredient_id)
    end)
  end

  def total_fresh_ingredients_in_database(file_lines_stream) do
    {database_lines, _} = split_file_lines_stream(file_lines_stream)
    ingredients_database = IngredientsDatabase.parse(database_lines)
    IngredientsDatabase.fresh_ids_count(ingredients_database)
  end

  defp split_file_lines_stream(lines_stream) do
    {database_lines, rest} = lines_stream
    |> Enum.split_while(&(&1 != ""))

    [_ | ingredients_to_check] = rest
    {database_lines, ingredients_to_check}
  end

end
