defmodule Web.Routes.Plants do
  import Plug.Conn
  use Plug.Router

  alias DB.PlantContext

  plug CORSPlug
  plug :match
  plug :dispatch

  get "/" do
    plants = PlantContext.get_plants()
    conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(plants))
  end

  get "/:plantcode" do
    id = conn.params["plantcode"]
    plant = PlantContext.get_one_plant!(id)
    conn
      |> put_resp_content_type("application/json")
      |> send_resp(201, Jason.encode!(%{plant: plant}))
  end

  post "/create" do
    PlantContext.create_plant(conn.body_params)
      conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(%{message: "Nieuwe plant succesvol aangemaakt!"}))
  end

  put "/update/:plantcode" do
    id = conn.params["plantcode"]
    plant = PlantContext.get_one_plant!(id)
    PlantContext.update_plant(plant, conn.body_params)
    conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(%{message: "Plant succesvol bewerkt."}))
  end

  delete "/delete/:plantcode" do
    id = conn.params["plantcode"]
    plant = PlantContext.get_one_plant!(id)
    PlantContext.delete_plant(plant)
    conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(%{message: "Plant sucesvol verwijderd."}))
  end
end
