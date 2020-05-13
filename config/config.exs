use Mix.Config

config :api_weather,
  service_weather: ApiWeather.Services.Weather

import_config "#{Mix.env()}.exs"
