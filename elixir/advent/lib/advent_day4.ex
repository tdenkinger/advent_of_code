defmodule AdventDay4 do
  def run(secret, size) do
    find_coin(false, secret, size, 0)
  end

  def find_coin(true, _, _, suffix), do: suffix

  def find_coin(false, secret, size, suffix) do
    suffix = suffix + 1
    create_hash(secret, suffix)
    |> test_hash_for_coin(size)
    |> find_coin(secret, size, suffix)
  end

  def test_hash_for_coin(hash, size), do: Regex.match?(~r/^0{#{size}}/, hash)

  def create_hash(secret, suffix) do
    :crypto.hash(:md5, "#{secret}#{suffix}")
    |> Base.encode16(case: :lower)
  end
end
