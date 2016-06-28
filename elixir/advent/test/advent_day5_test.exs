defmodule AdventDay5Test do
  use ExUnit.Case, async: true
  doctest AdventDay5

  describe "New and improved version" do
    alias AdventDay5.Improved

    test "find nice names in one long name" do
      count = Improved.count_nice_names("qjhvhtzxzqqjkmpb")
      assert count == 1
    end

    test "finds nice names in one short name" do
      count = Improved.count_nice_names("xxyxx")
      assert count == 1
    end

    test "does not find a nice name even though there is a pair" do
      count = Improved.count_nice_names("uurcxstgmygtbstg")
      assert count == 0
    end

    test "does not find a nice name even though there is a gap pair" do
      count = Improved.count_nice_names("ieodomkazucvgmuy")
      assert count == 0
    end

    test "find nice names on a long list" do
      {:ok, data} = File.read("../../input/day5_input")
      count = Improved.count_nice_names(data)
      assert count == 0
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

