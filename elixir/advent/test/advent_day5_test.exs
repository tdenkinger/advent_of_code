defmodule AdventDay5Test do
  use ExUnit.Case
  doctest AdventDay5

  test "find nice names in a one item list" do
    count = AdventDay5.count_nice_names("aaceijo")
    assert count == 1
  end

  test "does not find nice names when there aren't enough vowels" do
    count = AdventDay5.count_nice_names("tyyyya")
    assert count == 0
  end

  test "does not find nice names when containing a naughty pair" do
    count = AdventDay5.count_nice_names("abeeci")
    assert count == 0
  end

  test "does not find nice names when no repating letters" do
    count = AdventDay5.count_nice_names("aybeci")
    assert count == 0
  end

  test "find nice names on a long list" do
    {:ok, data} = File.read("../../input/day5_input")
    count = AdventDay5.count_nice_names(data)
    assert count == 236
  end
end
