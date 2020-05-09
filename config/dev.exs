use Mix.Config

config :api_weather,
  port: System.get_env("PORT", "4001"),
  weather_api_key: System.get_env("APPID")
