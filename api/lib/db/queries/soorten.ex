defmodule DB.Queries.Soorten do
  import Ecto.Query, warn: false

  def get_all_soorten do
    from(p in DB.Schemas.PlantSchema, distinct: true, select: p.soort, where: not is_nil(p.soort))
  end
end
