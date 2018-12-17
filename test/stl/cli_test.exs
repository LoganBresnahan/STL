defmodule STL.CLITest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias STL.CLI

  describe "main/1" do
    test "when given an empty list it outputs a message" do
      assert capture_io(fn ->
        CLI.main([])
      end) =~ "Operation Finished"
    end

    test "when given a list of non-stl files it outputs a message" do
      assert capture_io(fn -> 
        CLI.main(["test.txt"])
      end) =~ "test.txt is not an STL file"
    end

    test "when given a list of bad stl files it outputs a message" do
      assert capture_io(fn -> 
        CLI.main(["fake.stl"])
      end) =~ "fake.stl, cannot be read"
    end

    test "when given a list of good stl files it outputs a message" do
      assert capture_io(fn -> 
        CLI.main(["test/support/test.stl"])
      end) =~ "Total Triangles 2\nTotal Surface Area 0.0"
    end 
  end
end