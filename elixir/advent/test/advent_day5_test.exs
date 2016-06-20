defmodule AdventDay5Test do
  use ExUnit.Case
  doctest AdventDay5

  test "find nice names on a long list" do
    {:ok, data} = File.read("../../input/day5_input")
    count = AdventDay5.count_nice_names(data)
    assert count == 236
  end
end
