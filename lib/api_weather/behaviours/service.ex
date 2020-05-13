defmodule Service do
  @callback request(url :: String.t()) :: map()
end
