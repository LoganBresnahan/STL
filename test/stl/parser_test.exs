defmodule STL.ParserTest do
  use ExUnit.Case
  alias STL.Parser

  describe "process/1" do
    test "when given a bad file it returns an :error tuple" do
      result = Parser.process("fake.stl")

      assert result == {:error, "fake.stl, cannot be read. enoent"}
    end

    test "when given a good file it returns an :ok tuple" do
      result = Parser.process("test/support/test.stl")

      assert result == 
        {
          :ok, 
          [
            ["vertex 0 0 0", "vertex 1 0 0", "vertex 1 1 1"], 
            ["vertex 0 0 0", "vertex 0 1 1", "vertex 1 1 1"]
          ]
        }
    end
  end
end