defmodule ApiWeather.Services.Weather do
  @behaviour Service

  def request(url) do
    HTTPoison.get!(url)
  end
end
