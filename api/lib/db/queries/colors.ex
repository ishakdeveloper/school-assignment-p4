defmodule DB.Queries.Colors do
  import Ecto.Query, warn: false

  def get_all_colors do
    from(p in DB.Schemas.PlantSchema, distinct: true, select: p.kleur, where: not is_nil(p.kleur))
  end
end
