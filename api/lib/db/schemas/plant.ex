defmodule DB.Schemas.PlantInfoSchema do
  use Ecto.Schema
  import Ecto.Changeset

  @items [:categorie, :minimumhoogte, :maximumhoogte, :afstand]
  @derive {Jason.Encoder, only: @items}

  schema "plantschema" do
    field :categorie, :string
    field :minimumhoogte, :integer
    field :maximumhoogte, :integer
    field :afstand, :integer
  end

  def changeset(plantschema, attrs) do
    plantschema
      |> cast(attrs, @items)
  end
end
