defmodule Api.Application do
  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      OTP.Supervisors.Plant,
      {Plants.Repo, []},
      Plug.Cowboy.child_spec(scheme: :http, plug: Api, options: [port: String.to_integer("4000"), dispatch: dispatch()])
    ]

    opts = [strategy: :one_for_one, name: Api.Supervisor]

    Logger.info "Server started!"

    Supervisor.start_link(children, opts)
  end

  defp dispatch do
    [
      {:_,
        [
          {"/ws", Web.SocketHandler, []},
          {:_, Plug.Cowboy.Handler, {Api, []}}
        ]
      }
    ]
  end
end
