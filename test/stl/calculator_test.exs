defmodule STL.CalculatorTest do
  use ExUnit.Case
  alias STL.Calculator

  @triangles [
    ["vertex 0 0 0", "vertex 1 0 0", "vertex 1 1 1"], 
    ["vertex 0 0 0", "vertex 0 1 1", "vertex 1 1 1"]
  ]

  describe "total_triangles/1" do
    test "when given a list of triangles in vertex form it returns the count" do
      result = Calculator.total_triangles(@triangles)

      assert result == 2
    end
  end

  describe "total_surface_area/2" do
    test "when given a list of triangles in vertex form it calculates the total surface area" do
      result = Calculator.total_surface_area(@triangles, 0)

      assert result == Decimal.new("0.0")
    end
  end
end