defmodule AdventDay3 do
  def deliver(moves \\ "") do
    moves
    |> String.strip
    |> String.split("", trim: :true)
    |> Enum.reduce([{0,0}], fn(moves, acc) -> make_move(moves, acc) end)
    |> Enum.uniq
    |> Enum.count
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
