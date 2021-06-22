defmodule DB.Schemas.BestelregelSchema do
  use Ecto.Schema
  import Ecto.Changeset

  @items [:bestelnr, :artcodelev, :aantal, :bestelprijs]
  @derive {Jason.Encoder, only: @items}

  schema "bestelregel" do
    field :bestelnr, :integer, primary_key: true
    field :artcodelev, :string, primary_key: true
    field :aantal, :integer
    field :bestelprijs, :float
  end

  def changeset(bestelregel, attrs) do
    bestelregel
      |> cast(attrs, @items)
  end
end
