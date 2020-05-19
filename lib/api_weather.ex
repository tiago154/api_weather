defmodule ApiWeather.Router do
  use Plug.Router
  alias ApiWeather.Plug.ResponseContentType

  @welcome_message "Welcome to ApiWeather!"

  plug(:match)
  plug(ResponseContentType)
  plug(:dispatch)

  get "/" do
    version = "\nversion: #{:application.get_key(:api_weather, :vsn) |> elem(1)}"
    send_resp(conn, 200, @welcome_message <> version)
  end

  forward("/city/:city", to: ApiWeather.Controllers.City)

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end
end
