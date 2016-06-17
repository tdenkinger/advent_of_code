defmodule AdventDay3 do
  @meat_santa 0
  @robo_santa 1

  def robo_deliver(moves \\ "") do
    santa_moves = robo_deliver(@meat_santa, moves)
    robo_moves  = robo_deliver(@robo_santa, moves)

    santa_moves ++ robo_moves |> count_deliveries
  end

  def deliver(moves \\ "") do
    moves
    |> parse_moves
    |> make_moves
    |> count_deliveries
  end

  defp robo_deliver(santa_type, moves) do
    moves
    |> parse_moves
    |> extract_moves(santa_type)
    |> make_moves
  end

  defp extract_moves(moves, odd_even) do
    moves
    |> Enum.with_index(1)
    |> Enum.filter(fn({_, i}) -> rem(i, 2) == odd_even end)
    |> Enum.map(fn(x) -> elem(x, 0) end)
  end

  defp count_deliveries(deliveries) do
    deliveries
    |> Enum.uniq
    |> Enum.count
  end

  defp make_moves(moves) do
    moves
    |> Enum.reduce([{0,0}], fn(moves, acc) -> make_move(moves, acc) end)
  end

  defp parse_moves(moves) do
    moves
    |> String.strip
    |> String.split("", trim: :true)
  end

  defp make_move(move, deliveries) do
    deliveries ++ get_location(move, List.last(deliveries))
  end

  defp get_location(">", {x, y}), do: [{x+1, y}]
  defp get_location("<", {x, y}), do: [{x-1, y}]
  defp get_location("^", {x, y}), do: [{x, y+1}]
  defp get_location("v", {x, y}), do: [{x, y-1}]
  defp get_location(_,   {x, y}), do: [{x, y}]
end
