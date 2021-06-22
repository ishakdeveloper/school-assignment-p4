defmodule DB.Schemas.LeverancierSchema do
  use Ecto.Schema
  import Ecto.Changeset

  @items [:levcode, :levnaam, :levadres, :levwoonplaats]
  @derive {Jason.Encoder, only: @items}

  schema "leverancier" do
    field :levcode, :integer, primary_key: true
    field :levnaam, :string
    field :levadres, :string
    field :levwoonplaats, :string
  end

  def changeset(leverancier, attrs) do
    leverancier
      |> cast(attrs, @items)
  end
end
