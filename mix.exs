defmodule ApiWeather.MixProject do
  use Mix.Project

  def project do
    [
      app: :api_weather,
      version: "0.1.0",
      elixir: "~> 1.10.3",
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
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      elixirc_options: [warnings_as_errors: true],
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :plug_cowboy, :httpoison],
      mod: {ApiWeather.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:httpoison, "~> 1.6"},
      {:earmark, "~> 1.2"},
      {:ex_doc, "~> 0.19"},
      {:excoveralls, "~> 0.10", only: :test},
      {:mock, "~> 0.3.4", only: :test},
      {:mox, "~> 0.5.2", only: :test}
    ]
  end
end
