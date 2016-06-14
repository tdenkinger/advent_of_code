defmodule AdventDay2Test do
  use ExUnit.Case
  doctest AdventDay2

  test "figures the amount of paper for one package" do
    paper_total = AdventDay2.get_paper_required("4x3x2")
    assert paper_total == 58
  end

  test "figures the amount of paper for more than one package" do
    paper_total = AdventDay2.get_paper_required("2x3x4\n2x4x3")
    assert paper_total == 116
  end

  test "figures the amount of paper for all packages" do
    {:ok, data} = File.read("../../input/day2_input")
    paper_total = AdventDay2.get_paper_required(data)
    assert paper_total == 1586300
  end

  test "figures the amount of ribbon for one package" do
    ribbon_total = AdventDay2.get_ribbon_required("2x4x3")
    assert ribbon_total == 34
  end

  test "figures the amount of ribbon for more than one package" do
    ribbon_total = AdventDay2.get_ribbon_required("2x4x3\n3x2x4")
    assert ribbon_total == 68
  end

  test "figures the amount of ribbon for all packages" do
    {:ok, data} = File.read("../../input/day2_input")
    paper_total = AdventDay2.get_ribbon_required(data)
    assert paper_total == 3737498
  end

end

