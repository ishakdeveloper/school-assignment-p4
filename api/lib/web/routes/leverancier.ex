defmodule Web.Routes.Leverancier do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn |> send_resp(200, Jason.encode!(%{message: "Lorem"}))
  end
end