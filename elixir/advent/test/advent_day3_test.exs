defmodule AdventDay3Test do
  use ExUnit.Case
  doctest AdventDay3

  test "tracks the single delivery" do
    delivery_count = AdventDay3.deliver
    assert delivery_count == 1
  end

  test "tracks more than the initial delivery" do
    delivery_count = AdventDay3.deliver(">")
    assert delivery_count == 2
  end

  test "strips white space and line breaks" do
    delivery_count = AdventDay3.deliver(" >\n")
    assert delivery_count == 2
  end

  test "ignores invalid moves" do
    delivery_count = AdventDay3.deliver("4>y")
    assert delivery_count == 2
  end

  test "tracks several deliveries that do not overlap" do
    delivery_count = AdventDay3.deliver("^>v")
    assert delivery_count == 4
  end

  test "tracks several deliveries that do overlap" do
    delivery_count = AdventDay3.deliver("^>v<")
    assert delivery_count == 4
  end

  test "tracks a large delivery" do
    {:ok, data} = File.read("../../input/day3_input")
    delivery_count = AdventDay3.deliver(data)
    assert delivery_count == 2081
  end
end
