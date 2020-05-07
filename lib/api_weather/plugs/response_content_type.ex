defmodule ApiWeather.Plug.ResponseContentType do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts), do: put_resp_content_type(conn,"application/json")
end
