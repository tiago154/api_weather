defmodule ApiWeatherTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias ApiWeather.Router

  import Mox

  setup :verify_on_exit!

  @opts Router.init([])

  test "/ returns welcome" do
    expected_body = "Welcome to ApiWeather!\nversion: 0.1.0"

    response = conn(:get, "/") |> Router.call(@opts)

    assert response.status == 200
    assert response.resp_body == expected_body
  end

  test "/*random* page return 404" do
    expected_body = "Requested page not found!"

    response = conn(:get, "/random") |> Router.call(@opts)

    assert response.status == 404
    assert response.resp_body == expected_body
  end

  test "/city:city must call route correctly" do
    ServiceMock
    |> expect(:request, fn _url -> %HTTPoison.Response{body: "test"} end)

    expected_body = "test"

    response = conn(:get, "/city/c") |> Router.call(@opts)

    assert response.status == 200
    assert response.resp_body == expected_body
  end
end
