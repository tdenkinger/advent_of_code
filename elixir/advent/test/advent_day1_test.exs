defmodule AdventDay1Test do
  use ExUnit.Case
  doctest AdventDay1

  test "can successfully move up" do
    final_floor = AdventDay1.final_floor(0, "(((")
    assert final_floor == 3
  end

  test "can successfully move down" do
    final_floor = AdventDay1.final_floor(0, ")))")
    assert final_floor == -3
  end

  test "can successfully count up and down moves together" do
    final_floor = AdventDay1.final_floor(0, "(((((((()))((((()(" )
    assert final_floor == 10
  end

  test "can count a large number of floors" do
    {:ok, data} = File.read("test/data/day1_input")
    final_floor = AdventDay1.final_floor(0, String.trim(data))
    assert final_floor == 138
  end

  test "can handle a single down move" do
    basement_move = AdventDay1.enter_basement(")")
     assert basement_move == 1
  end

  test "can handle multiple moves" do
    basement_move = AdventDay1.enter_basement("())")
     assert basement_move == 3
  end

  test "can handle never entering the basement" do
    basement_move = AdventDay1.enter_basement("((")
    assert basement_move == {:error,  :never_entered_basement}
  end

  test "can handle a large set of data" do
    {:ok, data} = File.read("test/data/day1_input")
    basement_move = AdventDay1.enter_basement(String.trim(data))
    assert basement_move == 1771
  end
end

