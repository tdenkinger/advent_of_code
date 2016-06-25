defmodule AdventDay5 do
  def split_name(name) do
    name |> String.split("", trim: true)
  end
end

defmodule AdventDay5.Improved do
  def test_pairs(name_list), do: test_pairs(name_list, 0)

  def test_pairs([], acc), do: acc

  def test_pairs([h | t], acc) do
    cond do
      next_pair_matches?(h, t) -> test_pairs(remove_matched_char(t, h), acc + 1)
      true -> test_pairs(t, acc)
    end
  end

  defp next_pair_matches?(letter, letters) do
    letter == Enum.at(letters, 0)
  end

  defp remove_matched_char(letters, match) do
    List.delete(letters, match)
  end

  def repeating_pairs(name) do
    name
    |> AdventDay5.split_name
    |> test_pairs
    |> IO.inspect
  end
end

defmodule AdventDay5.Original do
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
    AdventDay5.split_name(name)
    |> Enum.filter(fn(letter) -> String.contains?("aeiou", letter) end)
    |> Enum.count >= 3
  end

  defp has_repeated_letters?(name) do
    total_count   = AdventDay5.split_name(name) |> Enum.count
    deduped_count = AdventDay5.split_name(name) |> Enum.dedup |> Enum.count

    deduped_count < total_count
  end
end
