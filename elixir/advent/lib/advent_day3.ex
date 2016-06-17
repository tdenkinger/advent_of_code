defmodule AdventDay3 do
  def robo_deliver(moves \\ "") do
    santa_moves = moves
    |> parse_moves
    |> extract_moves(1)
    |> make_moves

    robo_moves = moves
    |> parse_moves
    |> extract_moves(0)
    |> make_moves

    moves = santa_moves ++ robo_moves
    count_deliveries(moves)
  end

  def extract_moves(moves, odd_even) do
    moves
    |> Enum.with_index(1)
    |> Enum.filter(fn({_, i}) -> rem(i, 2) == odd_even end)
    |> Enum.map(fn(x) -> elem(x, 0) end)
  end

  def deliver(moves \\ "") do
    moves
    |> parse_moves
    |> make_moves
    |> count_deliveries
  end

  def count_deliveries(deliveries) do
    deliveries
    |> Enum.uniq
    |> Enum.count
  end

  def make_moves(moves) do
    moves
    |> Enum.reduce([{0,0}], fn(moves, acc) -> make_move(moves, acc) end)
  end

  def parse_moves(moves) do
    moves
    |> String.strip
    |> String.split("", trim: :true)
  end

  def make_move(move, deliveries) do
    deliveries ++ get_location(move, List.last(deliveries))
  end

  def get_location(">", {x, y}), do: [{x+1, y}]
  def get_location("<", {x, y}), do: [{x-1, y}]
  def get_location("^", {x, y}), do: [{x, y+1}]
  def get_location("v", {x, y}), do: [{x, y-1}]
  def get_location(_,   {x, y}), do: [{x, y}]
end
