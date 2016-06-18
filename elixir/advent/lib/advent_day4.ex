defmodule AdventDay4 do
  def run(secret) do
    find_coin(false, secret, 0)
  end

  def find_coin(true, _, suffix), do: suffix

  def find_coin(false, secret, suffix) do
    suffix = suffix + 1
    create_hash(secret, suffix)
    |> test_hash_for_coin
    |> find_coin(secret, suffix)
  end

  def test_hash_for_coin(hash), do: Regex.match?(~r/^0{5}/, hash)

  def create_hash(secret, suffix) do
    :crypto.hash(:md5, "#{secret}#{suffix}")
    |> Base.encode16(case: :lower)
  end
end
