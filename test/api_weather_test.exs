defmodule ApiWeatherTest do
  use ExUnit.Case
  doctest ApiWeather

  test "greets the world" do
    assert ApiWeather.hello() == :world
  end
end
