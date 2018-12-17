defmodule STL.MixProject do
  use Mix.Project

  def project do
    [
      app: :stl,
      version: "0.1.0",
      elixir: "~> 1.7",
      deps: deps(),
      escript: escript()
    ]
  end

  def deps do
    [
      {:decimal, "~> 1.6"}
    ]
  end

  def escript do
    [main_module: STL.CLI]
  end
end