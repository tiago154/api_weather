defmodule ApiWeather.Router do
  use Plug.Router

  alias ApiWeather.Plug.ResponseContentType

  plug(:match)
  plug ResponseContentType

  # plug(Plug.Parsers,
  #   parsers: [:json],
  #   pass: ["application/json"],
  #   json_decoder: Poison
  # )

  plug(:dispatch)

  get "/" do
    welcome_message = "Welcome to ApiWeather!\nversion: #{:application.get_key(:api_weather, :vsn) |> elem(1)}"
    send_resp(conn,200, welcome_message)
  end

  match("/city/:city", to: ApiWeather.Controllers.City)

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end
end
