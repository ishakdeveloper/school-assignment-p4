defmodule Plants.Repo do
  use Ecto.Repo,
    otp_app: :api,
    adapter: Ecto.Adapters.MyXQL
end
