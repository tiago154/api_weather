defmodule ApiWeather.Controllers.City do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    cond do
      conn.method == "GET" -> get(conn)
      true -> send_resp(conn, 405, "Method Not Allowed")
    end
  end

  # case HTTPoison.get(url) do
  #   {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
  #     IO.puts body
  #   {:ok, %HTTPoison.Response{status_code: 404}} ->
  #     IO.puts "Not found :("
  #   {:error, %HTTPoison.Error{reason: reason}} ->
  #     IO.inspect reason
  # end
  defp get(conn) do
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{conn.path_params["city"]}&APPID=cb12f01fbb0a138642be7cc763645842"

    response = HTTPoison.get!(url)

    conn
    |> send_resp(200, response.body)
  end
end
