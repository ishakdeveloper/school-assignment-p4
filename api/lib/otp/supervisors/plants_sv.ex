defmodule OTP.Supervisors.Plant do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg)
  end

  @impl true
  def init(_init_arg) do
    children = [
      {OTP.PlantServer, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
