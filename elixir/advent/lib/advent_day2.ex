defmodule AdventDay2 do
  def get_paper_required(dimensions) do
    dimensions
    |> extract_package_dimensions
    |> Enum.reduce(0, fn(dims, acc) -> calculate_package_areas(dims, acc) end)
  end

  def get_ribbon_required(dimensions) do
    dimensions
    |> extract_package_dimensions
    |> Enum.reduce(0, fn(dims, acc) -> calculate_ribbon_length(dims, acc) end)
  end

  defp extract_package_dimensions(package_list) do
    package_list
    |> String.split("\n", trim: :true)
    |> Enum.map(fn(x) -> parse_dimensions(x) end)
  end

  defp parse_dimensions(dimensions) do
    dimensions
    |> String.split("x")
    |> Enum.map(fn(x) -> String.to_integer(x) end)
    |> Enum.sort
  end

  defp calculate_ribbon_length(dimensions, total_length) do
    total_length +
    calculate_raw_length(dimensions) +
    calculate_extra_length(dimensions)
  end


  defp calculate_package_areas(dimensions, total_area) do
    total_area +
    calculate_raw_area(dimensions) +
    calculate_extra_area(dimensions)
  end

  defp calculate_raw_length([l, w, _]), do: (2 * l) + (2 * w)

  defp calculate_extra_length([l, w, h]), do: l * w * h

  defp calculate_raw_area([l, w, h]), do: 2 * (( l * w) + (w * h) + (h * l))

  defp calculate_extra_area([a, b, _]), do: a * b
end
