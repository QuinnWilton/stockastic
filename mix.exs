defmodule Stockastic.Mixfile do
  use Mix.Project

  def project do
    [app: :stockastic,
     version: "0.0.2",
     elixir: "~> 1.1",
     name: "Stockastic",
     description: "Simple Elixir wrapper for the Stockfighter API",
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.8"},
      {:exjsx, "~> 3.2.0"},
      {:earmark, "~> 0.1", only: :docs},
      {:ex_doc, "~> 0.11", only: :docs},
    ]
  end

  defp package do
    [
      maintainers: ["Shane Wilton"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/shanewilton/stockastic"}
    ]
  end
end
