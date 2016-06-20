defmodule AdventDay5 do
  def count_nice_names(name_list) do
    name_list
    |> String.split("\n", trim: :true)
    |> Enum.filter(fn(name) -> is_nice?(name) == true end)
    |> Enum.count
  end

  def is_nice?(name) do
       no_naughty_pairs?(name)
    && has_enough_vowels?(name)
    && has_repeated_letters?(name)
  end

  def no_naughty_pairs?(name) do
    ! String.contains?(name, ["ab", "cd", "pq", "xy"])
  end

  def has_enough_vowels?(name) do
    name
    |> String.split("", trim: :true)
    |> Enum.filter(fn(x) -> String.contains?("aeiou", x) end)
    |> Enum.count >= 3
  end

  def has_repeated_letters?(name) do
    raw_count = name
    |> String.split("", trim: :true)
    |> Enum.count

    deduped_count = name
    |> String.split("", trim: :true)
    |> Enum.dedup
    |> Enum.count

    deduped_count < raw_count
  end
end
