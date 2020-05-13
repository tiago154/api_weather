defmodule ApiWeather.Controllers.CityTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias ApiWeather.Controllers.City

  import Mox

  setup :verify_on_exit!

  @opts City.init([])

  test "/ must call route correctly" do
    ServiceMock
    |> expect(:request, fn _url -> %HTTPoison.Response{body: "city test"} end)

    expected_body = "city test"

    response = conn(:get, "/", %{city: "c"}) |> City.call(@opts)

    assert response.status == 200
    assert response.resp_body == expected_body
  end

  test "/*random* page return 404" do
    expected_body = "Requested page not found!"

    response = conn(:get, "/random") |> City.call(@opts)

    assert response.status == 404
    assert response.resp_body == expected_body
  end
end
