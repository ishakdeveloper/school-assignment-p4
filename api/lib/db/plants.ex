defmodule DB.PlantContext do
  import Ecto.Query, warn: false
  alias DB.Schemas.PlantSchema
  alias Plants.Repo

  def get_plants do
    PlantSchema |> Repo.all
  end
end
