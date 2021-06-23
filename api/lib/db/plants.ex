defmodule DB.PlantContext do
  # TODO: Alles overzetten naar aparte mutations folder
  import Ecto.Query, warn: false
  alias DB.Schemas.PlantSchema
  alias Plants.Repo

  def get_plants do
    PlantSchema |> Repo.all
  end

  # id is plantcode
  def get_one_plant!(id), do: Repo.get!(PlantSchema, id)

  def create_plant(attrs \\ %{}) do
    %PlantSchema{}
      |> PlantSchema.changeset(attrs)
      |> Repo.insert()
  end

  def update_plant(%PlantSchema{} = plant, attrs \\ %{}) do
    plant
      |> PlantSchema.changeset(attrs)
      |> Repo.update()
  end

  def delete_plant(%PlantSchema{} = data) do
    Repo.delete!(data)
  end
end
