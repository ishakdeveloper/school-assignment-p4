defmodule Api do
  # Register routes, plug etc.
  import Plug.Conn
  use Plug.Router

  alias Web.Routes.Plants

  plug :match
  plug :dispatch

  plug Plug.Parsers, parsers: [:json], pass: ["application/json"], json_decoder: Jason

  # TODO: Misschien API Versioning toevoegen
  forward "/plants", to: Plants

  get "/" do
    conn |> send_resp(200, Jason.encode!(%{message: "Homepagina."}))
  end

  match _ do
    send_resp(conn, 404, "Pagina niet gevonden.")
  end
end
