defmodule DB.Schemas.BestellingSchema do
  use Ecto.Schema
  import Ecto.Changeset

  @items [:bestelnr, :levcode, :besteldatum, :leverdatum, :bedrag]
  @derive {Jason.Encoder, only: @items}

  schema "bestelling" do
    field :bestelnr, :integer
    field :levcode, :integer
    field :besteldatum, :naive_datetime
    field :leverdatum, :naive_datetime
    field :bedrag, :float
  end

  def changeset(bestelling, attrs) do
    bestelling
      |> cast(attrs, @items)
      |> validate_required(@items)
  end
end
