defmodule AdventDay5Test do
  use ExUnit.Case, async: true
  doctest AdventDay5

  ExUnit.configure exclude: :pending, trace: true

  describe "New and improved version" do
    alias AdventDay5.Improved

    test "has more than one repeating pair, at beginning" do
      has_a_repeating_pair = Improved.repeating_pair?("qjhvhtzxzqqjkmpb")
      assert has_a_repeating_pair == true
    end

    test "has more than one repeating pair, one letter in" do
      has_a_repeating_pair = Improved.repeating_pair?("aqjhvhtzxzqqjkmpb")
      assert has_a_repeating_pair == true
    end
  end

  describe "Original version" do
    alias AdventDay5.Original

    @tag :pending
    test "find nice names in a one item list" do
      count = Original.count_nice_names("aaceijo")
      assert count == 1
    end

    @tag :pending
    test "does not find nice names when there aren't enough vowels" do
      count = Original.count_nice_names("tyyyya")
      assert count == 0
    end

    @tag :pending
    test "does not find nice names when containing a naughty pair" do
      count = Original.count_nice_names("abeeci")
      assert count == 0
    end

    @tag :pending
    test "does not find nice names when no repating letters" do
      count = Original.count_nice_names("aybeci")
      assert count == 0
    end

    @tag :pending
    test "find nice names on a long list" do
      {:ok, data} = File.read("../../input/day5_input")
      count = Original.count_nice_names(data)
      assert count == 236
    end
  end

  describe "Deprecated stuff" do
    alias AdventDay5.Deprecated

    test "has a single repeated pair of letters" do
      count = Deprecated.test_pairs(["x","x"])
      assert count == 1
    end

    test "has a single un-overlapping repeated pair of letters" do
      count = Deprecated.test_pairs(["x","x","x"])
      assert count == 1
    end

    test "has multiple repeated pairs of letters" do
      count = Deprecated.test_pairs(["x","x","y","y"])
      assert count == 2
    end

    test "has separate, multiple repeated pairs of letters" do
      count = Deprecated.test_pairs(["x","x","a","y","y"])
      assert count == 2
    end
  end
end


