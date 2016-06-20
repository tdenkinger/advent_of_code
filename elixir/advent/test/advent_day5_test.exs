defmodule AdventDay5Test do
  use ExUnit.Case
  doctest AdventDay5

  test "recognizes a nice name" do
    status = AdventDay5.is_nice?("ugknbfddgicrmopn")
    assert status == true
  end

  test "recognizes a naughty name" do
    status = AdventDay5.is_nice?("ugknbfddgicrmopqn")
    assert status == false
  end

  test "treats 'ab, cd, pq, xy' pairs as naughty" do
    status = AdventDay5.no_naughty_pairs?("haegwjzuvuyypxyu")
    assert status == false
  end

  test "knows when there are no naughty pairs" do
    status = AdventDay5.no_naughty_pairs?("haegwjzuvuyypxu")
    assert status == true
  end

  test "requires three vowels o be nice" do
    status = AdventDay5.has_enough_vowels?("aeaixt")
    assert status == true
  end

  test "requires a repeated pair of letters" do
    status = AdventDay5.has_repeated_letters?("abcdde")
    assert status == true
  end

  test "find nice names on a long list" do
    {:ok, data} = File.read("../../input/day5_input")
    count = AdventDay5.count_nice_names(data)
    assert count == 236
  end
end
