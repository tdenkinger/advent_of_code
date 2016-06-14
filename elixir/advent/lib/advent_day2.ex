defmodule AdventDay2 do
  def get_paper_required(dimensions) do
    dimensions
    |> String.split("\n", trim: :true)
    |> Enum.map(fn(x) -> parse_dimensions(x) end)
    |> Enum.reduce(0, fn(dims, acc) -> calculate_areas(dims, acc) end)
  end

  def parse_dimensions(dimensions) do
    String.split(dimensions, "x")
    |> Enum.map(fn(x) -> String.to_integer(x) end)
  end

  def calculate_areas(dimensions, total_area) do
    total_area + calculate_raw_area(dimensions) + calculate_extra(dimensions)
  end

  def calculate_raw_area([l, w, h]) do
    (2 * l * w) + (2 * w * h) + (2 * h * l)
  end

  def calculate_extra([a, b, _]), do: a * b
end
