defmodule ApiWeather.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: ApiWeather.Router, options: [port: getPort()]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ApiWeather.Supervisor]

    Logger.info("Starting application... http://localhost:#{getPort()}")
    Supervisor.start_link(children, opts)
  end

  defp getPort, do: Application.get_env(:api_weather, :port) |> String.to_integer()
end
