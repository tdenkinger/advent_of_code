defmodule AdventDay4Test do
  use ExUnit.Case
  doctest AdventDay4

  test "finds the first five-zero adventcoin" do
    coin = AdventDay4.run('ckczppom', 5)
    assert coin == 117946
  end

  test "finds the first six-zero adventcoin" do
    coin = AdventDay4.run('ckczppom', 6)
    assert coin == 3938038
  end
end
