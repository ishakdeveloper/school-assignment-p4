defmodule DB.Schemas.PlantSchema do
  use Ecto.Schema
  import Ecto.Changeset

  @items [:plantcode, :plantnaam, :soort, :kleur, :hoogte, :bloeitijd_start, :bloeitijd_einde, :prijs]
  @derive {Jason.Encoder, only: @items}

  @primary_key {:plantcode, :id, autogenerate: true}
  schema "plant" do
    field :plantnaam, :string
    field :soort, :string
    field :kleur, :string
    field :hoogte, :integer
    field :bloeitijd_start, :integer
    field :bloeitijd_einde, :integer
    field :prijs, :float
  end

  def changeset(plant, attrs) do
    plant
      |> cast(attrs, @items)
      |> validate_required(@items)
  end
end
