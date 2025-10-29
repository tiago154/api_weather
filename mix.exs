defmodule ApiWeather.MixProject do
  use Mix.Project

  def project do
    [
      app: :api_weather,
      version: "0.1.0",
      elixir: "~> 1.19.1",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "ApiWeather",
      source_url: "https://github.com/tiago154/api_weather",
      homepage_url: "https://github.com/tiago154/api_weather",
      docs: [
        extras: ["README.md"]
      ],

      # Tests
      test_coverage: [tool: ExCoveralls],
      elixirc_options: [warnings_as_errors: true],
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  def application do
    [
      extra_applications: [:logger, :plug_cowboy, :httpoison],
      mod: {ApiWeather.Application, []}
    ]
  end

  def cli do
    [
      preferred_envs: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:plug_cowboy, "~> 2.7"},
      {:httpoison, "~> 2.2"},
      {:earmark, "~> 1.2"},
      {:ex_doc, "~> 0.30", only: :dev, runtime: false},
      {:excoveralls, "~> 0.15", only: :test},
      {:mock, "~> 0.3.4", only: :test},
      {:mox, "~> 0.5.2", only: :test}
    ]
  end
end
