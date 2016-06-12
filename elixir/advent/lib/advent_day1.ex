defmodule AdventDay1 do
  def final_floor(starting_position, move_list) do
    move_list
    |> String.split("", trim: :true)
    |> track_floors(starting_position)
  end

  def enter_basement(move_list) do
    move_list
    |> String.split("", trim: :true)
    |> find_basement_move(0, 0)
  end

  defp find_basement_move(_, position, floor) when floor < 0, do: position

  defp find_basement_move([h | t], position, floor) when h == "(" do
     find_basement_move(t, position + 1, floor + 1)
  end

  defp find_basement_move([h | t], position, floor) when h == ")" do
     find_basement_move(t, position + 1, floor - 1)
  end

  defp find_basement_move([], _, _), do: {:error, :never_entered_basement}

  defp track_floors([], position), do: position

  defp track_floors([h | t], position) when h == "(" do
    track_floors(t, position + 1)
  end

  defp track_floors([h | t], position) when h == ")" do
    track_floors(t, position - 1)
  end
end
