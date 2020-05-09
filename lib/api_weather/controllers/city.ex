defmodule ApiWeather.Controllers.City do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  @url_api_weather "http://api.openweathermap.org/data/2.5/weather?units=metric&q="
  @appid :application.get_env(:api_weather, :weather_api_key) |> elem(1)

  get "/" do
    city = conn.params["city"]
    response = build_url(@url_api_weather, city, @appid) |> HTTPoison.get!()
    send_resp(conn, 200, response.body)
  end

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end

  defp build_url(base_path, city, appid), do: "#{base_path}#{city}&APPID=#{appid}"
end
