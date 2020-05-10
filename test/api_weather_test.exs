defmodule ApiWeatherTest do
  use ExUnit.Case
  use Plug.Test
  doctest ApiWeather.Router

  alias ApiWeather.Router

  @opts Router.init([])

  test "/ returns welcome" do
    expected_body = "Welcome to ApiWeather!\nversion: 0.1.0"

    response = conn(:get, "/") |> Router.call(@opts)

    assert response.status == 200
    assert response.resp_body == expected_body
  end

  test "/docs redirect to documentation" do
    expected_body = "/docs"

    expected_headers = [
      {"cache-control", "max-age=0, private, must-revalidate"},
      {"content-type", "application/json; charset=utf-8"},
      {"location", "/docs/index.html"}
    ]

    response = conn(:get, "/docs") |> Router.call(@opts)

    assert response.status == 302
    assert response.resp_body == expected_body
    assert response.resp_headers == expected_headers
  end

  test "/*random* page return 404" do
    expected_body = "Requested page not found!"

    response = conn(:get, "/random") |> Router.call(@opts)

    assert response.status == 404
    assert response.resp_body == expected_body
  end

  # Verificar lib https://hexdocs.pm/mox/Mox.html
  @tag runnable: false
  test "/city returns welcome" do
    expected_body = ""

    response = conn(:get, "/city/c") |> Router.call(@opts)

    assert response.status == 200
    assert response.resp_body == expected_body
  end
end
