defmodule WarukaniEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :warukani_ex,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "A wrapper for Wanikani",
      package: package(),
      name: "WarukaniEx",
      source_url: "https://github.com/swarut/warukani_ex"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:poison, "~> 3.1"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package() do
    [
      maintainers: ["Warut Surapat"],
      licenses: ["MIT"],
      links: %{"Github" =>"https://github.com/swarut/warukani_ex"}
    ]
  end
end
