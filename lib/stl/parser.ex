
defmodule STL.Parser do
  @moduledoc """
  A module used for parsing necessary information
  from an STL file.
  """
  @vertex_match ~r{vertex.*\d}

  def process(file) do
    File.read(file)
    |> handle_raw_data(file)
  end

  defp handle_raw_data({:error, error}, file) do
    {:error, "#{file}, cannot be read. #{error}"}
  end
  defp handle_raw_data({:ok, raw_data}, _file) do 
    {
      :ok,
      Regex.scan(@vertex_match, raw_data)
      |> Stream.flat_map(&(&1))
      |> Stream.chunk_every(3)
      |> Enum.to_list()
    }
  end
end