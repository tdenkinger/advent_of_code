defmodule AdventDay5Test do
  use ExUnit.Case, async: true
  doctest AdventDay5

  describe "New and improved version" do
    alias AdventDay5.Improved

    test "identifies a pair with a one-character gap, short string" do
      has_gap_pair = Improved.gap_pair?("xyx")
      assert has_gap_pair == true
    end

    test "identifies a pair with a one-character gap, long string" do
      has_gap_pair = Improved.gap_pair?("abcdefeghi")
      assert has_gap_pair == true
    end

    test "identifies a pair with a one-character gap, with matching gap" do
      has_gap_pair = Improved.gap_pair?("aaa")
      assert has_gap_pair == true
    end

    test "identifies a string without a gapped pair" do
      has_gap_pair = Improved.gap_pair?("aabcqrst")
      assert has_gap_pair == false
    end

    test "has more than one repeating pair, at beginning" do
      has_a_repeating_pair = Improved.repeating_pair?("qjhvhtzxzqqjkmpb")
      assert has_a_repeating_pair == true
    end

    test "has more than one repeating pair, not at start of string" do
      has_a_repeating_pair = Improved.repeating_pair?("aqjhvhtzxzqqjkmpb")
      assert has_a_repeating_pair == true
    end

    test "has only one non-overlapping pair" do
      has_a_repeating_pair = Improved.repeating_pair?("aaa")
      assert has_a_repeating_pair == false
    end
  end

  describe "Original version" do
    alias AdventDay5.Original

    test "find nice names in a one item list" do
      count = Original.count_nice_names("aaceijo")
      assert count == 1
    end

    test "does not find nice names when there aren't enough vowels" do
      count = Original.count_nice_names("tyyyya")
      assert count == 0
    end

    test "does not find nice names when containing a naughty pair" do
      count = Original.count_nice_names("abeeci")
      assert count == 0
    end

    test "does not find nice names when no repating letters" do
      count = Original.count_nice_names("aybeci")
      assert count == 0
    end

    test "find nice names on a long list" do
      {:ok, data} = File.read("../../input/day5_input")
      count = Original.count_nice_names(data)
      assert count == 236
    end
  end
end

