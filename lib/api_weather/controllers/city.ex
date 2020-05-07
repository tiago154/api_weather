defmodule ApiWeather.Controllers.City do
  import Plug.Conn

  @url_api_weather "http://api.openweathermap.org/data/2.5/weather?q="
  @appid Application.get_env(:api_weather, :weather_api_key)

  def init(options), do: options

  def call(conn, _opts) do
    cond do
      conn.method == "GET" -> get(conn)
      true -> send_resp(conn, 405, "Method Not Allowed")
    end
  end

  defp get(conn) do
    city = conn.params["city"]
    response = build_url(@url_api_weather, city, @appid) |> HTTPoison.get!
    send_resp(conn,200, response.body)
  end

  defp build_url(base_path, city, appid), do: "#{base_path}#{city}&APPID=#{appid}"
end
