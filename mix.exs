defmodule Sugar.Mixfile do
  use Mix.Project

  def project do
    [ app: :sugar,
      elixir: "~> 1.2",
      version: "0.5.0",
      name: "Sugar",
      source_url: "https://github.com/sugar-framework/sugar",
      homepage_url: "https://sugar-framework.github.io",
      deps: deps(),
      package: package(),
      description: description(),
      docs: [readme: "README.md", main: "README"],
      test_coverage: [tool: ExCoveralls] ]
  end

  def application do
    [ applications: [ :cowboy, :plug, :templates, :poison, :plugs ],
      mod: { Sugar.App, [] } ]
  end

  defp deps do
    [ { :cowboy, "~> 1.0" },
      { :plug, "~> 1.5.0" },
      { :http_router, "~> 0.10.0" },
      { :poison, "~> 3.1.0" },
      { :plugs, "~> 0.1" },
      { :templates, github: "pct/templates" },
      { :earmark, "~> 1.2.4", only: :docs },
      { :ex_doc, "~> 0.18.3", only: :docs },
      { :excoveralls, "~> 0.8.1", only: :test },
      { :dialyze, "~> 0.2.1", only: :test } ]
  end

  defp description do
    """
    Modular web framework
    """
  end

  defp package do
    %{maintainers: ["Shane Logsdon", "Ryan S. Northrup"],
      files: ["lib",  "mix.exs", "README.md", "LICENSE"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/sugar-framework/sugar",
               "Docs" => "https://sugar-framework.github.io/docs/"}}
  end
end
