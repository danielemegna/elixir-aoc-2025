alias Day03.Bank

defmodule Day03.Main do

  def sum_of_the_maximum_joltage_for_banks(file_lines_stream) do
    file_lines_stream
    |> Stream.map(fn line -> to_battery_bank_array(line) end)
    |> Stream.map(fn batteries -> Bank.calculate_largest_joltage(batteries) end)
    |> Enum.sum()
  end

  defp to_battery_bank_array(string) do
    string
    |> String.graphemes()
    |> Enum.map(fn char -> String.to_integer(char) end)
  end

end
