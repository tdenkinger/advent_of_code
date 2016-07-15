defmodule AdventDay5 do
  def split_name(name) do
    name |> String.split("", trim: true)
  end
end

defmodule AdventDay5.Improved do
  def count_nice_names(name_list) do
    name_list
    |> String.split("\n", trim: :true)
    |> Enum.filter(fn(name) -> is_nice?(name) == true end)
    |> Enum.count
  end

  defp is_nice?(name) do
    repeating_pair?(name) && gap_pair?(name)
  end

  def gap_pair?(name) do
    name
    |> AdventDay5.split_name
    |> find_gap_pair(false)
  end

  def repeating_pair?(name) do
    name
    |> AdventDay5.split_name
    |> matching_pairs?
  end

  defp find_gap_pair(_, true), do: true

  defp find_gap_pair([], false), do: false

  defp find_gap_pair([h | t], false) do
    cond do
      h == Enum.at(t, 1) -> find_gap_pair(t, true)
      true               -> find_gap_pair(t, false)
    end
  end

  defp matching_pairs?(name_list) do
    name_list
    |> extract_pairs([])
    |> check_for_matching_pairs
  end

  defp check_for_matching_pairs(pairs) do
    Enum.dedup(pairs) != Enum.uniq(pairs)
  end

  defp extract_pairs([], acc), do: acc

  defp extract_pairs([h | t], acc) do
    extract_pairs t, List.insert_at(acc, 0, [h, Enum.at(t, 0)])
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

