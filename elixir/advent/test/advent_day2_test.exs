defmodule AdventDay2Test do
  use ExUnit.Case
  doctest AdventDay2

  test "figures the amount of paper for one package" do
    paper_total = AdventDay2.get_paper_required("2x3x4")
    assert paper_total == 58
  end

  test "figures the amount of paper for more than one package" do
    paper_total = AdventDay2.get_paper_required("2x3x4\n2x3x4")
    assert paper_total == 116
  end

  test "figures the amount of paper for all packages" do
    {:ok, data} = File.read("../../input/day2_input")
    paper_total = AdventDay2.get_paper_required(data)
    assert paper_total == 1
  end
end

