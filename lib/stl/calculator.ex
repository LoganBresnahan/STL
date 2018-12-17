defmodule STL.Calculator do
  @moduledoc """
  A module used to run various calculations on
  passed in triangles in vertex form.

  Example input:
  [
    ["vertex 0 0 0", "vertex 1 0 0", "vertex 1 1 1"], 
    ["vertex 0 0 0", "vertex 0 1 1", "vertex 1 1 1"]
  ]
  """
  @vertext "vertex "

  def total_triangles(vertices) do
    Enum.count(vertices)
  end

  def total_surface_area([], acc), do: acc
  def total_surface_area([head | tail], acc) do
    [@vertext<>one, @vertext<>two, @vertext<>three] = head
    
    [x1, y1, _z1] = create_decimals(one)
    [x2, y2, _z2] = create_decimals(two)
    [x3, y3, _z3] = create_decimals(three)

    single_result = 
      single_triangle_area(
        [{x1,y2},{x2,y3},{x3,y1}], 
        [{x1,y3},{x2,y1},{x3,y2}]
      )

    total_surface_area(tail, Decimal.add(acc, single_result))
  end

  defp create_decimals(values) do
    String.split(values, " ")
    |> Enum.reduce([], fn(vertex, acc) -> 
      acc ++ [Decimal.new(vertex)]
    end)
  end

  defp single_triangle_area(additives, subtractions) do
    Decimal.sub(add_decimals(0, additives), subtract_decimals(0, subtractions))
    |> Decimal.div(2)
  end

  defp add_decimals(acc, []), do: acc
  defp add_decimals(acc, [{v1, v2} | tail]) do
    Decimal.mult(v1, v2)
    |> Decimal.add(acc)
    |> add_decimals(tail)
  end

  defp subtract_decimals(acc, []), do: acc
  defp subtract_decimals(acc, [{v1, v2} | tail]) do
    Decimal.mult(v1, v2)
    |> Decimal.sub(acc)
    |> subtract_decimals(tail)
  end 
end