defmodule Web.Routes.Plants do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn |> send_resp(200, Jason.encode!(%{message: "Lorem Ipsum"}))
  end
end