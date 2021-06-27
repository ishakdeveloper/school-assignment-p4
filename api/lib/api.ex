defmodule Api do
  # Register routes, plug etc.
  import Plug.Conn
  use Plug.Router

  alias Web.Routes.Plants
  alias Web.Routes.PlantInfo
  alias Web.Routes.Bestelling
  alias Web.Routes.Bestelregel
  alias Web.Routes.Leverancier
  alias Web.Routes.LevAssortiment
  alias Web.Routes.Colors
  alias Web.Routes.Soorten

  plug Plug.Parsers, parsers: [:urlencoded, :multipart, :json], pass: ["application/json"], json_decoder: Jason

  plug :match
  plug :dispatch

  # TODO: Misschien API Versioning toevoegen
  forward "/plants", to: Plants
  forward "/plant_info", to: PlantInfo
  forward "/bestelling", to: Bestelling
  forward "/bestelregel", to: Bestelregel
  forward "/leverancier", to: Leverancier
  forward "/lev_assortiment", to: LevAssortiment
  forward "/colors", to: Colors
  forward "/soorten", to: Soorten

  get "/" do
    conn |> send_resp(200, Jason.encode!(%{message: "Homepagina."}))
  end

  match _ do
    send_resp(conn, 404, "Pagina niet gevonden.")
  end
end
