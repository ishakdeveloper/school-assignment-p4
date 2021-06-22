defmodule DB.Schemas.LeverancierAssortimentSchema do
  use Ecto.Schema
  import Ecto.Changeset

  @items [:levcode, :artcodelev, :plantcode, :levertijd, :prijs]
  @derive {Jason.Encoder, only: @items}

  schema "leverancier_assortiment" do
    field :levcode, :integer, primary_key: true
    field :artcodelev, :string, primary_key: true
    field :plantcode, :integer
    field :levertijd, :integer
    field :prijs, :float
  end

  def changeset(leverancier_assortiment, attrs) do
    leverancier_assortiment
      |> cast(attrs, @items)
  end
end
