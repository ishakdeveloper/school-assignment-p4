defmodule Web.Routes.Soorten do
  import Plug.Conn
  use Plug.Router

  alias DB.PlantContext

  plug CORSPlug
  plug :match
  plug :dispatch

  get "/" do
    soorten = PlantContext.get_soorten
    conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(soorten))
  end
end
