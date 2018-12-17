defmodule STL.CLI do
  alias STL.{Parser, Calculator}

  @moduledoc """
  The CLI handler for IO operations
  """
  @stl_file_match ~r{^.*\.stl$}
  @seperator "*******************"

  @doc """
  main/1 The public facing function. This
  function is invoked when the escript is 
  executed in the CLI.
  """
  def main(args \\ []) do
    run(args)
  end

  defp run([]), do: IO.puts "Operation Finished"
  defp run([head | tail]) do
    match_stl?(head)
    |> serve_file_output(head)

    run(tail)
  end

  defp serve_file_output(true, file) do
    Parser.process(file)
    |> case do
      {:ok, vertices} ->
        IO.puts "#{file}"
        IO.puts "Total Triangles #{Calculator.total_triangles(vertices)}"
        IO.puts "Total Surface Area #{Calculator.total_surface_area(vertices, 0)}"
        IO.puts @seperator
      {:error, error} ->
        IO.inspect error
        IO.puts @seperator
    end
  end
  defp serve_file_output(false, file) do
    IO.inspect "#{file} is not an STL file"
    IO.puts @seperator
  end

  defp match_stl?(file) do
    Regex.match?(@stl_file_match, file)
  end
end