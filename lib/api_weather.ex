defmodule ApiWeather.Router do
  use Plug.Router
  alias ApiWeather.Plug.ResponseContentType

  @welcome_message "Welcome to ApiWeather!"

  plug(Plug.Static, at: "/docs", from: {:api_weather, "priv/static/doc/"})
  plug(:match)
  plug ResponseContentType
  plug(:dispatch)

  get "/" do
    version = "\nversion: #{:application.get_key(:api_weather, :vsn) |> elem(1)}"
    send_resp(conn, 200, @welcome_message <> version)
  end

  get "/docs" do
    conn
    |> put_resp_header("location", "/docs/index.html")
    |> send_resp(302, "/docs")
  end

  forward("/city/:city", to: ApiWeather.Controllers.City)

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end
end
