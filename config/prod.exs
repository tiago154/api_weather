import Config

config :api_weather,
  port: System.get_env("PORT"),
  weather_api_key: System.get_env("APPID")
