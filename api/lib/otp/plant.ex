defmodule OTP.PlantServer do
  use GenServer

  @name __MODULE__

  defmodule State do
    @type t :: %__MODULE__{
      plantcode: String.t(),
      plantnaam: String.t(),
      soort: String.t(),
      hoogte: String.t(),
      bloeitijd_start: String.t(),
      bloeitijd_einde: String.t(),
      prijs: String.t()
    }

    defstruct plantcode: nil,
              plantnaam: nil,
              soort: nil,
              hoogte: nil,
              bloeitijd_start: nil,
              bloeitijd_einde: nil,
              prijs: nil
  end

  # CLIENT #################################################################

  def start_link(init) do
    GenServer.start_link(@name, init, name: @name)
  end

  def list() do
    GenServer.call(@name, {:list})
  end

  def add(plant) do
    GenServer.cast(@name, {:add, plant})
  end

  def edit(id, plant) do
    GenServer.call(@name, {:edit, id, plant})
  end

  def remove(id) do
    GenServer.call(@name, {:remove, id})
  end

  # SERVER #################################################################

  def init(init) do
    {:ok, struct(State, init)}
  end

  def handle_call({:list}, _from, state), do: {:reply, state, state}
  def handle_cast({:add, plant}, state) do
    state = [plant | state]
    {:noreply, state}
  end
end
