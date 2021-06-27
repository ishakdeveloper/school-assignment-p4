defmodule Web.Routes.Colors do
  import Plug.Conn
  use Plug.Router

  alias DB.PlantContext

  plug CORSPlug
  plug :match
  plug :dispatch

  get "/" do
    colors = PlantContext.get_colors()
    conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(colors))
  end
end
