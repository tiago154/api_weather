import Config

config :api_weather,
  service_weather: ApiWeather.Services.Weather

import_config "#{config_env()}.exs"
