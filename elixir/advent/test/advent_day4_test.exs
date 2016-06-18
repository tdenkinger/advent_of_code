defmodule AdventDay4Test do
  use ExUnit.Case
  doctest AdventDay4

  test "finds the first adventcoin" do
    coin = AdventDay4.run('ckczppom')
    assert coin == 609043
  end
end
