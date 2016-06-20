defmodule AdventDay5 do
  def count_nice_names(name_list) do
    name_list
    |> String.split("\n", trim: :true)
    |> Enum.filter(fn(name) -> is_nice?(name) == true end)
    |> Enum.count
  end

  defp is_nice?(name) do
       no_naughty_pairs?(name)
    && has_enough_vowels?(name)
    && has_repeated_letters?(name)
  end

  defp no_naughty_pairs?(name) do
    ! String.contains?(name, ["ab", "cd", "pq", "xy"])
  end

  defp has_enough_vowels?(name) do
    split_name(name)
    |> Enum.filter(fn(letter) -> String.contains?("aeiou", letter) end)
    |> Enum.count >= 3
  end

  defp split_name(name) do
    name |> String.split("", trim: :true)
  end

  defp has_repeated_letters?(name) do
    total_count   = split_name(name) |> Enum.count
    deduped_count = split_name(name) |> Enum.dedup |> Enum.count

    deduped_count < total_count
  end
end
