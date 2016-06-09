defmodule AdventDay1 do
  def final_floor(starting_position, move_list) do
    move_list
    |> String.split("", trim: :true)
    |> track_floors(starting_position)
  end

  defp track_floors([], position), do: position

  defp track_floors([h | t], position) when h == "(" do
    track_floors(t, position + 1)
  end

  defp track_floors([h | t], position) when h == ")" do
    track_floors(t, position - 1)
  end
end
