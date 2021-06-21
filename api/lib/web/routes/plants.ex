defmodule Web.Routes.Plants do
  import Plug.Conn
  use Plug.Router

  alias DB.PlantContext

  plug :match
  plug :dispatch

  get "/" do
    plants = PlantContext.get_plants()
    conn |> send_resp(200, Jason.encode!(%{plants: plants}))
  end
end
